ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "db/bbs.db"
)

class Post < ActiveRecord::Base
end
