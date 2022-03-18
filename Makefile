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
	wrk -t12 -c400 -d30s 'http://127.0.0.1:80/httptest/wikipedia_russia.html'

.PHONY: build-nginx
build-nginx:
	docker build -t nginx -f nginx.Dockerfile .

.PHONY: run-nginx
run-nginx:
	docker run -p 8000:8000 --name nginx -t nginx

# run-nginx-benchmark:
# 	wrk -t12 -c400 -d30s 'http://127.0.0.1:$(NGINX_PORT)/httptest/splash.css'

# run-httpd-benchmark:
# 	wrk -t12 -c400 -d30s 'http://127.0.0.1:$(PORT)/httptest/splash.css'

# build-docker-nginx:
# 	docker build -t nginx -f nginx.Dockerfile .

# docker-run-nginx:
# 	docker run -p $(NGINX_PORT):$(NGINX_PORT) --name nginx -t nginx

# docker-stop-nginx:
# 	docker stop nginx

# build-docker:
# 	docker build --no-cache . --tag $(PROJECT) --build-arg PORT=$(PORT)

# docker-run:
# 	docker run -p $(PORT):$(PORT) --name $(CONTAINER) -t $(PROJECT)

# docker-stop:
# 	docker stop $(CONTAINER)

# docker-free:
# 	docker rm -vf $(CONTAINER) || true