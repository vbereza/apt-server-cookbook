name             'apt-server-cookbook'
maintainer       'Valerii Bereza'
maintainer_email '661645@gmail.com'
license          'All rights reserved'
description      'Installs/Configures apt-server-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu debian }.each do |os|
  supports os
end

%w{ apt build-essential }.each do |cb|
  depends cb
end
