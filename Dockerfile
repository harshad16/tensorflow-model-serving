FROM fedora:28
WORKDIR /home/user

COPY Pipfile /home/user/
COPY $RPM /home/user/
COPY tf_model.py /home/user/

RUN yum install -y $RPM libstdc++
RUN pip3 install pipenv \
  && pipenv install --python 3.6 \
  && pipenv run python3 tf_model.py

# tensorflow model would be served via container port 80
CMD ["tensorflow_model_server","--model_base_path=/home/user/","--port=80"]
