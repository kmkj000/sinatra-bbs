ActiveRecord::Base.establish_connection('sqlite3:///comments.db')
class Comment < ActiveRecord::Base; end
