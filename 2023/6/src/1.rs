use std::io::{self, BufRead};

fn main() {
    let stdin = io::stdin();
    let mut iter = stdin.lock().lines();
    let line1 = iter.next().unwrap().unwrap();
    let line2 = iter.next().unwrap().unwrap();

    let mut mul = 1.0;
    for (time, dist) in line1.split_whitespace().skip(1).zip(line2.split_whitespace().skip(1)) {
        let time: f32 = time.parse().unwrap();
        let dist: f32 = dist.parse().unwrap();
        let r = (time.powi(2) - 4.0 * dist).sqrt();
        let mut r0 = (time + r) / 2.0;
        let mut r1 = (time - r) / 2.0;
        if r0 > r1 { (r0, r1) = (r1, r0); }
        mul *= r1.floor() - r0.ceil() + 1.0;
    }

    println!("{}", mul);
}
