FROM gcc:latest as build

WORKDIR /app/build
COPY . .
RUN g++ -std=c++11 main.cpp -o main


FROM gcc:latest

WORKDIR /app
EXPOSE 80
COPY --from=build /app/build/httptest /httptest
COPY --from=build /app/build/main .
CMD ./main -p 80:80