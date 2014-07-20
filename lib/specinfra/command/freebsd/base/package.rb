class Specinfra::Command::Freebsd::Base::Package < Specinfra::Command::Base::Package
  def check_is_installed(package, version=nil)
    if version
      "pkg_info -I #{escape(package)}-#{escape(version)}"
    else
      "pkg_info -Ix #{escape(package)}"
    end
  end

  def install(package)
    "pkg_add -r install #{package}"
  end

  def get_version(package, opts=nil)
    "pkg_info -Ix #{escape(package)} | cut -f 1 -w | sed -n 's/^#{escape(package)}-//p'"
  end
end
