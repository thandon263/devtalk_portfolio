class Blog < ApplicationRecord
  # This is the blog state when working with Blogs
  # On create the default will be draft until
  # you Publish the post. Blog.find(params[:id]).published!
  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged
end
