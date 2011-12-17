#! /bin/bash

echo "Download the wikipedia data (2.5G) ..."
mvn antrun:run -D DownloadData

echo "Building the examples ..."
mvn clean install

echo "Split the wikipedia file into chunks and put into target ..."
mvn exec:java antrun:run -D SplitXmlFile

echo "Running the taste demos ..."
mvn exec:java -D UserDemo
mvn exec:java -D ItemItemDemo
mvn exec:java -D ItemRecDemo
mvn exec:java -D ItemSimilarityDemo

echo "Running k-means on data ... "
#mvn exec:java -D KMeansDemo

echo "Running the classifier demos ..."
mvn exec:java -D PrepClassification4Train
mvn exec:java -D PrepClassification4Test
mvn exec:java -D TrainClassifier
mvn exec:java -D TestClassifier
mvn exec:java -D TestClassifierVerbose
