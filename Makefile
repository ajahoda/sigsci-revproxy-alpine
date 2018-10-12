DOCKERNAME?=sigsci-revproxy-alpine
DOCKERTAG?=latest

build:
	docker build -t $(DOCKERNAME):$(DOCKERTAG) .

build-no-cache:
	docker build --no-cache -t $(DOCKERNAME):$(DOCKERTAG) .

run:
	docker run --name $(DOCKERNAME) -d \
		-e SIGSCI_ACCESSKEYID="SETME" \
		-e SIGSCI_SECRETACCESSKEY="SETMETOO" \
		-e SIGSCI_REVPROXY_LISTENER="http1:{listener=http://0.0.0.0:80,upstreams=http://192.168.65.312:8080}" \
		-p 8081:80 $(DOCKERNAME):$(DOCKERTAG)
