alias aws='docker run --rm -it -v ~/.aws:/.aws -v $(pwd):/aws -v $HOME:$HOME -u $(id -u):$(id -g) amazon/aws-cli'
