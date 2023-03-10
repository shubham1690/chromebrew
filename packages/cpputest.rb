require 'package'

class Cpputest < Package
  description 'Unit testing and mocking framework for C/C++.'
  homepage 'https://cpputest.github.io/'
  version '3.8'
  license 'BSD'
  compatibility 'all'
  source_url 'https://github.com/cpputest/cpputest/archive/v3.8.tar.gz'
  source_sha256 '2b95bb4a568f680cdcca678345a2c41c028275471c2ed7bf0b6f6f1f689c3b76'

  binary_url({
    aarch64: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/cpputest/3.8_armv7l/cpputest-3.8-chromeos-armv7l.tar.xz',
     armv7l: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/cpputest/3.8_armv7l/cpputest-3.8-chromeos-armv7l.tar.xz',
       i686: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/cpputest/3.8_i686/cpputest-3.8-chromeos-i686.tar.xz',
     x86_64: 'https://gitlab.com/api/v4/projects/26210301/packages/generic/cpputest/3.8_x86_64/cpputest-3.8-chromeos-x86_64.tar.xz'
  })
  binary_sha256({
    aarch64: '0f685813ef3846cc3d4cd038772c51607920a8e570bbb9f7766d37e81eada691',
     armv7l: '0f685813ef3846cc3d4cd038772c51607920a8e570bbb9f7766d37e81eada691',
       i686: 'f57f4d0513bb5c15b63e7cb48f35786d3f3b437d59e471165a48427ef38f9a08',
     x86_64: '8813aacc9f17fbafe7a49fd45e4e3989b201698fa0db1258f55954735b7d6ee3'
  })

  # the steps required to build the package
  def self.build
    system './autogen.sh'
    system './configure', "--prefix=#{CREW_PREFIX}", "--libdir=#{CREW_LIB_PREFIX}"
    system 'make'
  end

  # the steps required to install the package
  def self.install
    system 'make', "DESTDIR=#{CREW_DEST_DIR}", 'install'
  end

  # the steps required to check if the package was built ok
  def self.check
    system 'make', 'check'
  end
end
