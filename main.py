import torch
from datasets import load_dataset
import pandas as pd
from transformers import AutoTokenizer, DataCollatorWithPadding, AutoModelForSequenceClassification, TrainingArguments, Trainer
import evaluate
import numpy as np


def main():
    imdb = load_dataset("imdb")
    imdb["test"][0]

    """ load a DistilBERT tokenizer to preprocess the text field """
    tokenizer = AutoTokenizer.from_pretrained("distilbert-base-uncased")

    """ Create a preprocessing function to tokenize text and truncate
    sequences to be no longer than DistilBERT’s maximum input length """
    def preprocess_function(examples):
        return tokenizer(examples["text"], truncation=True)

    """ To apply the preprocessing function over the entire dataset, use
    🤗 Datasets map function. You can speed up map by setting batched=True
    to process multiple elements of the dataset at once: """
    tokenized_imdb = imdb.map(preprocess_function, batched=True)

    """ create a batch of examples using DataCollatorWithPadding. It’s more
    efficient to dynamically pad the sentences to the longest length in a
    batch during collation, instead of padding the whole dataset to the maximum length. """
    data_collator = DataCollatorWithPadding(tokenizer=tokenizer)

    """ Setup validation before training """
    accuracy = evaluate.load("accuracy")

    """ create a function that passes your predictions and labels to compute to calculate the accuracy: """
    def compute_metrics(eval_pred):
        predictions, labels = eval_pred
        predictions = np.argmax(predictions, axis=1)


        return accuracy.compute(predictions=predictions, references=labels)

    """ Before training, create a map of the expected ids to their labels with id2label and label2id: """
    id2label = {0: "NEGATIVE", 1: "POSITIVE"}
    label2id = {"NEGATIVE": 0, "POSITIVE": 1}


    """ Load DistilBERT with AutoModelForSequenceClassification along with the number of expected labels, and the label mappings: """
    model = AutoModelForSequenceClassification.from_pretrained(
        "distilbert-base-uncased", num_labels=2, id2label=id2label, label2id=label2id
    )

    """ Define training hyper parameters """
    training_args = TrainingArguments(
        output_dir="my_awesome_model",
        learning_rate=2e-5,
        per_device_train_batch_size=16,
        per_device_eval_batch_size=16,
        num_train_epochs=2,
        weight_decay=0.01,
        evaluation_strategy="epoch",
        save_strategy="epoch",
        load_best_model_at_end=True,
        push_to_hub=False,
    )

    trainer = Trainer(
        model=model,
        args=training_args,
        train_dataset=tokenized_imdb["train"],
        eval_dataset=tokenized_imdb["test"],
        tokenizer=tokenizer,
        data_collator=data_collator,
        compute_metrics=compute_metrics,
    )

    trainer.train()


    return 0

if __name__ == '__main__':
    main()
