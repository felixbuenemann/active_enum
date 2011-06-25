module ActiveEnum
  module Storage
    autoload :MemoryStore, "active_enum/storage/memory_store"
    autoload :I18nMemoryStore, "active_enum/storage/i18n_memory_store"

    class NotImplemented < StandardError; end

    class AbstractStore 
      def initialize(enum_class, order)
        @enum, @order = enum_class, order
      end

      def set(id, name, meta=nil)
        raise NotImplemented
      end

      def get_by_id(id)
        raise NotImplemented
      end

      def get_by_name(name)
        raise NotImplemented
      end

      def values
        raise NotImplemented
      end
    end
  end
end
