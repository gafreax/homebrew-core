class GalleryDl < Formula
  include Language::Python::Virtualenv

  desc "Command-line downloader for image-hosting site galleries and collections"
  homepage "https://github.com/mikf/gallery-dl"
  url "https://files.pythonhosted.org/packages/74/69/8b64b8ffbf53b8a4770f822c2c3d2f12fd9862c84e3544aa204aa45ac9a4/gallery_dl-1.24.2.tar.gz"
  sha256 "2aa0e9acaa2aa5b36952b33b9c0623ef572e321e94deceb992a5535b670778b7"
  license "GPL-2.0-only"
  head "https://github.com/mikf/gallery-dl.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "c84a09441d460e9ad7da31c24d2837e81ad2bb11f716675d34183cdeeeb9dbd2"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ebd570be3505150e5774cee7d0c9efcafc42550124d58dc8515b11918e342875"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "b5ede384d7d38efad1720be77f409d54548fa0e1625b6dfe43440ddc38dd5779"
    sha256 cellar: :any_skip_relocation, ventura:        "ea36350a2a149c49bd79c5a539143c231eb6f54ffcef47fba3764125a5ef9670"
    sha256 cellar: :any_skip_relocation, monterey:       "5be69ebbd0e1d81ed820e01132ac7f18769749384984906aed3ee8b17a884554"
    sha256 cellar: :any_skip_relocation, big_sur:        "5900d1ff9abd861f4c85013aaa37073c8c95d0ea7df0ba7abddd3eb4fa0edb0d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "36bd6fe5c914f98c85aafb270afe0207faca4e535c57e3470f6566d6deff55ae"
  end

  depends_on "python@3.11"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/37/f7/2b1b0ec44fdc30a3d31dfebe52226be9ddc40cd6c0f34ffc8923ba423b69/certifi-2022.12.7.tar.gz"
    sha256 "35824b4c3a97115964b408844d64aa14db1cc518f6562e8d7261699d1350a9e3"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/a1/34/44964211e5410b051e4b8d2869c470ae8a68ae274953b1c7de6d98bbcf94/charset-normalizer-2.1.1.tar.gz"
    sha256 "5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438/idna-3.4.tar.gz"
    sha256 "814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724/requests-2.28.1.tar.gz"
    sha256 "7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c2/51/32da03cf19d17d46cce5c731967bf58de9bd71db3a379932f53b094deda4/urllib3-1.26.13.tar.gz"
    sha256 "c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"gallery-dl", "https://imgur.com/a/dyvohpF"
    expected_sum = "126fa3d13c112c9c49d563b00836149bed94117edb54101a1a4d9c60ad0244be"
    file_sum = Digest::SHA256.hexdigest File.read(testpath/"gallery-dl/imgur/dyvohpF/imgur_dyvohpF_001_ZTZ6Xy1.png")
    assert_equal expected_sum, file_sum
  end
end
