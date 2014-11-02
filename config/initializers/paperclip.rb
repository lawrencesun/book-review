Paperclip::Attachment.default_options[:storage] = :qiniu
Paperclip::Attachment.default_options[:qiniu_credentials] = {
  :access_key => '4Cat7gX4X4PyUmUqXGHdPLLZ8xt1CtME4xxorIOh',
  :secret_key => '9V_tDpaRMXvO2iJcQqaraA-YW3U1JJwgK38u25-K'
}
Paperclip::Attachment.default_options[:bucket] = 'topics-1024'
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:qiniu_host] =
  'http://topics-1024.qiniudn.com'