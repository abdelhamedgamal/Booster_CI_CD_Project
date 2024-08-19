FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip3
COPY . /App
WORKDIR /App
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "AppsimpleApp.wsgi:application"]
