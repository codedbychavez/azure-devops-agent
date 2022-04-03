all: build run

build:
	docker build -t dockeragent:latest .

run:
	docker run --name dockeragent -e AZP_URL=https://dev.azure.com/cbsuk -e AZP_TOKEN=pusqt36t2saobskcdxrzxriw6kivqmup62fyuevteujmmqsolaeq -e AZP_AGENT_NAME=mydockeragent -e AZP_POOL=selfhosted dockeragent:latest --once