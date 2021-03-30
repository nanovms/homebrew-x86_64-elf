class X8664ElfBinutils < Formula
  desc "FSF Binutils for cross-compiling x86_64-elf"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftpmirror.gnu.org/binutils/binutils-2.32.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.gz"
  version "2.32"
  sha256 "9b0d97b3d30df184d302bced12f976aa1e5fbf4b0be696cdebc6cca30411a46e"

  # Build-only dependencies
  depends_on "autoconf" => :build
  depends_on "automake" => :build

  def install
    mkdir "build" do
      system "../configure", "--target=x86_64-elf",
                             "--enable-targets=x86_64-elf,x86_64-pe",
                             "--prefix=#{prefix}",
                             "--infodir=#{info}",
                             "--mandir=#{man}",
                             "--with-sysroot",
                             "--disable-nls",
                             "--disable-werror"
      system "make"
      system "make", "install"
    end

    info.rmtree # info files conflict with native binutils
  end
end
