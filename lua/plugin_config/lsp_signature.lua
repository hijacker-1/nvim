require("lsp_signature").setup(
    {
        bind = true,
        -- 边框样式
        handler_opts = {
            -- double、rounded、single、shadow、none
            border = "double"
        },
        -- 自动触发
        floating_window = true,
        floating_window_above_cur_line = true,
        fix_pos = true,
        -- 绑定按键
        toggle_key = "<C-i>",
        -- 虚拟提示关闭
        hint_enable = false,
        -- 正在输入的参数将如何突出显示
        hi_parameter = "LspSignatureActiveParameter",
        always_trigger = false,
    }
)
