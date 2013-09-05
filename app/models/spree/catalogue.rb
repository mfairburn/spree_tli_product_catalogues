module Spree
  class Catalogue < Asset
    validates_attachment_presence :attachment
    validate :no_attachment_errors

    attr_accessible :alt, :attachment, :position, :viewable_type, :viewable_id

    alias_attribute :display_name, :alt
    attr_accessible :display_name
    validates :display_name, :presence => true

    has_attached_file :attachment,
                      styles: { mini: '48x48>', product: '240x240>'},
                      default_style: :product,
                      url: '/spree/products/:id/:style/:basename.:extension',
                      path: ':rails_root/public/spree/products/:id/:style/:basename.:extension',
                      convert_options: { all: '-strip -auto-orient' }

    # save the w,h of the original image (from which others can be calculated)
    # we need to look at the write-queue for images which have not been saved yet
    after_post_process :find_dimensions

    include Spree::Core::S3Support
    supports_s3 :attachment

    Spree::Catalogue.attachment_definitions[:attachment][:styles] = ActiveSupport::JSON.decode(Spree::Config[:attachment_styles]).symbolize_keys!
    Spree::Catalogue.attachment_definitions[:attachment][:path] = Spree::Config[:attachment_path]
    Spree::Catalogue.attachment_definitions[:attachment][:url] = Spree::Config[:attachment_url]
    Spree::Catalogue.attachment_definitions[:attachment][:default_url] = Spree::Config[:attachment_default_url]
    Spree::Catalogue.attachment_definitions[:attachment][:default_style] = Spree::Config[:attachment_default_style]

    #used by admin products autocomplete
    def mini_url
      attachment.url(:mini, false)
    end

    def find_dimensions
      temporary = attachment.queued_for_write[:original]
      filename = temporary.path unless temporary.nil?
      filename = attachment.path if filename.blank?
      geometry = Paperclip::Geometry.from_file(filename)
      self.attachment_width  = geometry.width
      self.attachment_height = geometry.height
    end

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interrim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
  end
end
