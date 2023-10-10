use clap::Parser;

#[derive(Parser)]
#[command(version, about, long_about = None)]
struct NeuronCli {
    /// Name of the person to greet
    name: String,

    /// Number of times to greet
    #[arg(short, long, default_value_t = 1)]
    count: u8,
}

fn main() {
    let args = NeuronCli::parse();

    for _ in 0..args.count {
        println!("Hello, {}!", args.name)
    }
}
