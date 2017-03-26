# Instructions to run the workshop image on your laptop 
This is a good option if you prefer to work locally, and will bring your own laptop to the workshop.

### Why do you recommend using Docker?
If you use the Docker image, you won't have to spend time installing any other libraries or dependencies. The image is configured to work out-of-the-box. You will, of course, have to install Docker, and learn how to use it.

### These instructions will show you how to:

* Download the image and start a container

* Copy files between your filesystem and the running container

* Start an IPython notebook server inside the container, and connect to it using a web browser on your laptop

### Troubleshooting
If you're stuck, see the Cloud-based [installation](install-cloud.md) guide for an alternative.

## Step 1: Install Docker on your laptop
Visit [docker.com](https://www.docker.com) to download and install Docker on your laptop. Docker is available for Linux, Mac, and Windows.

Note: the following instructions are written assuming you're using either Linux or Mac. They have not been tested for Windows. If you're using Windows, you may have to modify the syntax slightly for your terminal. For more details on the following commands, see Docker's [getting started guide](https://docs.docker.com/learn/).

## Step 2: Download the container image
Once Docker is installed and running on your laptop: open a terminal, and download the workshop image using this command.

```
$ docker pull randomforests/wtm:v1 
```

Note: this is a large download. You should see a progress bar with an ETA. Now might be a good time to get a cup of coffee. 

## Step 3: Create a shared directory

During the workshop, you'll want to copy data between your laptop and the running container. But, by default, the container's filesystem is isolated from your machine.

So you can share data, create a directory on your laptop, and mount it as a volume when you start the container. Any data inside this folder will be accessible to both your laptop and the container. First, let's create the shared directory:

```
$ mkdir ~/shared
```

Above, we're creating a directory called ```shared``` inside your home folder. Feel free to use a different path.


## Step 4. Start the container

In this step, we'll start the container. We'll use command line arguments to mount your shared directory, and to open a port we'll need later. Run this command:

For SELinux enabled systems, before running the docker command do:
```
sudo set enforce 0
```

``` 
$ docker run -it -p 8888:8888 -v ~/shared:/workshop/shared randomforests/wtm:v1
```
Long command, right? Here's an explanation of the arguments.

* ```-v ~/shared:/workshop/shared``` mounts ```~/shared``` on your laptop as ```/workshop/shared``` inside the container.

* ```-p 8888:8888``` forwards port 8888 on your laptop to port 8888 on the container (this is so we can connect to an IPython notebook server running inside the container, more on that soon).

* ```-it``` attaches your terminal to the container.

Note: at this point, your terminal prompt will change to resemble something like this.

```
root@425ba3fc00bd:/workshop/scripts#
```

That means your terminal is connected to the running container. Any commands you run in this window will be run inside the container. Try ```ls``` for example, and you should see a list of example scripts.

Now would be a good time to open another terminal window, so you can run terminal commands on your laptop per usual.

If you'd like to exit the container and return to your usual terminal, type ```exit```. (You can start the container again with the above command). 

## Step 5. Practice copying files between your laptop and the container
In this step, we will practice copying files to the running container, and back again.

Note, in the following instructions: 

* A command prompt beginning with ```#``` indicates a command you should run on the terminal connected to the running container

* A command prompt beginning with ```$``` indicates a command your should run on the terminal connected to your laptop

**Step 5a)** Add a file to the shared directory on your laptop, then verify you can see it from inside the container.

1. Use a web browser to download your favorite [image](https://upload.wikimedia.org/wikipedia/commons/a/af/Cara_de_quem_caiu_do_caminh%C3%A3o..._%28cropped%29.jpg) from the web.

2. Save it to the shared directory you created in *Step 3* (by default, ```~/shared```). 

3. From the terminal connected to the container, run ```# ls /workshop/shared/```. You should see your image. This is because ```~/shared``` is mounted inside the container as ```/workshop/shared```. If you do not see your image, return to *Step 4* and check that you mounted the shared directory correctly when you started the container.

**Step 5b)**  Create a file inside the shared directory using the container, then verify you can see it on your laptop.

* From the terminal connected to the container, run ```# touch /workshop/shared/foo.bar```. This will create an empty file called *foo.bar*.

* On your laptop, you should now see *foo.bar* inside ```~/shared```. Feel free to delete it.

Note: any data you create inside the container that you *do not* copy to the shared directory will be lost when you stop the container. So be sure to copy out any images you create that you'd like to keep during the workshop.

## Step 6. Start an IPython Notebook server

In this step, we will start an IPython Notebook server that runs inside the container. We will then connect to it using a web browser on your laptop.

**Step 6a)** Start the notebook server.

```
# cd /workshop/scripts
# sh notebook.sh
```

You will see output on your terminal to indicate the server is running. Later, if you want to stop the notebook server, press *Control-C*. 

**Step 6b)** Copy the login token

Notice the second from the last line contains a login token. Copy this; you will need it in a moment to connect to the server. *Note:* it will be different each time you start the server.

![Token](../images/token.png?raw=true)

**Step 6c)** Use a web browser to connect to the server

Open a web browser on your laptop. Enter ```localhost:8888``` in the address bar.

Your browser window should look like this. 

![Login screen](../images/login.png?raw=true)

Paste the login token you coped in the previous step to connect to the server. Your window should now look like this.

![A picture of a directory in a web browser](../images/notebook.png?raw=true)

You can now close your browser window, and stop the notebook server on the container.

## That's it!
You now know all the commands you need to use the Docker container for this workshop. To stop the container, type

```# exit```

And start it again later using the command in *Step 4*. 

### Finished installing?
Preview the [exercise](exercises.md) instructions, if you like.
