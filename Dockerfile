FROM oidc-proxy-base:latest

ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

WORKDIR /app
USER  appuser

COPY --chown=appuser src/oidc_proxy ./oidc_proxy/

EXPOSE 8080

CMD ["python3", "-m", "uvicorn", "oidc_proxy.api.http:app", "--host", "0.0.0.0", "--port", "8080"]
