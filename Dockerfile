FROM mikespub/sclorg-flask-ex:ubi9-python311

COPY . /san-exporter

WORKDIR /san-exporter

# Need to upgrade pip due to package cryptography - the requeriment of paramiko
#   link: https://github.com/Azure/azure-cli/issues/16858
RUN pip install --upgrade pip

RUN pip install -r requirements.txt

USER root

ENTRYPOINT [ "python" ]

CMD [ "manage.py" ]
