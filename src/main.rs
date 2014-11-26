extern crate libc;

fn main() {
    for _ in range(0u, 100000) {
        unsafe {
            println!("{},{}", libc::rand(), libc::rand());
        }
    }
}
