require "spec_helper"

describe CashierCotendo do

  subject { CashierCotendo }

  context "Redis" do
    it "should have a redis method" do
      subject.should respond_to(:redis)
    end

    it "should have a redis= method" do
      subject.should respond_to(:redis=)
    end

    it "Should return the redis instance I set" do
      subject.redis = $redis
      subject.redis.should == $redis
    end
  end

  context "Callback method" do
    before(:each) { subject.base_url = "/paris" }
    before(:each) { subject.redis = $redis }

    it "should have a a callback for :on_cache_write" do
      subject.should respond_to(:on_cache_write)
    end

    it "should store the cache key with the base URL in redis" do
      subject.on_cache_write("some_key")
      $redis.get("#{CashierCotendo::PREFIX}::some_key").should == subject.base_url
    end


  end
    
  context "Base URL" do
    it "should have a base_url method" do
      subject.should respond_to(:base_url)
    end

    it "should have a base_url= method" do
      subject.should respond_to(:base_url=)
    end

    it "should set and get the base URL" do
      subject.base_url = "/paris"
      subject.base_url.should == "/paris"
    end
  end






end