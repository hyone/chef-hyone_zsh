module HyoneZsh
  module Helper

    def get_user(attr)
      attr['hyone_zsh']['user'] ||
        (attr.has_key?('main') && attr['main']['user']) ||
        'root'
    end

    def get_group(attr, user = nil)
      attr['hyone_zsh']['group'] ||
        (attr.has_key?('main') && attr['main']['group']) ||
        user || get_user(attr)
    end
  end
end


