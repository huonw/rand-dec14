.PHONY: all compare rust-dsfmt-bench
all: compare

compare: c-dsfmt-bench rust-dsfmt-bench
	@echo 'C'
	@time -f 'User time: %Us' ./c-dsfmt-bench
	@echo 'Rust'
	@time -f 'User time: %Us' ./target/release/dsfmt-bench

c-dsfmt-bench: dsfmt-bench.c
	gcc -O3 -finline-functions -fomit-frame-pointer -DNDEBUG -fno-strict-aliasing --param max-inline-insns-single=1800 -DHAVE_SSE2 -DDSFMT_MEXP=19937 -I dSFMT-src-2.2.3 dSFMT-src-2.2.3/dSFMT.c dsfmt-bench.c -o c-dsfmt-bench

rust-dsfmt-bench: target/release/dsfmt-bench

target/release/dsfmt-bench: src/bin/dsfmt-bench.rs Cargo.lock Cargo.toml
	cargo build --release
