#tagの作成
tags = %w(学習 転職活動 豆知識 その他)
tags.each do |t|
  Tag.find_or_create_by!(name: t)
end

# テストユーザーおよびユーザーに紐づく記事の作成
existing_users = User.all.pluck(:email)
password = "test1234"
tag_ids = Tag.all.ids

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

      new_article = new_user.articles.create!(
        title: title,
        content: content
      )
      tag_ids.each do |i|
        TagArticle.create!(
          article_id: new_article.id,
          tag_id: i
        )
      end
    end
  end
end
