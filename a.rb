require 'bcrypt'

#登録
signup_password = BCrypt::Password.create("my")
puts signup_password

#ログイン
user = User.find_by(uid: params[:uid])

login_password = BCrypt::Password.new(user.pass)
if login_password == “my”
    puts "OK"
end