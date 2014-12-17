extern crate dsfmt;
use std::rand::{Rng, SeedableRng};

fn main() {
    let seed = match &*std::os::args() {
        [_, ref n, ..] => {
            from_str(n.as_slice()).unwrap()
        }
        _ => 12345
    };
    let mut rng: dsfmt::DSFMTRng = SeedableRng::from_seed(seed);

    let mut sum = 0_f64;
    for _ in range(0u32, 1_000_000_000) {
        sum += rng.gen()
    }

    println!("{}", sum)
}
