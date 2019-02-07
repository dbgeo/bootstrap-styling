json.extract! author, :id, :lname, :fname, :email, :thumbnail, :created_at, :updated_at
json.url author_url(author, format: :json)
