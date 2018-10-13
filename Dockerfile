FROM ruby:2.3.3

# Install software needed
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 

# Create directory for app
RUN mkdir /myapp

# Set working directory to /myapp
WORKDIR /myapp

# Copy files needed for bundle install
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gems
RUN bundle install

# Copy current directory contents into the container at /myapp
COPY . /myapp
