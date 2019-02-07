require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   def setup
     @author = Author.create(lname: "last name", fname: "first name",
                    email: "user's email", thumbnail: "users pic")
   end

  test "author must be valid" do
    assert_not @author.valid?
  end

     test "author's atributes cannot be empty" do
        author = Author.new
        assert author.invalid?
        assert author.errors[:fname].any?
        assert author.errors[:lname].any?
        assert author.errors[:email].any?
      end

      setup do
          @attrs = { email: "example@mail.com" }
      end

      test "user email must be unique" do
           assert Author.create(@attrs)
          assert author = Author.new(@attrs)
          assert author.invalid?
         assert author.errors.include?(:email)
     end
     def new_image(image_url)
          Author.new(lname: "Charles",
          fname: "Olian",
          email: "julian@gmail.com",
          image_url: image_url)
          end
      test "image url" do
        ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
        http://a.b.c/x/y/z/fred.gif }
        bad = %w{ fred.doc fred.gif/more fred.gif.more }
        ok.each do |image_url|
        assert Author.new(image_url).valid?,
        "#{image_url} shouldn't be invalid"
      end
          bad.each do |image_url|
          assert Author.new(image_url).invalid?,
          "#{image_url} shouldn't be valid"
      end
    end

end
