# Run selenium Chrome with Robotframework In Docker

Step 1: open cmd run following cmd
	docker build --rm -f "Dockerfile" -t vinorf:qa .
Step 2: run step 1 is success run below cmd
	docker run --rm -v $(pwd):/workspace:cached -w /workspace vinorf:qa python3 -m robot *.robot
#$(pwd) is present working directory
#docker run --rm -v C:\temp\DockerRobot:/workspace:cached -w /workspace vinorf:qa python3 -m robot *.robot