# Setup Guide

## Setting up a new server

From kubeflow, go to Notebook Servers > New Server.

Special settings of note:
- Name: we suggest using the same name as your repository name.
- Namespace: automatically filled for you.
- Image: we do not recommend using the public kubeflow images. See here (TODO) for a list of available images for Infinity.
- Workspace volume and data volumes: only use these if you need persistent storage, but even in this case we recommend using GCS instead.
- GPUs: if requesting GPUs, make sure to use an image that supports GPUs (TODO).

Once inside the notebook server, open a terminal and `git clone` the project repository (ie. this one).


## Using a custom server image

- In this folder, edit `requirements.txt` with the Python environment you require.
- If necessary you can also edit `Dockerfile` (for example, NLTK requires special setup steps (TODO))
- Push commit to GitHub and make pull request.
- Jenkins will build and push the eda image as: `eu.gcr.io/$google_project/$project_name/eda:$latest_commit_hash`
- Set up notebook server with this image.

