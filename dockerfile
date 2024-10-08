FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
COPY . /App
WORKDIR /App
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "/App/simpleApp.wsgi:application"]
