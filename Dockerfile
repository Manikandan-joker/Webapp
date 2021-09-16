FROM python
RUN pip install flask
RUN pip3 install mysql-connector
COPY . .
ENTRYPOINT APP=app.py flask run
