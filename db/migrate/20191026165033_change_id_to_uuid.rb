class ChangeIdToUuid < ActiveRecord::Migration[5.2]
  def change
    add_column :gutentag_taggings, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :gutentag_taggings, :taggable_uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :gutentag_taggings, :tag_uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :gutentag_taggings do |t|
      t.remove :id
      t.rename :uuid, :id
      t.remove :tag_id
      t.rename :tag_uuid, :tag_id
      t.remove :taggable_id
      t.rename :taggable_uuid, :taggable_id
    end
    execute 'ALTER TABLE gutentag_taggings ADD PRIMARY KEY(id);'

    add_column :gutentag_tags, :uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :gutentag_tags do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute 'ALTER TABLE gutentag_tags ADD PRIMARY KEY(id);'

    add_column :roles, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :roles, :resource_uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :roles do |t|
      t.remove :id
      t.rename :uuid, :id
      t.remove :resource_id
      t.rename :resource_uuid, :resource_id
    end
    execute 'ALTER TABLE roles ADD PRIMARY KEY(id);'

    add_column :users_roles, :role_uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :users_roles, :user_uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :users_roles do |t|
      t.remove :role_id
      t.rename :role_uuid, :role_id
      t.remove :user_id
      t.rename :user_uuid, :user_id
    end

    add_column :tweets, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :tweets, :tweet_uuid, :uuid
    add_column :tweets, :user_uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :tweets do |t|
      t.remove :id
      t.rename :uuid, :id
      t.remove :user_id
      t.rename :user_uuid, :user_id
      t.remove :tweet_id
      t.rename :tweet_uuid, :tweet_id
    end
    execute 'ALTER TABLE tweets ADD PRIMARY KEY(id);'

    add_column :likes, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :likes, :tweet_uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :likes, :user_uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :likes do |t|
      t.remove :id
      t.rename :uuid, :id
      t.remove :user_id
      t.rename :user_uuid, :user_id
      t.remove :tweet_id
      t.rename :tweet_uuid, :tweet_id
    end
    execute 'ALTER TABLE likes ADD PRIMARY KEY(id);'

    add_column :subscriptions, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :subscriptions, :follower_uuid, :uuid, default: "gen_random_uuid()", null: false
    add_column :subscriptions, :followed_uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :subscriptions do |t|
      t.remove :id
      t.rename :uuid, :id
      t.remove :followed_id
      t.rename :followed_uuid, :followed_id
      t.remove :follower_id
      t.rename :follower_uuid, :follower_id
    end
    execute 'ALTER TABLE subscriptions ADD PRIMARY KEY(id);'

    add_column :users, :uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute 'ALTER TABLE users ADD PRIMARY KEY(id);'
  end
end
