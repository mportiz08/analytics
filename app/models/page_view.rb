require 'digest'

class PageView < Sequel::Model
  def after_create
    update_digest
    super
  end
  
  private
  
  def update_digest
    attrs = {
      :id         => self.id,
      :url        => self.url,
      :referrer   => self.referrer,
      :created_at => self.created_at
    }
    puts attrs
    attrs = attrs.to_s
    
    self.set({:digest => Digest::MD5.hexdigest(attrs)})
    self.save(:digest)
  end
end
