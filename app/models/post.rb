# == Schema Information
#
# Table name: posts
#
#  id               :bigint(8)        not null, primary key
#  title            :string(255)
#  body             :text(65535)
#  description      :text(65535)
#  slug             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string(255)
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#

class Post < ApplicationRecord

  acts_as_taggable # Alias for acts_as_taggable_on :tags
	
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author

  # cutom order 
  scope :most_recent, -> {order(id: :desc)}
  # scope :most_recent, -> {order(published_at: :desc)}
  scope :published, -> {where(published: true)}

  PER_PAGE = 6

  scope :recent_pagination, -> (page) {most_recent.paginate(page: page, per_page: PER_PAGE)}
  scope :with_tag, -> (tag) {tagged_with(tag) if tag.present? }
  scope :list_for, -> (page, tag) do
      recent_pagination(page).with_tag(tag)
      #if tag.present?
      #  recent_pagination(page).with_tag(tag)
      #else
      #  recent_pagination(page).with_tag(tag)
      #end     
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def display_day_published
    # created_at.strftime('%-b %-d, %Y') 
    # "Published #{created_at.strftime('%-b %-d, %Y')}" 
    if published_at.present?
      "Published #{published_at.strftime('%-b %-d, %Y')}" 
    else
      "Not Published"  
    end
  end

  def post_publish
      update(published: true, published_at: Time.now)  
  end

  def post_unpublish
      update(published: false, published_at: nil) 
  end

end
