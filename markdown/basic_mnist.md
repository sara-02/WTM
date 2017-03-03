## MNIST Exercise

### Prework

Before starting this exercise, please make sure you have installed and started the Docker container, as described in the [local](install-local.md) or [Cloud](install-cloud.md) instructions.

**Learn how to use a Jupyter Notebook**

During this exercise, you will edit and run code using [Jupyter](https://www.jupyter.org/) notebooks. If you're new to these, please try this quick [tutorial](https://try.jupyter.org/) to learn the ropes. After following the link, click on the "Welcome to Python" notebook. 

Here's a TL;DR of the key concepts:

* A notebook is similar to an IDE that runs inside a web browser. It's connected to a Python backend that executes your code. In our case, the Python backend runs inside the Docker container. After the code finishes executing, results are returned and displayed in the browser.

* A notebook is composed of two types of *cells*. A *markdown* cell contains, well, markdown. A *code* cell contains - you guessed it - code. 

* Cells can be *executed*. To execute a cell, select it and press *shift + enter*. Alternatively, you can click the "Play" button on the notebook's UI. Executing a markdown cell will cause your browser to render it. Executing a code cell will send the code to the Python backend. Your browser will then display the results.

* Cells can be *edited*. To edit a cell, select it, and start typing.

* One nice thing to know is how to recover if your notebook encounters problems. You can restart a notebook to restore everything to a clean slate, by clicking on the *Kernel* menu, then selecting *Restart*. This will clear all output from the cells, and clear all variables from memory.

### Instructions

In this exercise, we will examine TensorFlow code to train a basic classifier to recognize handwritten digits, using the classic MNIST dataset. We will run code in a series of five notebooks, and you will read a [tutorial](https://www.tensorflow.org/get_started/mnist/beginners) along the way. First, let's get setup to run the notebooks.

### Step 1. Start and connect to the notebook server

Start the notebook server inside the running container, then to connect to it using a web browser. Here's how:

* If you are running the container locally, see step #6 of these [instructions](install-local.md).

* If you are running the container in a Cloud-VM, see step #7 of these [instructions](install-cloud.md).

### Step 2. Open the first notebook 

After you connect to the notebook server, click on the *notebooks* folder, then open *1_tf_contrib_learn.ipynb*.

![Token](../images/notebook_1.png?raw=true)

Once you've opened the notebook, your screen should look similar to this:

![Token](../images/notebook_1_open.png?raw=true)

TensorFlow has both high-level and low-level APIs. To see what a high-level API looks like in action, you will run code in this notebook that demos using *tf.contrib.learn*.

* The goal is to give you a quick overview of the common steps of solving a supervised classification problem. These are downloading a dataset, splitting it into *train* and *test*, then *training* and *evaluating* a classifier. This notebook also shows you how to understand the format of the dataset, and how to visualize digits using matplotlib. 

* To learn more about each of the steps, you can watch this short video [tutorial](https://www.youtube.com/watch?v=Gj0iyo265bc) which uses similar code. 

* To use the notebook, click on each code cell, execute it, and try to understand the purpose of the step. At the end is a short optional exercise. 

We recommend you spend about *10 minutes* on this notebook.

### Step 3. Read a tutorial, then work through the second notebook

Now that you've seen a quick demo of a high-level API, it's time to learn more about how TensorFlow works under the hood. We **recommend** you read this [tutorial](https://www.tensorflow.org/get_started/mnist/beginners) which explains how to use TensorFlow's lower-level API to solve this same problem. This tutorial goes into more depth than the previous notebook and video.

* After you read the tutorial, run the code in the notebook, following the instructions to uncomment cells in order to understand what each of the lines does. 

* At the end is a short exercise. It may be difficult if you're new to TensorFlow, only because it involes new programming concepts. The third notebook contains a solution.

We recommend you spend about *35 minutes* between reading the tutorial and going over this notebook.

### Step 4. Work through the fourth notebook

Previously, we used a linear classifier. This notebook contains code that shows how to write a single layer neural network. At the end is an exercise to extend it to a deep neural network. The fifth notebook contains a solution.

*Note* the code in these notebook was written for TensorFlow v0.12rc. Recently, TensorFlow version 1.0 was released (woohoo!) The repo hasn't been updated yet, but since we're running inside a Docker image, it should work out of the box.