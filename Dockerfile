FROM python:3.11-slim
# Workdir of the container
WORKDIR /usr/src/app
# ENV
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# Copy requirements.txt
COPY ./requirements.txt .
# Install requirements
RUN pip install -r requirements.txt
# Copy user's files
COPY . .
# Prepare data
RUN python manage.py collectstatic --noinput
RUN python manage.py makemigrations
# CMD
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
