require "spec_helper"

describe CashierCotendo do
  subject { CashierCotendo }

  it "should have a a callback for :on_cache_write" do
    subject.should respond_to(:on_cache_write)
  end

  
end