%w{
  build-essential
  cmake
  pkg-config
  libtool
  libtool-bin
  automake
  autoconf
  g++
  unzip
}.each do |p|
  package p do; end
end
