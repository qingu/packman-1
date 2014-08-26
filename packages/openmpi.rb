class Openmpi < PACKMAN::Package
  url 'http://www.open-mpi.org/software/ompi/v1.8/downloads/openmpi-1.8.1.tar.bz2'
  sha1 'e6e85da3e54784ee3d7b0bb0ff4d365ef2899c49'
  version '1.8.1'

  # Libevent can be downloaded in some network condition!
  # depends_on 'libevent'

  conflicts_with 'mpich'

  def install
    # --with-libevent=#{PACKMAN::Package.prefix(Libevent)}
    args = %W[
      --prefix=#{PACKMAN::Package.prefix(self)}
      --disable-dependency-tracking
      --disable-silent-rules
      --enable-ipv6
      --enable-mpi-thread-multiple
      --enable-mpi-f77
      --enable-mpi-f90
    ]
    PACKMAN.run './configure', *args
    PACKMAN.run 'make -j2 all'
    PACKMAN.run 'make check'
    PACKMAN.run 'make install'
  end
end
