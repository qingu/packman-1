class Libgeotiff < PACKMAN::Package
  url 'http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-1.4.1.tar.gz'
  sha1 'bc9e2bb43f3877b795b4b191e7aec6267f4a1c7e'
  version '1.4.1'

  depends_on 'libtiff'
  depends_on 'jpeg'
  depends_on 'proj'
  depends_on 'zlib'
  depends_on 'lzlib'

  def install
    args = %W[
      --prefix=#{PACKMAN.prefix self}
      --with-jpeg=#{PACKMAN.prefix Jpeg}
      --with-libtiff=#{PACKMAN.prefix Libtiff}
      --with-proj=#{PACKMAN.prefix Proj}
      --with-zlib=#{PACKMAN.prefix Zlib}
    ]
    PACKMAN.run './configure', *args
    PACKMAN.run 'make -j2'
    PACKMAN.run 'make install'
  end
end
