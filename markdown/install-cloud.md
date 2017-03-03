# Instructions to run the workshop image on the Cloud 
This is a good option if you are using a loaner Chromebook at the workshop, or if you prefer to work in the Cloud. These instructions will show you how to start a Google Compute Engine (GCE) VM with Docker installed, and how to run the container there.

<a name="create"></a>
## Initial setup

### 1. Create a Google Cloud Platform account

Sign up for a [free trial](https://cloud.google.com/free-trial/) of Google Cloud Platform (GCP). You will need a credit card to sign up, and you will receive $300 of free credits. *Note:* you will not be billed, unless you decide to renew after the trial ends. 
* If you already have an account, or have run through your trial credits, see one of the workshop instructors. We will give you additional credits to apply to your account.

**Important note:** the author of this workshop is not interested in selling you Cloud services. If you prefer, feel free to use an alternative Cloud provider. The following instructions are written assuming you are using Google Cloud.

#### 1.1 Enable the necessary APIs

1. Go to the Google Cloud console: console.cloud.google.com
1. Select or create a project using the project drop-down at upper-left ('My First Project' in image below)
1. Click on the “hamburger” menu at upper-left, and then “API Manager”.
1. On the left nav, choose "Dashboard" if not already selected, then choose "+Enable API" in the top-middle of page.
1. Enter "Google Compute Engine API" in the search box and click it when it appears in the list of results.
1. Click on “Enable” (top-middle of page).

![Hamburger menu](../images/hamburger.png)  

![API Manager](../images/api_manager.png)

### 2. Connect to your project's Cloud Shell

Click on the Cloud Shell icon (leftmost icon in the set of icons at top-right of the page).

![Cloud Shell](../images/cloudshell2.jpg)

Click on "Start Cloud Shell" on the bottom right of the pop-up screen. You should now see a terminal at the bottom of your window for the Cloud Shell with the text "Welcome to Cloud Shell! Type "help" to get started."

### 3. Create a container-optimized image in GCE

Run this command in the Cloud Shell.

```shell
gcloud compute instances create workshop \
    --image-family gci-stable \
    --image-project google-containers \
    --zone us-central1-b --boot-disk-size=100GB \
    --machine-type n1-standard-1
```

After you run this command, you can ignore the "I/O performance warning for disks < 200GB".

### 4. Set up a firewall rule for your project that will allow access to the IPython notebook server

```shell
gcloud compute firewall-rules create workshop --allow tcp:8888
```

### 5. SSH into the new GCE instance, in a new browser window

- Click on the “hamburger” menu at upper-left, and then “Compute Engine”
- Find your instance in the list (mid-page)
- Write down the "External IP", this is the IP of your Cloud instance
- Logon to instance by clicking on the “SSH” pulldown menu on the right. Select “Open in browser window”.
- A new browser window will open, with a command line into your GCE instance. Confirm that you wish to initiate an SSH connection to the instance.

### 6. Start the Docker container in the GCE image (in the newly opened SSH browser window):

Run this command to download and run the container, mounting ```~/shared``` on your instance as ```~/workshop/shared``` inside the running container.

```shell
mkdir ~/shared
docker run -v ~/shared:/workshop/shared -it -p 8888:8888 randomforests/wtm:v1
```

### 7. Start a notebook server inside the running container (in the newly opened SSH browser window):

In this step, we will start an IPython Notebook server that runs inside the container. We will then connect to it using a web browser on your laptop (or Chromebook). 

*Note:* we will use IPython notebooks for a coding exercise, and as an easy way to copy images you create from the Cloud VM to your Chromebook using a UI (this is a bit of a hack, but what the hey).

**Step 7a)** Start the notebook server.

```
# cd /workshop/scripts
# sh notebook.sh
```

You will see output on your terminal to indicate the server is running. If you want to stop the notebook server later, press *Control-C* (but do not do this now, we'll need it running in the next step)

**Step 7b)** Copy the login token.

Notice the second from the last line contains a login token. Copy this; you will need it in a moment to connect to the server.

![Token](../images/token.png?raw=true)

**Step 7c)** Use a web browser on your laptop or Chromebook to connect to the server

Open a web browser on your laptop. Use the "External IP" from step #5 followed by :8888, i.e. ```<External_IP>:8888``` in the address bar.

Your browser window should look like this. 

**Note:** in the address bar, you will have entered the external IP address of your Cloud VM instead of 'localhost'.

![Login screen](../images/login.png?raw=true)

Paste the login token you coped in the previous step to connect to the server (if you copy/paste, make sure there is no newline splitting the token value, i.e. that you are pasting the token value printed on a single line). Your window should now look like this.

![A picture of a directory in a web browser](../images/notebook.png?raw=true)

### 8. Practice running commands inside the container, and downloading the images you create
This steps assumes you have already started a notebook server inside the running container as described in step 7 above. We will now run a command inside the running container to create an image, then download it using the IPython Notebook server's UI.

**Step 8a)** Open a second SSH window into the running container.
We use the second window to run shell commands (say, to stylize images), and later, we will use the IPython Notebook server to download the images we create to your laptop (or Chromebook).
This is what you need to do:
- Do SSH logon to your GCE instance (see step 5 above on how to do that)
- Then logon to your docker instance by typing: ```docker run -v ~/shared:/workshop/shared -it randomforests/wtm:v1```
  (note, omit the "-p 8888:8888" flag from step 5, since our notebook server uses that port map already)

**Step 8b)** Use your web browser connected to the IPython Notebook server to open the ```shared``` directory.

![Shared](../images/shared.png?raw=true)

Notice, that it's empty.

![Empty](../images/empty.png?raw=true)

**Step 8c)** Now, we will create an image inside this directory by running a terminal command in the SSH window connected to the running container.

Run these commands inside the new SSH window.

```
# cd /workshop/scripts
# sh fast_style.sh
```

**Step 8d)** When the command completes, refresh your browser window. You should see an image inside the shared directory.

![Not empty](../images/not_empty.png?raw=true)

Click on it to open it, then save it your laptop (or Chromebook) using your web browser.

### 9. Practice uploading images to the container
We will now upload an image from your Chromebook to the running container.

**Step 9a)** Use a web browser to download your favorite [image](https://upload.wikimedia.org/wikipedia/commons/a/af/Cara_de_quem_caiu_do_caminh%C3%A3o..._%28cropped%29.jpg) to your laptop or Chromebook.

**Step 9b)** Upload it to the shared folder using the Notebook's UI.

Click the upload button:

![Upload1](../images/upload1.png?raw=true)

Then navigate to your image, select it, and click Open.

![Upload2](../images/upload2.png?raw=true)

You will see a new row in the shared directory, with a blue upload button on the far right. Click that to upload your image.

![Upload3](../images/upload3.png?raw=true)

And your image is now available on the container. The path to this directory on the container is ```/workshop/shared```.

## If you need to restart the container later

If you later exit your container and then want to restart it again, you can find the container ID by running the following in your VM:

```shell
docker ps -a
docker start <container_id>
```
Once the workshop container is running again, you can exec back into it like this:

```shell
docker exec -it <container_id> bash
```
# Next steps.
That's it! You now know how to run commands on the running container, and how to upload and download images. Preview the [exercise](exercises.md) instructions, if you like.
