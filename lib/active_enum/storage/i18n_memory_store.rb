module ActiveEnum
  module Storage
    class I18nMemoryStore < MemoryStore
      def get_by_id(id)
        translated(super(id))
      end

      def get_by_name(name)
        translated(super(name))
      end

      def values
        super.map{|value| translated(value)}
      end

      private

      def i18n_scope
        [:active_enum, @enum.name.underscore.gsub(/\//, '.')]
      end

      def translated(value)
        return if value.nil?
        id, name, meta = value
        translated_name = I18n.translate(name.downcase.gsub(/\s/, '_'),
                                         :scope => i18n_scope,
                                         :default => name)
        [id, translated_name, meta].compact
      end
    end
  end
end
