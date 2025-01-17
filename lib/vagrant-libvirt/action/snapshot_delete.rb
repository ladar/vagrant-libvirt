# frozen_string_literal: true

module VagrantPlugins
  module ProviderLibvirt
    module Action
      class SnapshotDelete
        def initialize(app, env)
          @app = app
        end

        def call(env)
          env[:ui].info(I18n.t(
            "vagrant.actions.vm.snapshot.deleting",
            name: env[:snapshot_name]))
          env[:machine].provider.driver.delete_snapshot(env[:machine], env[:snapshot_name])

          env[:ui].success(I18n.t(
            "vagrant.actions.vm.snapshot.deleted",
            name: env[:snapshot_name]))

          @app.call(env)
        end
      end
    end
  end
end
