# テストユーザーの作成
users = User.all.pluck(:email)
password = "test1234"

3.times do |num|
  email = "user00#{num + 1}@test.com"
  unless users.include?(email)
    User.create!(
      email: email,
      password: password
    )
  end
end

# 各ユーザーに紐付いた記事を50記事作成
User.all.each do |user|
  50.times do |num|
    articles = user.articles.pluck(:title)
    title = "No.#{num + 1}: user00#{user.id}の記事"
    content = "No.#{num + 1}: user00#{user.id}の記事の本文"

    unless articles.include?(title)
      user.articles.create!(
        title: title,
        content: content
      )
    end
  end
end
