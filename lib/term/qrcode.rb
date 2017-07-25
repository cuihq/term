# coding: utf-8

require 'rqrcode'

require 'term/color'

# @author {mailto:cuihaiqin@gmail.com cuihq}
class String
  # get qrcode.
  #
  # @return [String] qrcode
  def qrcode
    RQRCode::QRCode.new(self).as_ansi(quiet_zone_size: 0)
  end
end
