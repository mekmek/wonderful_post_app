# テストユーザーおよびユーザーに紐づく記事の作成
existing_users = User.all.pluck(:email)
password = "test1234"

3.times do |num|
  email = "user00#{num + 1}@test.com"
  unless existing_users.include?(email)
    new_user = User.create!(
      email: email,
      password: password
    )

    50.times do |num|
      title = "No.#{num + 1}: user00#{new_user.id}の記事"
      content = "No.#{num + 1}: user00#{new_user.id}の記事の本文"

      new_user.articles.create!(
        title: title,
        content: content
      )
    end
  end
end
