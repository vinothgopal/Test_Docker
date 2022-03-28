FROM winamd64/python:3.8

COPY requirements.txt .
#COPY Pychimport/requirements.txt /appcode/

RUN pip install -r requirements.txt
RUN pip install robotframework
RUN pip install webdrivermanager
# copy the content of the local src directory to the working directory
COPY . .
#WORKDIR /appcode
RUN  Invoke-WebRequest -OutFile chromedriver_win32.zip https://chromedriver.storage.googleapis.com/84.0.4147.30/chromedriver_win32.zip;  \
     Expand-Archive chromedriver_win32.zip -DestinationPath \chromedriver;     Remove-Item -Force chromedriver_win32.zip
#ENTRYPOINT [‘./run_suite.sh’]     
CMD [ "robot", "importTestcases.robot" ]