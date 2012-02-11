module RecordSelect
  class Engine < Rails::Engine
    initializer('initialize_record_select' ,:after => "initialize_active_scaffold") do
      ActiveSupport.on_load(:action_controller) do
        require 'record_select/extensions/localization'
        require 'record_select/extensions/routing_mapper'
        require 'record_select/actions'
        require 'record_select/conditions'
        require 'record_select/config'

        include RecordSelect
      end

      ActiveSupport.on_load(:action_view) do
        require 'record_select/form_builder'
        require 'record_select/helpers/record_select_helper'
        include RecordSelectHelper
        ActionView::Helpers::FormBuilder.send(:include, RecordSelect::FormBuilder)
      end

      ActiveSupport.on_load(:active_record) do
        require 'record_select/extensions/active_record'
      end
    end
  end
end
