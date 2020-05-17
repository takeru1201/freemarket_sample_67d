class Item < ApplicationRecord
  # has_many :item_comments
  # has_many :likes
  # has_many :items_statuses
  # has_many :item_images
  
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  # accepts_nested_attributes_for :item_images
  has_many_attached :images
  accepts_nested_attributes_for :brand
  # validates :images, presence: { message: 'は１文字以上入力してください。' }
  validates :images, attached: true, limit: { min: 1, max: 5 }

  def validate_images
    return unless images.attached? # ファイルがアタッチされていない場合は何もしない
    if images.blob.byte_size > 10.megabytes
      images.purge # アタッチされたファイルの削除
      errors.add(:images, I18n.t('errors.messages.file_too_large'))
    elsif !image?
      images.purge # アタッチされたファイルの削除
      errors.add(:images, I18n.t('errors.messages.file_too_large'))
    end
  end

  private

  def image?
    %w[image/jpg image/jpeg image/gif image/png].include?(images.blob.content_type)
    end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_method
  belongs_to_active_hash :estimated_delivery
  belongs_to_active_hash :status
  
  validates :item_name, presence: true
  validates :price, presence: true
  validates :status_id, presence: true
  validates :delivery_method_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :estimated_delivery_id, presence: true
  validates :category_id, presence: true
end
