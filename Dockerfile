FROM python:3.10-alpine
RUN pip install tox
WORKDIR /app
COPY . .
CMD ["tox", "--result-json", "result.json", "."]