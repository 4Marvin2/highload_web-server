.PHONY: build
build:
	g++ -std=c++11 ../main.cpp -o main

.PHONY: run
run:
	./main

.PHONY: build-docker
build-docker:
	docker build --no-cache . --tag web_server

.PHONY: run-docker
run-docker:
	docker run -p 80:80 --name web_server -t web_server

.PHONY: stop-docker
stop-docker:
	docker stop web_server

.PHONY: run-test
run-test:
	./httptest.py

.PHONY: run-web_server-benchmark
run-web_server-benchmark:
	ab -n 10000 -c 10 127.0.0.1:80/httptest/wikipedia_russia.html

.PHONY: build-nginx
build-nginx:
	docker build -t nginx -f nginx.Dockerfile .

.PHONY: run-nginx
run-nginx:
	docker run -p 8000:8000 --name nginx -t nginx

.PHONY: run-nginx-benchmark
run-nginx-benchmark:
	ab -n 10000 -c 10 127.0.0.1:8000/httptest/wikipedia_russia.html
