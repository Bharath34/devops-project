
class puppet_module_apache::init {
  include '::puppet_module_apache::params'
  include '::puppet_module_apache::package'
  include '::puppet_module_apache::cert',
  include '::puppet_module_apache::config',
  include '::puppet_module_apache::service'
}
