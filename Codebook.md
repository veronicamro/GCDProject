Getting and Cleaning Data - Project
===================================

Code Book
=========

Introduction
------------

This document describes the variables, the data, and any transformations
or work that performed to clean up the data for the project described in
README.md, permormed into the script **run\_analysis.R**.

Idea
----

One of the most exciting areas in all of data science right now is
wearable computing - see for example this article . Companies like
Fitbit, Nike, and Jawbone Up are racing to develop the most advanced
algorithms to attract new users. The data linked to from the course
website represent data collected from the accelerometers from the
Samsung Galaxy S smartphone.

A full description is available
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones),
where the data was obtained.

Data set location
-----------------

Data for the project can be downloaded following this
[link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Input data
----------

Data comes with the following files:

-   **X\_train.txt** contains variable features that are intended
    for training.
-   **y\_train.txt** contains the activities corresponding to
    **X\_train.txt**.
-   **subject\_train.txt** contains information on the subjects from
    whom data is collected.
-   **X\_test.txt** contains variable features that are intended
    for testing.
-   **y\_test.txt** contains the activities corresponding to
    **X\_test.txt**.
-   **ubject\_test.txt** contains information on the subjects from whom
    data is collected.
-   **activity\_labels.txt** contains metadata on the different types
    of activities.
-   **features.txt** contains the name of the features in the data sets.

Variables and transformations
-----------------------------

Data files are read through variables described into the table beloow:

<table>
<thead>
<tr class="header">
<th align="left">Variable</th>
<th align="left">File</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">featTrain</td>
<td align="left">X_train.txt</td>
</tr>
<tr class="even">
<td align="left">featTest</td>
<td align="left">X_test.txt</td>
</tr>
<tr class="odd">
<td align="left">actTrain</td>
<td align="left">y_train.txt</td>
</tr>
<tr class="even">
<td align="left">actTest</td>
<td align="left">y_test.txt</td>
</tr>
<tr class="odd">
<td align="left">subjTrain</td>
<td align="left">subject_train.txt</td>
</tr>
<tr class="even">
<td align="left">subjTest</td>
<td align="left">subject_test.txt</td>
</tr>
<tr class="odd">
<td align="left">features</td>
<td align="left">features.txt</td>
</tr>
<tr class="even">
<td align="left">activity_labels</td>
<td align="left">activity_labels.txt</td>
</tr>
</tbody>
</table>

Merging
-------

<table>
<thead>
<tr class="header">
<th align="left">Variable</th>
<th align="left">Files merged</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">concSubject</td>
<td align="left">subject_train.txt and subject_test.txt (i.e. subjects in training and test set data)</td>
</tr>
<tr class="even">
<td align="left">concActivity</td>
<td align="left">y_train.txt and actTest (i.e. activities in training and test set data)</td>
</tr>
<tr class="odd">
<td align="left">concFeatures</td>
<td align="left">X_train.txt and X_test (i.e. features of test and training data)</td>
</tr>
<tr class="even">
<td align="left">colCombine</td>
<td align="left">Merge columns to get the data frame <code>Data</code> for all data</td>
</tr>
<tr class="odd">
<td align="left">Data</td>
<td align="left">Features, Activities and Subjects are merged altogether</td>
</tr>
</tbody>
</table>

Set Names to Variables
----------------------

<table>
<thead>
<tr class="header">
<th align="left">Names</th>
<th align="left">Input Files</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Subject</td>
<td align="left">concSubject</td>
</tr>
<tr class="even">
<td align="left">Activities</td>
<td align="left">concActivity</td>
</tr>
<tr class="odd">
<td align="left">Features</td>
<td align="left">concFeatures</td>
</tr>
</tbody>
</table>

Extract the mean and standard deviation
---------------------------------------

-   Variable **extMeanAndSD** for mean and SD
-   Variable **dNames** is used for merging mean/SD with Subjects and
    Activities

Uses descriptive activity names to name the activities in the data set
----------------------------------------------------------------------

-   Variable **actName** is used for reading activities tags from the
    file **activity\_labels.txt**

Appropriately labels the data set with descriptive variable names
-----------------------------------------------------------------

<table>
<thead>
<tr class="header">
<th align="left">Label</th>
<th align="left">Name</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">t</td>
<td align="left">Time</td>
</tr>
<tr class="even">
<td align="left">f</td>
<td align="left">Frequency</td>
</tr>
<tr class="odd">
<td align="left">Acc</td>
<td align="left">Accelerometer</td>
</tr>
<tr class="even">
<td align="left">Gyro</td>
<td align="left">Gyroscope</td>
</tr>
<tr class="odd">
<td align="left">Mag</td>
<td align="left">Magnitude</td>
</tr>
<tr class="even">
<td align="left">BodyBody</td>
<td align="left">Body</td>
</tr>
</tbody>
</table>

Create a second, independent tidy data set with the average
-----------------------------------------------------------

-   variable **preFinalData** splits data into meaningful subsets
    (Subject, activity, data, mean)

-   variable **finalData** orders data
-   finally write the tidied data into the file **tidy\_data.txt**
