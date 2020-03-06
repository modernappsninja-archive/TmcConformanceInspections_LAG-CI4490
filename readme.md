# Tanzu Mission Control - Conformance Inspections Lab Guide

**Contents:**

- [Tanzu Mission Control - Conformance Inspections Lab Guide](#tanzu-mission-control---conformance-inspections-lab-guide)
  - [Introduction](#introduction)
    - [Before Attempting This Lab:](#before-attempting-this-lab)
    - [Environment Pre-Requisites](#environment-pre-requisites)
  - [Lab Exercises](#lab-exercises)
    - [Inspection Types](#inspection-types)
      - [Conformance](#conformance)
      - [Lite](#lite)
      - [Step 1: Open the Cluster detail page](#step-1-open-the-cluster-detail-page)
      - [Step 2: Select the inspection type that you want to run](#step-2-select-the-inspection-type-that-you-want-to-run)
      - [Step 3: Viewing an inspection](#step-3-viewing-an-inspection)
      - [Step 4: Downloading the Inspection Tarball](#step-4-downloading-the-inspection-tarball)
      - [Step 5 : Deleting an Inspection](#step-5--deleting-an-inspection)
      - [Step 6: Running another Inspection](#step-6-running-another-inspection)
      - [Step 7 :Viewing all the Inspections in an Org](#step-7-viewing-all-the-inspections-in-an-org)
    - [Understanding the Inspection Tarball](#understanding-the-inspection-tarball)
    - [Validate Lab Guide](#validate-lab-guide)

## Introduction

This document is intended to provide a guide to exploring basic usages of inspection in TMC through its UI.

### Before Attempting This Lab:

This lab has a completion difficulty of `Partial`. Please see the rubrik below for an explanation of lab completion difficulty rankings

Lab Completion Difficulty Rankings:

- Difficulty Levels:
  - `Complete`
    - A lab guide with a difficulty of `Complete` includes comprehensive, click-by-click instructions, usually with a screenshot for every command entered. Complete labs must be associated with an online lab environment fully prepped to execute the exact instructions provided in the lab guide. Most users could successfully execute the steps in a `Complete` lab guide, even if they do not have expertise in the subject, by following detailed instructions.
  - `Partial`
    - A lab guide with a difficulty of `Partial` includes full instructions to complete the exercise, with enough detail to where a user with moderate experience in the subject matter could complete the exercise. `Partial` lab guides provide a level of detail similar gto most typical technical documentation, where the user is expected to be able to configure their lab environment with dependencies required for the exercise, and to contextualize general instructions to the users own environment. 
  - `Challenge`
    - A lab guide with a difficulty of `Challenge` is designed to be technically challenging for the guide's target audience to complete. `Challenge` lab guides do not include comprehensive instructions, and intentionally leave out details required to complete exercises as a challenge or test of the users proficiency in a topic.

### Environment Pre-Requisites

The demo in this document is conducted with a development TMC stack in which a Kind cluster is attached. 

In order to demonstrate starting and viewing an inspection a kind cluster (demo-cluster) is attached under the default cluster group. 

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-22-08.png">
</details>

## Lab Exercises

### Inspection Types

#### Conformance 

This inspection ensures that a cluster conforms to official Kubernetes Specifications. This inspection can take upto 4 hours depending on the size of the cluster. Every version of Kubernetes has a different set of conformance tests that need to be run to ensure that the cluster is conformant. This is taken into consideration whenever a new conformance inspection is run. 

#### Lite

This inspection is a quick way to ensure that the cluster inspection component is functional. It runs a single test case and usually finishes in a couple of minutes. 

#### Step 1: Open the Cluster detail page

Click on Run Inspection on the cluster detail page

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-27-35.png">
</details>

#### Step 2: Select the inspection type that you want to run 

Choose the type of inspection and click Run Inspection

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-30-43.png">
</details>

#### Step 3: Viewing an inspection

Once you have started an inspection on a cluster you can view all the inspection on that cluster by going to the inspection tab on the cluster detail page.

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-31-16.png">
</details>

Here you can see the lite inspection that we just started which is in progress. 

Once the inspection is complete the result will update to either a Success or Failure. To see more detail about the inspection click on the result.

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-33-28.png">
<img src="media/2020-03-05-16-32-44.png">
</details>

In case of failure, the detailed inspection page will be able to show which test failed and a little detail about why it failed. 

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-34-26.png">
</details>

#### Step 4: Downloading the Inspection Tarball

For every inspection run, you can download the tarball which will provide more detail as to what tests were run and in case of failure what was the case for the failure. 

To download the inspection tarball go to the inspection tab on the cluster detail page and click Actions → Download

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-35-16.png">
</details>

#### Step 5 : Deleting an Inspection

To delete an inspection navigate to the inspection detailed page.

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-36-49.png">
<img src="media/2020-03-05-16-37-00.png">
</details>

and click Actions → Delete 

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-37-40.png">
</details>

#### Step 6: Running another Inspection

Click on the Run Inspection on the Inspection Tab of the Cluster Detail page

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-38-18.png">
</details>

#### Step 7 :Viewing all the Inspections in an Org 

On the left column click on the Inspection tab. This will list out all the inspections in an Org across all clusters.

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-40-22.png">
</details>

This list view also allows filtering and sorting on the columns. So for example it supports filtering out only Lite scans.

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-41-35.png">
</details>

The next image shows sorting descending based on start time. 

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-42-34.png">
</details>

### Understanding the Inspection Tarball

The inspection tarball contains more in-depth information as to what tests were run, what were the failures as well as the logs generated as part of the tests that ran. 

There are some files that are most relevant to figure out details about each scan

<details><summary>Screenshot</summary>
<img src="media/2020-03-05-16-44-10.png">
</details>

Within the tarball there is a subdirectory for every plugin that ran tests as part of the inspection scan. Inside that subdirectory navigate to the results folder. This folder contains the files e2e.log and junit_01.xml.

- e2e.log file contains the logs that were captured from the aggregator pod running on the cluster.
- junit_01.xml file provide detailed information on the entire list of test cases on the test suite that was run. It provides a list of all skipped, passed or failed test cases. In case of failure it will also capture the relevant logs for the test case. 


### Validate Lab Guide

If you were able to complete this lab successfully without any significant problems, please sign the [validate.md](./validate.md) file located in this directory. 

If you encountered any problems or have suggestions or feature requests, please open an issue ticket on this repository. 

If you have any updates or improvements for this lab guide, please open a PR with your updates.

**Thank you for completing the Tanzu Mission Control - Conformance Inspections Lab Guide!**