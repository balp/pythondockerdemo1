FROM python:3.10-alpine as builder
WORKDIR /app
COPY . .
RUN pip install build && \
    python -m build --wheel --outdir /app/wheels/


FROM python:3.10-alpine
WORKDIR /app
COPY --from=builder /app/wheels /wheels
RUN pip install --no-cache /wheels/*
CMD ["hello"]