plugin "git"
plugin "env"
plugin "bundler"
plugin "rails"
plugin "nodenv"
plugin "puma"
plugin "./plugins/music.rb"

host "dj@192.168.0.64"

set application: "music"
set deploy_to: "/var/www/%{application}"
set nodenv_node_version: "15.5.1"
set nodenv_yarn_version: "1.22.10"
set git_url: "https://github.com/jaredmoody/music.git"
set git_branch: "main"
set git_exclusions: %w[
  .tomo/
  spec/
  test/
]
set env_vars: {
  RACK_ENV: "production",
  RAILS_ENV: "production",
  RAILS_LOG_TO_STDOUT: "1",
  RAILS_SERVE_STATIC_FILES: "1",
  DATABASE_URL: :prompt,
  SECRET_KEY_BASE: :prompt
}

set linked_dirs: %w[
  log
  node_modules
  public/assets
  public/packs
  tmp/cache
  tmp/pids
  tmp/sockets
]

setup do
  run "env:setup"
  run "core:setup_directories"
  run "git:clone"
  run "git:create_release"
  run "core:symlink_shared"
  run "nodenv:install"
  run "bundler:upgrade_bundler"
  run "bundler:config"
  run "bundler:install"
  run "rails:db_create"
  run "rails:db_schema_load"
  run "rails:db_seed"
  run "puma:setup_systemd"
end

deploy do
  run "env:update"
  run "git:create_release"
  run "core:symlink_shared"
  run "core:write_release_json"
  run "bundler:install"
  run "rails:db_migrate"
  run "rails:assets_precompile"
  run "core:symlink_current"
  run "puma:restart"
  run "puma:check_active"
  run "core:clean_releases"
  run "bundler:clean"
  run "core:log_revision"
end
