use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let mut iter = stdin.lock().lines();
    let line1 = iter.next().unwrap().unwrap();
    let line2 = iter.next().unwrap().unwrap();

    let time: f64 = line1.replace(" ", "")[5..].parse().unwrap();
    let dist: f64 = line2.replace(" ", "")[9..].parse().unwrap();

    let r = (time.powi(2) - 4.0 * dist).sqrt();
    let mut r0 = (time + r) / 2.0;
    let mut r1 = (time - r) / 2.0;
    if r0 > r1 { (r0, r1) = (r1, r0); }

    let d = r1.floor() - r0.ceil() + 1.0;
    println!("{}", d);
}
