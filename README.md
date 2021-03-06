# Tensorflow-Model-Serving

A Sample Example of Tensorflow model serving via centos6 based TensorFlow Model Server RPM and interact with it using TensorFlow Serving API.

## Description

Tensorflow and TensorFlow Serving API Wheels could be found at [AICoE Index](https://tensorflow.pypi.thoth-station.ninja)

The TensorFlow Model Server RPM are generated from the tensorflow_model_server[Ex tf-r.1.14](https://github.com/AICoE/tensorflow-wheels/releases/tag/tensorflow_serving_api-r1.14-cpu-2019-08-08_154435)] binary released by [Red Hat AICoE](https://github.com/AICoE/tensorflow-wheels) along with the tensorflow serving api[[Ex tf-r.1.14](https://github.com/AICoE/tensorflow-wheels/releases/tag/tensorflow_serving_api-r1.14-cpu-2019-08-08_154435)].

This is a sample example project to showcase how to use the tensorflow model server rpm for simple tensorflow model serving.

## How to use

It is a two step process:

- one on the serving side, where the model would be developed, trained and tested, and then final been served via the TensorFlow Model Server.
- second on the client side, where the model would be used via TensorFlow Serving API.

A sample model is provided in the repo to serving.

- [tf_model.py](./tf_model.py): model to be served
- [client.py](./client.py): request the model.

**NOTE:** Example which based on tensorflow version r1.14\. To change to another version please make following changes:

- Change the tensorflow version in the Pipfile, with available version in [AICoE index](https://tensorflow.pypi.thoth-station.ninja)
- Choose the RPM based on version choice in [tensorflow_model_server](./tensorflow-model-server-rpm)

### Serving side

- Use the example fedora 28 based Dockerfile to create a container image, which installs tensorflow_model_server rpm and serves the provided valid model.<br>
  `podman build --build-arg RPM=tensorflow-model-server-rpm/tensorflow-model-serving-1.14-1.0-1.x86_64.rpm -t tensorflow-serving -f Dockerfile .`

  - Build arguments:

    - RPM: Path of the Tensorflow Model Server RPM.(Found at:[TensorFlow Model Server RPM](./tensorflow-model-server-rpm/))

- Run the container for serving the model via using tensorflow model server rpm.<br>
  `podman run -p 9000:80 -it localhost/tensorflow-serving`

### Client side

- The example client side will using the tensorflow serving api to request the served model.
- Example client side [code](./client.py) and [tensorflow_serving_api](./tensorflow_serving_api-1.14.0-py2.py3-none-any.whl) for installation are provided in the repo.
- The following code could be used to request the model.<br>
  `pipenv install sample_wheels/tensorflow_serving_api-1.14.0-py2.py3-none-any.whl`<br>
  `pipenv run python3 client.py`
