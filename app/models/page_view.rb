require 'digest'

class PageView < Sequel::Model
  def after_create
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
    super
  end
end
