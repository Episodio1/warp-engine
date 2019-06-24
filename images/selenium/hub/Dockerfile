FROM selenium/hub

USER root

# Install PIP
RUN wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py
RUN chmod +x get-pip.py
RUN python get-pip.py
RUN rm get-pip.py
RUN pip install selenium

USER seluser

WORKDIR /selenium

EXPOSE 4444