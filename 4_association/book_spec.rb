require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Book do
  describe "Creation & Validation" do
    it 'should have title and year published' do
      b = Book.new(:title => "Oliver Twist", :year => 1838)
      b.title.should == "Oliver Twist"
      b.year.should == 1838
    end
    it 'requires title and year' do
      b = Book.new
      b.should_not be_valid
      b.errors.on(:title).should_not be_nil
      b.errors.on(:year).should_not be_nil
    end
    it 'requires year to be greater than 1800' do
      b = Book.new(:title => "Hamlet", :year => 1603)
      b.should_not be_valid
      b.errors.on(:year).should_not be_nil
    end
    it 'requires year to be numerical' do
      b = Book.new(:title => "Hamlet", :year => "We're not really sure")
      b.should_not be_valid
      b.errors.on(:year).should_not be_nil
    end
  end

  describe "Authors" do
    before do
      @book = Book.new(:title => "Oliver Twist", :year => 1838)
    end

    it 'should have an authors method' do
      pending
      @book.should respond_to :authors
    end

    it 'should have no authors in a new record' do
      pending
      @book.authors.should be_empty
    end

    it 'should allow creation of an author' do
      pending
      lambda {
        @book.authors.create!(:first_name => "Charles", :last_name => "Dickens")  
      }.should change(Person, :count).by(1)
      @book.authors.first.last_name.should == "Dickens"
    end
  end
end





