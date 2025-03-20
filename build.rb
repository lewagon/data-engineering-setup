#!/usr/bin/env ruby -wU
CONSTANTS = {
  'PYTHON_VERSION' => '3.8.12',
  # 'PYTHON_CHECKER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/python_checker.sh',
  # 'PIP_CHECKER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.sh',
  # 'PIP_LOADER_URL' => 'https://raw.githubusercontent.com/lewagon/data-setup/master/checks/pip_check.py',
  'CODE_EDITOR' => 'VS Code',
  'CODE_EDITOR_CMD' => 'code'
}

# NOTE(ssaunier): This script needs https://github.com/lewagon/setup to be cloned as well
MAC_OS = %w[
  intro
  setup/zoom
  setup/macos_slack
  setup/slack_settings
  setup/github
  chrome
  gcp_setup
  homebrew
  osx_vscode
  vscode_remote_ssh
  gcp_cli_setup
  gcp_cli_oauth
  gcp_adc_auth
  terraform
  terraform_vm
  vscode_ssh_connection
  gcp_auth_vm_heading
  gcp_cli_oauth
  gcp_adc_auth
  ubuntu_ansible_part1
  setup/gh_cli
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_new_laptop_heading
  dotfiles_new_laptop
  ubuntu_ansible_part2
  ubuntu_vm_test
  dbeaver
  setup/kitt
].freeze

MAC_OS_KC = %w[
  keep_current
  python_checkup
].freeze

WINDOWS = %w[
  intro
  setup/zoom
  setup/windows_slack
  setup/slack_settings
  setup/github
  chrome
  gcp_setup
  win_vscode
  vscode_remote_ssh
  gcp_cli_setup
  gcp_adc_auth
  terraform
  terraform_vm
  vscode_ssh_connection
  gcp_auth_vm_heading
  gcp_cli_oauth
  gcp_adc_auth
  ubuntu_ansible_part1
  setup/gh_cli
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_new_laptop_heading
  dotfiles_new_laptop
  ubuntu_ansible_part2
  ubuntu_vm_test
  dbeaver
  setup/kitt
].freeze

WINDOWS_KC = %w[
  keep_current
  python_checkup
].freeze

LINUX = %w[
  intro
  setup/zoom
  setup/ubuntu_slack
  setup/slack_settings
  setup/github
  chrome
  gcp_setup
  setup/ubuntu_vscode
  vscode_remote_ssh
  gcp_cli_setup
  gcp_cli_oauth
  gcp_adc_auth
  terraform
  terraform_vm
  vscode_ssh_connection
  gcp_auth_vm_heading
  gcp_cli_oauth
  gcp_adc_auth
  ubuntu_ansible_part1
  setup/gh_cli
  dotfiles
  dotfiles_new_student
  dotfiles_new_laptop
  dotfiles_new_laptop_heading
  dotfiles_new_laptop
  ubuntu_ansible_part2
  ubuntu_vm_test
  dbeaver
  setup/kitt
]

LINUX_KC = %w[
  keep_current
  python_checkup
]

LOCALES = [""]  # english

FILENAMES = {
  "WINDOWS" => ["WINDOWS", WINDOWS],
  "macOS" => ["macOS", MAC_OS],
  "LINUX" => ["LINUX", LINUX],
  "WINDOWS_keep_current" => ["WINDOWS", WINDOWS_KC],
  "macOS_keep_current" => ["macOS", MAC_OS_KC],
  "LINUX_keep_current" => ["LINUX", LINUX_KC]
}

DELIMITERS = {
  "WINDOWS" => ["\\$WINDOWS_START\n", "\\$WINDOWS_END\n"],
  "macOS" => ["\\$MAC_START\n", "\\$MAC_END\n"],
  "LINUX" => ["\\$LINUX_START\n", "\\$LINUX_END\n"]
}

def load_partial(partial, locale)
  match_data = partial.match(/setup\/(?<partial>[0-9a-z_]+)/)
  partial = match_data[:partial] if match_data
  partial = File.join(locale, partial) unless locale.empty?
  file = File.join("_partials", "#{partial}.md")
  if match_data
    require 'open-uri'
    content = URI.open(File.join("https://raw.githubusercontent.com/lewagon/setup/master", file))
            .string
    # replace data-setup repo relative path by setup repo URL
    image_paths = content.scan(/\!\[.*\]\((.*)\)/).flatten
    image_paths.each { |ip| content.gsub!(ip, "https://github.com/lewagon/setup/blob/master/#{ip}")}
  else
    content = File.read(file, encoding: "utf-8")
  end
  return content
end

# load partials
loaded = FILENAMES.map { |filename, (os_name, partials)| partials }.flatten.uniq
loaded = loaded.map { |partial| LOCALES.map { |locale| [partial, locale]} }.flatten(1)
loaded = loaded.map { |partial, locale| ["#{partial}.#{locale}", load_partial(partial, locale)] }.to_h

# write files
LOCALES.each do |locale|
  FILENAMES.each do |filename, (os_name, partials)|
    filename += ".#{locale}" unless locale.empty?
    filename += ".md"
    File.open(filename, "w:utf-8") do |f|
      partials.each do |partial|
        content = loaded["#{partial}.#{locale}"].clone
        # remove the OS dependant blocks
        removed_blocks = DELIMITERS.keys - [os_name]
        removed_blocks.each do |block|
          delimiter_start, delimiter_end = DELIMITERS[block]
          pattern = "#{delimiter_start}(.|\n)*?(?<!#{delimiter_end})#{delimiter_end}"
          content.gsub!(/#{pattern}/, "")
        end
        # remove the OS dependant block delimiters
        DELIMITERS[os_name].each do |delimiter|
          content.gsub!(/#{delimiter}/, "")
        end
        CONSTANTS.each do |placeholder, value|
          content.gsub!("<#{placeholder}>", value)
        end
        f << content
        f << "\n\n"
      end
    end
  end
end
