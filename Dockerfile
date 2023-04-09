# Base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY poetry.lock pyproject.toml /app/

# Install dependencies
RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install --upgrade pip \
    && pip install --no-cache-dir poetry \
    && poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi \
    && apk del .build-deps gcc musl-dev

# Copy the application code
COPY . /app/

# Expose port
EXPOSE 5000

# Run the application
CMD ["python", "hello_world.py"]
