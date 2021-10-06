module Occson
  module Rails
    class Engine < ::Rails::Engine
      isolate_namespace Occson::Rails
    end
  end
end
