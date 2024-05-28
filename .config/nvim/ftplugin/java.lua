-- JDTLS (Java LSP) configuration
local jdtls = require('jdtls')
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.env.HOME .. '/jdtls-workspace/' .. project_name

local bundles = {
	vim.fn.glob(vim.env.HOME .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar", 1)
}

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. vim.env.HOME .. '/.local/share/nvim/mason/share/jdtls/lombok.jar',
    '-Xmx4g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- Eclipse jdtls location
    '-jar', vim.env.HOME .. '/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar',
    -- TODO Update this to point to the correct jdtls subdirectory for your OS (config_linux, config_mac, config_win, etc)
    '-configuration', vim.env.HOME .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
    '-data', workspace_dir
  },

  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'pom.xml', 'build.gradle'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  settings = {
    java = {
      -- TODO Replace this with the absolute path to your main java version (JDK 17 or higher)
      home = '/usr/lib/jvm/java-17-openjdk',
      eclipse = {
	downloadSources = true,
      },
      configuration = {
	updateBuildConfiguration = "interactive",
	runtimes = {
	  -- {
	  --   name = "JavaSE-11",
	  --   path = "/usr/lib/jvm/java-11-openjdk",
	  -- },
	  {
	    name = "JavaSE-17",
	    path = "/usr/lib/jvm/java-17-openjdk",
	  },
	  -- {
	  --   name = "JavaSE-19",
	  --   path = "/usr/lib/jvm/java-19-openjdk",
	  -- }
	}
      },
      maven = {
	downloadSources = true,
      },
      implementationsCodeLens = {
	enabled = true,
      },
      referencesCodeLens = {
	enabled = true,
      },
      references = {
	includeDecompiledSources = true,
      },
      signatureHelp = { enabled = true },
      format = {
	enabled = true,
	-- Formatting works by default, but you can refer to a specific file/URL if you choose
	-- settings = {
	--   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
	--   profile = "GoogleStyle",
	-- },
      },
    },
    completion = {
      favoriteStaticMembers = {
	"org.hamcrest.MatcherAssert.assertThat",
	"org.hamcrest.Matchers.*",
	"org.hamcrest.CoreMatchers.*",
	"org.junit.jupiter.api.Assertions.*",
	"java.util.Objects.requireNonNull",
	"java.util.Objects.requireNonNullElse",
	"org.mockito.Mockito.*",
      },
      importOrder = {
	"java",
	"javax",
	"com",
	"org"
      },
    },
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
    sources = {
      organizeImports = {
	starThreshold = 9999,
	staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
	template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  -- Needed for auto-completion with method signatures and placeholders
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    -- References the bundles defined above to support Debugging and Unit Testing
    bundles = bundles
  },
}

-- Needed for debugging
config['on_attach'] = function(client, bufnr)
  jdtls.setup_dap({ hotcodereplace = 'auto' })
  require('jdtls.dap').setup_dap_main_class_configs()
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)

-- run debug
function get_test_runner(test_name, debug)
  if debug then
    return 'mvn test -Dmaven.surefire.debug -Dtest="' .. test_name .. '"' 
  end
  return 'mvn test -Dtest="' .. test_name .. '"' 
end

function run_java_test_method(debug)
  local utils = require'utils'
  local method_name = utils.get_current_full_method_name("\\#")
  vim.cmd('term ' .. get_test_runner(method_name, debug))
end

function run_java_test_class(debug)
  local utils = require'utils'
  local class_name = utils.get_current_full_class_name()
  vim.cmd('term ' .. get_test_runner(class_name, debug))
end

function get_spring_boot_runner(profile, debug)
  local debug_param = ""
  if debug then
    debug_param = ' -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005" '
  end 

  local profile_param = ""
  if profile then
    profile_param = " -Dspring-boot.run.profiles=" .. profile .. " "
  end

  return 'mvn spring-boot:run ' .. profile_param .. debug_param
end
function run_spring_boot(debug)
  vim.cmd('term ' .. get_spring_boot_runner(method_name, debug))
end

-- Java specific keybindings
vim.keymap.set('n', '<leader>o', require('jdtls').organize_imports, {noremap=true})
vim.keymap.set("n", "<leader>tm", function() run_java_test_method() end)
vim.keymap.set("n", "<leader>TM", function() run_java_test_method(true) end)
vim.keymap.set("n", "<leader>tc", function() run_java_test_class() end)
vim.keymap.set("n", "<leader>TC", function() run_java_test_class(true) end)
vim.keymap.set("n", "<F9>", function() run_spring_boot() end)
vim.keymap.set("n", "<F10>", function() run_spring_boot(true) end)
