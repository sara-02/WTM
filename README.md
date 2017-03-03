# Welcome to the workshop

* [Agenda](#agenda)
* [Installation instructions](#install)
* [Exercise instructions](#exercise)
* [Next steps](#next)

# Agenda <a name="agenda"></a>

During this workshop, you'll explore two approaches to Style Transfer, a technique that blends the *style* of an image with the *content* of another. You'll create beautiful artwork like this:

<p align="center">
<img src = 'images/ex1.jpg' height='400px'>
<br/>
Created using <a href="https://github.com/tensorflow/magenta/tree/master/magenta/models/image_stylization">Magenta<a/>
</p>

<p align="center">
<img src = 'images/ex2.jpg' width='600px'>
<br/>
Created using <a href="https://github.com/lengstrom/fast-style-transfer/">Fast Style Transfer<a/>
</p>

As time remains, you'll also gain experience writing a basic TensorFlow program. We'll work with (you guessed it) handwritten digits. That said, our main goal is to get you started exploring Style Transfer - because - it's awesome.

<p align="center">
<img src = 'images/digit.png' width='28px'>
<br/>
Good olde MNIST
</p>

<a name="install"></a>
# Installation instructions
Our goal is to make it as easy as possible for you to participate in the workshop. 

You can either bring a laptop, or you may use a loaner Chromebook we provide on site. Either way, please install the software you need in advance (either on your laptop, or, by preparing a Cloud VM) as described in these instructions.

The easiest way is to use a Docker image we provide. 

<a name="option1"></a>
### Option 1: Use our Docker image on your laptop

If you are bringing a laptop and want to install everything you need locally, please see these [instructions](markdown/install-local.md) to learn how to install and use the Docker image on your laptop. 

<a name="option2"></a>
### Option 2: Use our Docker image in the Cloud

If you are using a loaner Chromebook, or prefer to work in the Cloud, please see these [instructions](markdown/install-cloud.md) to learn how to configure a Cloud-based VM, and how to install and use the Docker image on it.

### Option 3: Install TensorFlow directly on your laptop
If you are an experienced developer and prefer not to use Docker, you may install the libraries you need [manually](markdown/install-manual.md).

<a name="exercise"></a>
# Exercise instructions
Finished installing? Great! Preview the [exercise](markdown/exercises.md) instructions.

<a name="next"></a>
# Next steps

### Want to learn more about Style Transfer?
Awesome. Check out these two pages for papers and code:

* [Project Magenta: Image Stylization](https://github.com/tensorflow/magenta/tree/master/magenta/models/image_stylization)

* [Fast Style Transfer](https://github.com/lengstrom/fast-style-transfer/)

### Hungry for more open source projects?
Perhaps you'd like to:

* [Generate music](https://magenta.tensorflow.org/2016/11/09/tuning-recurrent-networks-with-reinforcement-learning/)
* [Parse sentences](https://research.googleblog.com/2016/05/announcing-syntaxnet-worlds-most.html)

### Want to report a bug?
Thanks! Can you please file an issue, or even better, a pull request? We'll be doing this workshop a couple times, and future developers will appreciate your help.

- - -
General disclaimer, this is my personal repo and not an official Google product.