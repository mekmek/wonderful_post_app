class DeleteSampleArticles < ActiveRecord::Migration[6.0]
  def change
    drop_table :sample_articles do |t|
      t.string :title
      t.text :content
    end
  end
end
