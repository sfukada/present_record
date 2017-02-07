class AddAttachmentImageToPresents < ActiveRecord::Migration
  def self.up
    change_table :presents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :presents, :image
  end
end
