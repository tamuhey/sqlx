FROM rust:1.55-buster as builder
COPY . /sqlx
WORKDIR /sqlx/sqlx-cli
RUN cargo build --release --bin sqlx

FROM gcr.io/distroless/cc-debian10 as tester
COPY --from=builder /sqlx/target/release/sqlx /
