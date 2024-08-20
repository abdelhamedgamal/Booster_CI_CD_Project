FROM ubuntu
RUN apt-get update
RUN apt-get install -y python3.6
RUN apt-get install -y python3-pip
COPY . /App
WORKDIR /App
RUN apt install python3 python3-venv
RUN python3 -m venv myenv
RUN source myenv/bin/activate
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "/App/simpleApp.wsgi:application"]
