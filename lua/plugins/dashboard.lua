return {
  { "folke/lazy.nvim", opts = { dashboard = { enabled = false } } },
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local utils = require("alpha.utils")

      _Gopts = {
        position = "center",
        hl = "Type",
        wrap = "overflow",
      }

      -- DASHBOARD HEADER

      local function getGreeting(name)
        local tableTime = os.date("*t")
        local hour = tableTime.hour
        local greetingsTable = {
          [1] = "󰤄 Sleep well",
          [2] = "󰖨  Good morning",
          [3] = "󰓠  Good afternoon",
          [4] = "  Good evening",
          [5] = "󰖔  Good night",
        }
        local greetingIndex = 0
        if hour == 23 or hour < 7 then
          greetingIndex = 1
        elseif hour < 12 then
          greetingIndex = 2
        elseif hour >= 12 and hour < 18 then
          greetingIndex = 3
        elseif hour >= 18 and hour < 21 then
          greetingIndex = 4
        elseif hour >= 21 then
          greetingIndex = 5
        end
        return greetingsTable[greetingIndex] .. " " .. name
      end

      local fill = vim.fn.winheight(0) - 43
      local logo = (fill >= 0 and [[










    ]] or "") .. [[
                                              
       ███████████           █████      ██
      ███████████             █████ 
      ████████████████ ███████████ ███   ███████
     ████████████████ ████████████ █████ ██████████████
    █████████████████████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
 ██████   ██  ███████████████   ██ █████████████████
 ██████   ██  ███████████████   ██ █████████████████
      ]]

      local userName = "Joe"
      local greeting = getGreeting(userName)
      local marginBottom = 0

      -- Highlight groups configuration for each segment
      local header_hl = {}

      if fill >= 0 then
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
        table.insert(header_hl, { { "Red", 1, 1 } })
      end
      table.insert(header_hl, { { "AlphaHeader0_0", 46, 48 } }) -- Line 0
      table.insert(header_hl, { -- Line 1
        { "AlphaHeader1_0", 7, 8 },
        { "AlphaHeader1_1", 8, 9 },
        { "AlphaHeader1_2", 9, 10 },
        { "AlphaHeader1_3", 10, 11 },
        { "AlphaHeader1_4", 11, 12 },
        { "AlphaHeader1_5", 12, 13 },
        { "AlphaHeader1_6", 13, 14 },
        { "AlphaHeader1_7", 14, 15 },
        { "AlphaHeader1_8", 15, 16 },
        { "AlphaHeader1_9", 16, 17 },
        { "AlphaHeader1_10", 17, 18 },
        { "AlphaHeader1_11", 18, 19 },
        { "AlphaHeader1_12", 19, 20 },
        { "AlphaHeader1_13", 20, 21 },
        { "AlphaHeader1_14", 21, 22 },
        { "AlphaHeader1_15", 33, 34 },
        { "AlphaHeader1_16", 34, 35 },
        { "AlphaHeader1_17", 35, 36 },
        { "AlphaHeader1_18", 36, 37 },
        { "AlphaHeader1_19", 37, 38 },
        { "AlphaHeader1_20", 38, 39 },
        { "AlphaHeader1_21", 39, 40 },
        { "AlphaHeader1_22", 46, 47 },
        { "AlphaHeader1_23", 47, 48 },
        { "AlphaHeader1_24", 48, 49 },
        { "AlphaHeader1_25", 49, 50 },
      })

      table.insert(header_hl, { -- Line 2
        { "AlphaHeader2_0", 6, 7 },
        { "AlphaHeader2_1", 7, 8 },
        { "AlphaHeader2_2", 8, 9 },
        { "AlphaHeader2_3", 9, 10 },
        { "AlphaHeader2_4", 10, 11 },
        { "AlphaHeader2_5", 11, 12 },
        { "AlphaHeader2_6", 12, 13 },
        { "AlphaHeader2_7", 13, 14 },
        { "AlphaHeader2_8", 14, 15 },
        { "AlphaHeader2_9", 15, 16 },
        { "AlphaHeader2_10", 16, 17 },
        { "AlphaHeader2_11", 17, 18 },
        { "AlphaHeader2_12", 18, 19 },
        { "AlphaHeader2_13", 19, 20 },
        { "AlphaHeader2_14", 20, 21 },
        { "AlphaHeader2_15", 34, 35 },
        { "AlphaHeader2_16", 35, 36 },
        { "AlphaHeader2_17", 36, 37 },
        { "AlphaHeader2_18", 37, 38 },
        { "AlphaHeader2_19", 38, 39 },
        { "AlphaHeader2_20", 39, 40 },
        { "AlphaHeader2_21", 40, 41 },
        { "AlphaHeader2_22", 42, 43 },
      })

      table.insert(header_hl, { -- Line 3
        { "AlphaHeader3_0", 6, 7 },
        { "AlphaHeader3_1", 7, 8 },
        { "AlphaHeader3_2", 8, 9 },
        { "AlphaHeader3_3", 9, 10 },
        { "AlphaHeader3_4", 10, 11 },
        { "AlphaHeader3_5", 11, 12 },
        { "AlphaHeader3_6", 12, 13 },
        { "AlphaHeader3_7", 13, 14 },
        { "AlphaHeader3_8", 14, 15 },
        { "AlphaHeader3_9", 15, 16 },
        { "AlphaHeader3_10", 16, 17 },
        { "AlphaHeader3_11", 17, 18 },
        { "AlphaHeader3_12", 18, 19 },
        { "AlphaHeader3_13", 19, 20 },
        { "AlphaHeader3_14", 20, 21 },
        { "AlphaHeader3_15", 21, 22 },
        { "AlphaHeader3_16", 22, 23 },
        { "AlphaHeader3_17", 23, 24 },
        { "AlphaHeader3_18", 24, 25 },
        { "AlphaHeader3_19", 25, 26 },
        { "AlphaHeader3_20", 26, 27 },
        { "AlphaHeader3_21", 27, 28 },
        { "AlphaHeader3_22", 28, 29 },
        { "AlphaHeader3_23", 30, 31 },
        { "AlphaHeader3_24", 31, 32 },
        { "AlphaHeader3_25", 32, 33 },
        { "AlphaHeader3_26", 33, 34 },
        { "AlphaHeader3_27", 34, 35 },
        { "AlphaHeader3_28", 35, 36 },
        { "AlphaHeader3_29", 36, 37 },
        { "AlphaHeader3_30", 37, 38 },
        { "AlphaHeader3_31", 38, 39 },
        { "AlphaHeader3_32", 39, 40 },
        { "AlphaHeader3_33", 40, 41 },
        { "AlphaHeader3_34", 41, 42 },
        { "AlphaHeader3_35", 42, 43 },
        { "AlphaHeader3_36", 43, 44 },
        { "AlphaHeader3_37", 44, 45 },
        { "AlphaHeader3_38", 46, 47 },
        { "AlphaHeader3_39", 47, 48 },
        { "AlphaHeader3_40", 48, 49 },
        { "AlphaHeader3_41", 49, 50 },
        { "AlphaHeader3_42", 53, 54 },
        { "AlphaHeader3_43", 54, 55 },
        { "AlphaHeader3_44", 55, 56 },
        { "AlphaHeader3_45", 56, 57 },
        { "AlphaHeader3_46", 57, 58 },
        { "AlphaHeader3_47", 58, 59 },
        { "AlphaHeader3_48", 59, 60 },
        { "AlphaHeader3_49", 60, 61 },
        { "AlphaHeader3_50", 61, 62 },
        { "AlphaHeader3_51", 62, 63 },
        { "AlphaHeader3_52", 63, 64 },
        { "AlphaHeader3_53", 64, 65 },
        { "AlphaHeader3_54", 65, 66 },
      })

      table.insert(header_hl, { -- Line 4
        { "AlphaHeader4_0", 5, 6 },
        { "AlphaHeader4_1", 6, 7 },
        { "AlphaHeader4_2", 7, 8 },
        { "AlphaHeader4_3", 8, 9 },
        { "AlphaHeader4_4", 9, 10 },
        { "AlphaHeader4_5", 10, 11 },
        { "AlphaHeader4_6", 11, 12 },
        { "AlphaHeader4_7", 12, 13 },
        { "AlphaHeader4_8", 13, 14 },
        { "AlphaHeader4_9", 14, 15 },
        { "AlphaHeader4_10", 15, 16 },
        { "AlphaHeader4_11", 16, 17 },
        { "AlphaHeader4_12", 17, 18 },
        { "AlphaHeader4_13", 18, 19 },
        { "AlphaHeader4_14", 19, 20 },
        { "AlphaHeader4_15", 20, 21 },
        { "AlphaHeader4_16", 21, 22 },
        { "AlphaHeader4_17", 22, 23 },
        { "AlphaHeader4_18", 23, 24 },
        { "AlphaHeader4_19", 24, 25 },
        { "AlphaHeader4_20", 25, 26 },
        { "AlphaHeader4_21", 26, 27 },
        { "AlphaHeader4_22", 27, 28 },
        { "AlphaHeader4_23", 28, 29 },
        { "AlphaHeader4_24", 30, 31 },
        { "AlphaHeader4_25", 31, 32 },
        { "AlphaHeader4_26", 32, 33 },
        { "AlphaHeader4_27", 33, 34 },
        { "AlphaHeader4_28", 34, 35 },
        { "AlphaHeader4_29", 35, 36 },
        { "AlphaHeader4_30", 36, 37 },
        { "AlphaHeader4_31", 37, 38 },
        { "AlphaHeader4_32", 38, 39 },
        { "AlphaHeader4_33", 39, 40 },
        { "AlphaHeader4_34", 40, 41 },
        { "AlphaHeader4_35", 41, 42 },
        { "AlphaHeader4_36", 42, 43 },
        { "AlphaHeader4_37", 43, 44 },
        { "AlphaHeader4_38", 44, 45 },
        { "AlphaHeader4_39", 46, 47 },
        { "AlphaHeader4_40", 47, 48 },
        { "AlphaHeader4_41", 48, 49 },
        { "AlphaHeader4_42", 49, 50 },
        { "AlphaHeader4_43", 50, 51 },
        { "AlphaHeader4_44", 52, 53 },
        { "AlphaHeader4_45", 53, 54 },
        { "AlphaHeader4_46", 54, 55 },
        { "AlphaHeader4_47", 55, 56 },
        { "AlphaHeader4_48", 56, 57 },
        { "AlphaHeader4_49", 57, 58 },
        { "AlphaHeader4_50", 58, 59 },
        { "AlphaHeader4_51", 59, 60 },
        { "AlphaHeader4_52", 60, 61 },
        { "AlphaHeader4_53", 61, 62 },
        { "AlphaHeader4_54", 62, 63 },
        { "AlphaHeader4_55", 63, 64 },
        { "AlphaHeader4_56", 64, 65 },
        { "AlphaHeader4_57", 65, 66 },
        { "AlphaHeader4_58", 66, 67 },
        { "AlphaHeader4_59", 67, 68 },
      })
      table.insert(header_hl, { -- Line 5
        { "AlphaHeader5_0", 4, 5 },
        { "AlphaHeader5_1", 5, 6 },
        { "AlphaHeader5_2", 6, 7 },
        { "AlphaHeader5_3", 7, 8 },
        { "AlphaHeader5_4", 8, 9 },
        { "AlphaHeader5_5", 9, 10 },
        { "AlphaHeader5_6", 10, 11 },
        { "AlphaHeader5_7", 11, 12 },
        { "AlphaHeader5_8", 12, 13 },
        { "AlphaHeader5_9", 13, 14 },
        { "AlphaHeader5_10", 14, 15 },
        { "AlphaHeader5_11", 15, 16 },
        { "AlphaHeader5_12", 16, 17 },
        { "AlphaHeader5_13", 17, 18 },
        { "AlphaHeader5_14", 18, 19 },
        { "AlphaHeader5_15", 19, 20 },
        { "AlphaHeader5_16", 20, 21 },
        { "AlphaHeader5_17", 21, 22 },
        { "AlphaHeader5_18", 22, 23 },
        { "AlphaHeader5_19", 23, 24 },
        { "AlphaHeader5_20", 24, 25 },
        { "AlphaHeader5_21", 25, 26 },
        { "AlphaHeader5_22", 26, 27 },
        { "AlphaHeader5_23", 27, 28 },
        { "AlphaHeader5_24", 28, 29 },
        { "AlphaHeader5_25", 29, 30 },
        { "AlphaHeader5_26", 30, 31 },
        { "AlphaHeader5_27", 31, 32 },
        { "AlphaHeader5_28", 32, 33 },
        { "AlphaHeader5_29", 33, 34 },
        { "AlphaHeader5_30", 34, 35 },
        { "AlphaHeader5_31", 35, 36 },
        { "AlphaHeader5_32", 36, 37 },
        { "AlphaHeader5_33", 37, 38 },
        { "AlphaHeader5_34", 38, 39 },
        { "AlphaHeader5_35", 39, 40 },
        { "AlphaHeader5_36", 40, 41 },
        { "AlphaHeader5_37", 41, 42 },
        { "AlphaHeader5_38", 42, 43 },
        { "AlphaHeader5_39", 43, 44 },
        { "AlphaHeader5_40", 44, 45 },
        { "AlphaHeader5_41", 46, 47 },
        { "AlphaHeader5_42", 47, 48 },
        { "AlphaHeader5_43", 48, 49 },
        { "AlphaHeader5_44", 49, 50 },
        { "AlphaHeader5_45", 50, 51 },
        { "AlphaHeader5_46", 52, 53 },
        { "AlphaHeader5_47", 53, 54 },
        { "AlphaHeader5_48", 54, 55 },
        { "AlphaHeader5_49", 55, 56 },
        { "AlphaHeader5_50", 56, 57 },
        { "AlphaHeader5_51", 58, 59 },
        { "AlphaHeader5_52", 59, 60 },
        { "AlphaHeader5_53", 60, 61 },
        { "AlphaHeader5_54", 61, 62 },
        { "AlphaHeader5_55", 63, 64 },
        { "AlphaHeader5_56", 64, 65 },
        { "AlphaHeader5_57", 65, 66 },
        { "AlphaHeader5_58", 66, 67 },
        { "AlphaHeader5_59", 67, 68 },
      })
      table.insert(header_hl, { -- Line 6
        { "AlphaHeader6_0", 2, 3 },
        { "AlphaHeader6_1", 3, 4 },
        { "AlphaHeader6_2", 4, 5 },
        { "AlphaHeader6_3", 5, 6 },
        { "AlphaHeader6_4", 6, 7 },
        { "AlphaHeader6_5", 7, 8 },
        { "AlphaHeader6_6", 8, 9 },
        { "AlphaHeader6_7", 9, 10 },
        { "AlphaHeader6_8", 10, 11 },
        { "AlphaHeader6_9", 11, 12 },
        { "AlphaHeader6_10", 12, 13 },
        { "AlphaHeader6_11", 13, 14 },
        { "AlphaHeader6_12", 14, 15 },
        { "AlphaHeader6_13", 15, 16 },
        { "AlphaHeader6_14", 16, 17 },
        { "AlphaHeader6_15", 17, 18 },
        { "AlphaHeader6_16", 18, 19 },
        { "AlphaHeader6_17", 19, 20 },
        { "AlphaHeader6_18", 20, 21 },
        { "AlphaHeader6_19", 21, 22 },
        { "AlphaHeader6_20", 22, 23 },
        { "AlphaHeader6_21", 23, 24 },
        { "AlphaHeader6_22", 24, 25 },
        { "AlphaHeader6_23", 25, 26 },
        { "AlphaHeader6_24", 26, 27 },
        { "AlphaHeader6_25", 27, 28 },
        { "AlphaHeader6_26", 28, 29 },
        { "AlphaHeader6_27", 29, 30 },
        { "AlphaHeader6_28", 30, 31 },
        { "AlphaHeader6_29", 31, 32 },
        { "AlphaHeader6_30", 32, 33 },
        { "AlphaHeader6_31", 33, 34 },
        { "AlphaHeader6_32", 34, 35 },
        { "AlphaHeader6_33", 35, 36 },
        { "AlphaHeader6_34", 36, 37 },
        { "AlphaHeader6_35", 37, 38 },
        { "AlphaHeader6_36", 38, 39 },
        { "AlphaHeader6_37", 39, 40 },
        { "AlphaHeader6_38", 40, 41 },
        { "AlphaHeader6_39", 41, 42 },
        { "AlphaHeader6_40", 42, 43 },
        { "AlphaHeader6_41", 43, 44 },
        { "AlphaHeader6_42", 44, 45 },
        { "AlphaHeader6_43", 46, 47 },
        { "AlphaHeader6_44", 47, 48 },
        { "AlphaHeader6_45", 48, 49 },
        { "AlphaHeader6_46", 49, 50 },
        { "AlphaHeader6_47", 50, 51 },
        { "AlphaHeader6_48", 52, 53 },
        { "AlphaHeader6_49", 53, 54 },
        { "AlphaHeader6_50", 54, 55 },
        { "AlphaHeader6_51", 55, 56 },
        { "AlphaHeader6_52", 56, 57 },
        { "AlphaHeader6_53", 58, 59 },
        { "AlphaHeader6_54", 59, 60 },
        { "AlphaHeader6_55", 60, 61 },
        { "AlphaHeader6_56", 61, 62 },
        { "AlphaHeader6_57", 63, 64 },
        { "AlphaHeader6_58", 64, 65 },
        { "AlphaHeader6_59", 65, 66 },
        { "AlphaHeader6_60", 66, 67 },
        { "AlphaHeader6_61", 67, 68 },
        { "AlphaHeader6_62", 68, 69 },
      })
      table.insert(header_hl, { -- Line 7
        { "AlphaHeader7_0", 1, 2 },
        { "AlphaHeader7_1", 2, 3 },
        { "AlphaHeader7_2", 3, 4 },
        { "AlphaHeader7_3", 4, 5 },
        { "AlphaHeader7_4", 5, 6 },
        { "AlphaHeader7_5", 6, 7 },
        { "AlphaHeader7_6", 7, 8 },
        { "AlphaHeader7_7", 8, 9 },
        { "AlphaHeader7_8", 11, 12 },
        { "AlphaHeader7_9", 12, 13 },
        { "AlphaHeader7_10", 13, 14 },
        { "AlphaHeader7_11", 14, 15 },
        { "AlphaHeader7_12", 15, 16 },
        { "AlphaHeader7_13", 17, 18 },
        { "AlphaHeader7_14", 18, 19 },
        { "AlphaHeader7_15", 19, 20 },
        { "AlphaHeader7_16", 20, 21 },
        { "AlphaHeader7_17", 21, 22 },
        { "AlphaHeader7_18", 22, 23 },
        { "AlphaHeader7_19", 23, 24 },
        { "AlphaHeader7_20", 24, 25 },
        { "AlphaHeader7_21", 25, 26 },
        { "AlphaHeader7_22", 26, 27 },
        { "AlphaHeader7_23", 27, 28 },
        { "AlphaHeader7_24", 28, 29 },
        { "AlphaHeader7_25", 29, 30 },
        { "AlphaHeader7_26", 30, 31 },
        { "AlphaHeader7_27", 31, 32 },
        { "AlphaHeader7_28", 32, 33 },
        { "AlphaHeader7_29", 33, 34 },
        { "AlphaHeader7_30", 34, 35 },
        { "AlphaHeader7_31", 35, 36 },
        { "AlphaHeader7_32", 36, 37 },
        { "AlphaHeader7_33", 37, 38 },
        { "AlphaHeader7_34", 39, 40 },
        { "AlphaHeader7_35", 40, 41 },
        { "AlphaHeader7_36", 41, 42 },
        { "AlphaHeader7_37", 42, 43 },
        { "AlphaHeader7_38", 43, 44 },
        { "AlphaHeader7_39", 44, 45 },
        { "AlphaHeader7_40", 46, 47 },
        { "AlphaHeader7_41", 47, 48 },
        { "AlphaHeader7_42", 48, 49 },
        { "AlphaHeader7_43", 49, 50 },
        { "AlphaHeader7_44", 50, 51 },
        { "AlphaHeader7_45", 52, 53 },
        { "AlphaHeader7_46", 53, 54 },
        { "AlphaHeader7_47", 54, 55 },
        { "AlphaHeader7_48", 55, 56 },
        { "AlphaHeader7_49", 56, 57 },
        { "AlphaHeader7_50", 58, 59 },
        { "AlphaHeader7_51", 59, 60 },
        { "AlphaHeader7_52", 60, 61 },
        { "AlphaHeader7_53", 61, 62 },
        { "AlphaHeader7_54", 63, 64 },
        { "AlphaHeader7_55", 64, 65 },
        { "AlphaHeader7_56", 65, 66 },
        { "AlphaHeader7_57", 66, 67 },
        { "AlphaHeader7_58", 67, 68 },
        { "AlphaHeader7_59", 68, 69 },
        { "AlphaHeader7_60", 69, 70 },
      })
      table.insert(header_hl, { -- Line 8
        { "AlphaHeader8_0", 1, 2 },
        { "AlphaHeader8_1", 2, 3 },
        { "AlphaHeader8_2", 3, 4 },
        { "AlphaHeader8_3", 4, 5 },
        { "AlphaHeader8_4", 5, 6 },
        { "AlphaHeader8_5", 6, 7 },
        { "AlphaHeader8_6", 7, 8 },
        { "AlphaHeader8_7", 8, 9 },
        { "AlphaHeader8_8", 12, 13 },
        { "AlphaHeader8_9", 13, 14 },
        { "AlphaHeader8_10", 14, 15 },
        { "AlphaHeader8_11", 15, 16 },
        { "AlphaHeader8_12", 18, 19 },
        { "AlphaHeader8_13", 19, 20 },
        { "AlphaHeader8_14", 20, 21 },
        { "AlphaHeader8_15", 21, 22 },
        { "AlphaHeader8_16", 22, 23 },
        { "AlphaHeader8_17", 23, 24 },
        { "AlphaHeader8_18", 24, 25 },
        { "AlphaHeader8_19", 25, 26 },
        { "AlphaHeader8_20", 26, 27 },
        { "AlphaHeader8_21", 27, 28 },
        { "AlphaHeader8_22", 28, 29 },
        { "AlphaHeader8_23", 29, 30 },
        { "AlphaHeader8_24", 30, 31 },
        { "AlphaHeader8_25", 31, 32 },
        { "AlphaHeader8_26", 32, 33 },
        { "AlphaHeader8_27", 33, 34 },
        { "AlphaHeader8_28", 34, 35 },
        { "AlphaHeader8_29", 35, 36 },
        { "AlphaHeader8_30", 36, 37 },
        { "AlphaHeader8_31", 40, 41 },
        { "AlphaHeader8_32", 41, 42 },
        { "AlphaHeader8_33", 42, 43 },
        { "AlphaHeader8_34", 43, 44 },
        { "AlphaHeader8_35", 45, 46 },
        { "AlphaHeader8_36", 46, 47 },
        { "AlphaHeader8_37", 47, 48 },
        { "AlphaHeader8_38", 48, 49 },
        { "AlphaHeader8_39", 49, 50 },
        { "AlphaHeader8_40", 50, 51 },
        { "AlphaHeader8_41", 51, 52 },
        { "AlphaHeader8_42", 52, 53 },
        { "AlphaHeader8_43", 53, 54 },
        { "AlphaHeader8_44", 54, 55 },
        { "AlphaHeader8_45", 55, 56 },
        { "AlphaHeader8_46", 56, 57 },
        { "AlphaHeader8_47", 57, 58 },
        { "AlphaHeader8_48", 58, 59 },
        { "AlphaHeader8_49", 59, 60 },
        { "AlphaHeader8_50", 60, 61 },
        { "AlphaHeader8_51", 61, 62 },
        { "AlphaHeader8_52", 62, 63 },
        { "AlphaHeader8_53", 63, 64 },
        { "AlphaHeader8_54", 64, 65 },
        { "AlphaHeader8_55", 65, 66 },
        { "AlphaHeader8_56", 66, 67 },
        { "AlphaHeader8_57", 67, 68 },
        { "AlphaHeader8_58", 68, 69 },
        { "AlphaHeader8_59", 69, 70 },
      })

      table.insert(header_hl, { -- Line 9
        { "AlphaHeader9_0", 1, 2 },
        { "AlphaHeader9_1", 2, 3 },
        { "AlphaHeader9_2", 3, 4 },
        { "AlphaHeader9_3", 4, 5 },
        { "AlphaHeader9_4", 5, 6 },
        { "AlphaHeader9_5", 6, 7 },
        { "AlphaHeader9_6", 7, 8 },
        { "AlphaHeader9_7", 8, 9 },
        { "AlphaHeader9_8", 12, 13 },
        { "AlphaHeader9_9", 13, 14 },
        { "AlphaHeader9_10", 14, 15 },
        { "AlphaHeader9_11", 15, 16 },
        { "AlphaHeader9_12", 18, 19 },
        { "AlphaHeader9_13", 19, 20 },
        { "AlphaHeader9_14", 20, 21 },
        { "AlphaHeader9_15", 21, 22 },
        { "AlphaHeader9_16", 22, 23 },
        { "AlphaHeader9_17", 23, 24 },
        { "AlphaHeader9_18", 24, 25 },
        { "AlphaHeader9_19", 25, 26 },
        { "AlphaHeader9_20", 26, 27 },
        { "AlphaHeader9_21", 27, 28 },
        { "AlphaHeader9_22", 28, 29 },
        { "AlphaHeader9_23", 29, 30 },
        { "AlphaHeader9_24", 30, 31 },
        { "AlphaHeader9_25", 31, 32 },
        { "AlphaHeader9_26", 32, 33 },
        { "AlphaHeader9_27", 33, 34 },
        { "AlphaHeader9_28", 34, 35 },
        { "AlphaHeader9_29", 35, 36 },
        { "AlphaHeader9_30", 36, 37 },
        { "AlphaHeader9_31", 40, 41 },
        { "AlphaHeader9_32", 41, 42 },
        { "AlphaHeader9_33", 42, 43 },
        { "AlphaHeader9_34", 43, 44 },
        { "AlphaHeader9_35", 45, 46 },
        { "AlphaHeader9_36", 46, 47 },
        { "AlphaHeader9_37", 47, 48 },
        { "AlphaHeader9_38", 48, 49 },
        { "AlphaHeader9_39", 49, 50 },
        { "AlphaHeader9_40", 50, 51 },
        { "AlphaHeader9_41", 51, 52 },
        { "AlphaHeader9_42", 52, 53 },
        { "AlphaHeader9_43", 53, 54 },
        { "AlphaHeader9_44", 54, 55 },
        { "AlphaHeader9_45", 55, 56 },
        { "AlphaHeader9_46", 56, 57 },
        { "AlphaHeader9_47", 57, 58 },
        { "AlphaHeader9_48", 58, 59 },
        { "AlphaHeader9_49", 59, 60 },
        { "AlphaHeader9_50", 60, 61 },
        { "AlphaHeader9_51", 61, 62 },
        { "AlphaHeader9_52", 62, 63 },
        { "AlphaHeader9_53", 63, 64 },
        { "AlphaHeader9_54", 64, 65 },
        { "AlphaHeader9_55", 65, 66 },
        { "AlphaHeader9_56", 66, 67 },
        { "AlphaHeader9_57", 67, 68 },
        { "AlphaHeader9_58", 68, 69 },
        { "AlphaHeader9_59", 69, 70 },
      })

      -- Linea 1
      vim.api.nvim_set_hl(0, "AlphaHeader0_0", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_0", { fg = "#2FF14F" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_1", { fg = "#2FF14F" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_2", { fg = "#36F440" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_3", { fg = "#40F42D" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_4", { fg = "#40F42D" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_5", { fg = "#4AF419" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_6", { fg = "#6BF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_7", { fg = "#77EC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_8", { fg = "#77EC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_9", { fg = "#82E600" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_10", { fg = "#8FE100" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_11", { fg = "#9BD900" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_12", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_13", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_14", { fg = "#BDBE00" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_15", { fg = "#FA3556" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_16", { fg = "#F62E62" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_17", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_18", { fg = "#EE2678" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_19", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_20", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_21", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_22", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_23", { fg = "#8A27E3" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_24", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader1_25", { fg = "#7D2BE9" })

      -- Linea 2
      vim.api.nvim_set_hl(0, "AlphaHeader2_0", { fg = "#38F43C" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_1", { fg = "#40F42D" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_2", { fg = "#4AF419" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_3", { fg = "#4AF419" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_4", { fg = "#53F404" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_5", { fg = "#56F400" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_6", { fg = "#75EC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_7", { fg = "#77EC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_8", { fg = "#92DF00" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_9", { fg = "#9BD900" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_10", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_11", { fg = "#B2C800" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_12", { fg = "#BDBE00" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_13", { fg = "#C8B400" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_14", { fg = "#D1A900" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_15", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_16", { fg = "#E62287" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_17", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_18", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_19", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_20", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_21", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader2_22", { fg = "#A223D4" })

      -- Linea 3
      vim.api.nvim_set_hl(0, "AlphaHeader3_0", { fg = "#55F400" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_1", { fg = "#60F300" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_2", { fg = "#6BF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_3", { fg = "#77EC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_4", { fg = "#83E600" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_5", { fg = "#8FE100" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_6", { fg = "#9BD900" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_7", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_8", { fg = "#B2C800" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_9", { fg = "#BDBE00" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_10", { fg = "#C8B400" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_11", { fg = "#D1A900" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_12", { fg = "#DA9D00" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_13", { fg = "#E19300" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_14", { fg = "#E38301" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_15", { fg = "#EF7C00" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_16", { fg = "#F3700E" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_17", { fg = "#F7651C" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_18", { fg = "#FA5929" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_19", { fg = "#FC4F33" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_20", { fg = "#FC4540" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_21", { fg = "#FC3E4A" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_22", { fg = "#FA3556" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_23", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_24", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_25", { fg = "#E62287" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_26", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_27", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_28", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_29", { fg = "#C41FB6" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_30", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_31", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_32", { fg = "#A223D4" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_33", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_34", { fg = "#8F26E0" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_35", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_36", { fg = "#7030EE" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_37", { fg = "#6535F2" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_38", { fg = "#4D43F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_39", { fg = "#424DF6" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_40", { fg = "#3656F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_41", { fg = "#2D61F3" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_42", { fg = "#0D85D2" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_43", { fg = "#0598D7" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_44", { fg = "#03A3CD" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_45", { fg = "#04AEC4" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_46", { fg = "#05B8B9" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_47", { fg = "#08C2AE" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_48", { fg = "#0BCCA1" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_49", { fg = "#0FD395" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_50", { fg = "#15DC88" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_51", { fg = "#1AE279" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_52", { fg = "#22E86B" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_53", { fg = "#28EE5C" })
      vim.api.nvim_set_hl(0, "AlphaHeader3_54", { fg = "#31F24D" })

      -- Linea 4
      vim.api.nvim_set_hl(0, "AlphaHeader4_0", { fg = "#6BF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_1", { fg = "#77EC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_2", { fg = "#83E600" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_3", { fg = "#8FE100" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_4", { fg = "#9BD900" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_5", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_6", { fg = "#B2C800" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_7", { fg = "#BDBE00" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_8", { fg = "#C8B400" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_9", { fg = "#D1A900" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_10", { fg = "#DA9D00" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_11", { fg = "#E19300" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_12", { fg = "#E88600" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_13", { fg = "#EF7C00" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_14", { fg = "#F3700E" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_15", { fg = "#F7651C" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_16", { fg = "#FA5929" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_17", { fg = "#FC4F33" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_18", { fg = "#FC4540" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_19", { fg = "#FC3E4A" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_20", { fg = "#FA3556" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_21", { fg = "#F62E62" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_22", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_23", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_24", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_25", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_26", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_27", { fg = "#C41FB6" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_28", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_29", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_30", { fg = "#A223D4" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_31", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_32", { fg = "#8A27E3" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_33", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_34", { fg = "#7030EE" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_35", { fg = "#6535F2" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_36", { fg = "#583CF4" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_37", { fg = "#4D43F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_38", { fg = "#424DF6" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_39", { fg = "#2D61F3" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_40", { fg = "#236BF0" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_41", { fg = "#1A75EB" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_42", { fg = "#1281E6" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_43", { fg = "#0A8CDF" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_44", { fg = "#03A3CD" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_45", { fg = "#04AEC4" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_46", { fg = "#05B8B9" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_47", { fg = "#08C2AE" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_48", { fg = "#0BCCA1" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_49", { fg = "#0FD395" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_50", { fg = "#15DC88" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_51", { fg = "#1AE279" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_52", { fg = "#22E86B" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_53", { fg = "#28EE5C" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_54", { fg = "#31F24D" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_55", { fg = "#38F43D" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_56", { fg = "#42F42A" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_57", { fg = "#4CF413" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_58", { fg = "#57F400" })
      vim.api.nvim_set_hl(0, "AlphaHeader4_59", { fg = "#61F200" })

      -- Linea 5
      vim.api.nvim_set_hl(0, "AlphaHeader5_0", { fg = "#83E600" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_1", { fg = "#8FE100" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_2", { fg = "#9BD900" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_3", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_4", { fg = "#B2C800" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_5", { fg = "#BDBE00" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_6", { fg = "#C8B400" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_7", { fg = "#D1A900" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_8", { fg = "#DA9D00" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_9", { fg = "#E19300" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_10", { fg = "#E88600" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_11", { fg = "#EF7C00" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_12", { fg = "#F3700E" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_13", { fg = "#F7651C" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_14", { fg = "#FA5929" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_15", { fg = "#FC4F33" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_16", { fg = "#FC4540" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_17", { fg = "#FC3E4A" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_18", { fg = "#FA3556" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_19", { fg = "#F62E62" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_20", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_21", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_22", { fg = "#E62287" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_23", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_24", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_25", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_26", { fg = "#C41FB6" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_27", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_28", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_29", { fg = "#A223D4" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_30", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_31", { fg = "#8A27E3" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_32", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_33", { fg = "#7030EE" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_34", { fg = "#6535F2" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_35", { fg = "#583CF4" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_36", { fg = "#4D43F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_37", { fg = "#424DF6" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_38", { fg = "#3656F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_39", { fg = "#2D61F3" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_40", { fg = "#236BF0" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_41", { fg = "#1281E6" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_42", { fg = "#0A8CDF" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_43", { fg = "#0598D7" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_44", { fg = "#03A3CD" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_45", { fg = "#04AEC4" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_46", { fg = "#08C2AE" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_47", { fg = "#0BCCA1" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_48", { fg = "#0FD395" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_49", { fg = "#15DC88" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_50", { fg = "#1AE279" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_51", { fg = "#28EE5C" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_52", { fg = "#31F24D" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_53", { fg = "#38F43D" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_54", { fg = "#42F42A" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_55", { fg = "#57F400" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_56", { fg = "#61F200" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_57", { fg = "#6DF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_58", { fg = "#79EB00" })
      vim.api.nvim_set_hl(0, "AlphaHeader5_59", { fg = "#85E500" })

      -- Linea 6
      vim.api.nvim_set_hl(0, "AlphaHeader6_0", { fg = "#8FE100" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_1", { fg = "#9BD900" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_2", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_3", { fg = "#B2C800" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_4", { fg = "#BDBE00" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_5", { fg = "#C8B400" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_6", { fg = "#D1A900" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_7", { fg = "#DA9D00" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_8", { fg = "#E19300" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_9", { fg = "#E88600" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_10", { fg = "#EF7C00" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_11", { fg = "#F3700E" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_12", { fg = "#F7651C" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_13", { fg = "#FA5929" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_14", { fg = "#FC4F33" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_15", { fg = "#FC4540" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_16", { fg = "#FC3E4A" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_17", { fg = "#FA3556" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_18", { fg = "#F62E62" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_19", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_20", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_21", { fg = "#E62287" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_22", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_23", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_24", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_25", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_26", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_27", { fg = "#C41FB6" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_28", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_29", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_30", { fg = "#A223D4" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_31", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_32", { fg = "#8A27E3" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_33", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_34", { fg = "#7030EE" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_35", { fg = "#6535F2" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_36", { fg = "#424DF6" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_37", { fg = "#3656F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_38", { fg = "#2D61F3" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_39", { fg = "#236BF0" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_40", { fg = "#1A75EB" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_41", { fg = "#1281E6" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_42", { fg = "#0A8CDF" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_43", { fg = "#03A3CD" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_44", { fg = "#04AEC4" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_45", { fg = "#05B8B9" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_46", { fg = "#08C2AE" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_47", { fg = "#0BCCA1" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_48", { fg = "#15DC88" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_49", { fg = "#1AE279" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_50", { fg = "#22E86B" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_51", { fg = "#28EE5C" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_52", { fg = "#31F24D" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_53", { fg = "#42F42A" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_54", { fg = "#4CF413" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_55", { fg = "#57F400" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_56", { fg = "#61F200" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_57", { fg = "#79EB00" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_58", { fg = "#85E500" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_59", { fg = "#91DF00" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_60", { fg = "#9DD800" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_61", { fg = "#A8CF00" })
      vim.api.nvim_set_hl(0, "AlphaHeader6_62", { fg = "#B4C600" })

      -- Linea 7
      vim.api.nvim_set_hl(0, "AlphaHeader7_0", { fg = "#A6D000" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_1", { fg = "#B2C800" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_2", { fg = "#BDBE00" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_3", { fg = "#C8B400" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_4", { fg = "#D1A900" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_5", { fg = "#DA9D00" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_6", { fg = "#E19300" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_7", { fg = "#E88600" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_8", { fg = "#F7651C" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_9", { fg = "#FA5929" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_10", { fg = "#FC4F33" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_11", { fg = "#FC4540" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_12", { fg = "#FC3E4A" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_13", { fg = "#F62E62" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_14", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_15", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_16", { fg = "#E62287" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_17", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_18", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_19", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_20", { fg = "#C41FB6" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_21", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_22", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_23", { fg = "#A223D4" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_24", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_25", { fg = "#8A27E3" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_26", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_27", { fg = "#7030EE" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_28", { fg = "#6535F2" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_29", { fg = "#583CF4" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_30", { fg = "#4D43F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_31", { fg = "#424DF6" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_32", { fg = "#3656F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_33", { fg = "#2D61F3" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_34", { fg = "#1A75EB" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_35", { fg = "#1281E6" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_36", { fg = "#0A8CDF" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_37", { fg = "#0598D7" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_38", { fg = "#03A3CD" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_39", { fg = "#04AEC4" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_40", { fg = "#08C2AE" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_41", { fg = "#0BCCA1" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_42", { fg = "#0FD395" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_43", { fg = "#15DC88" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_44", { fg = "#1AE279" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_45", { fg = "#28EE5C" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_46", { fg = "#31F24D" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_47", { fg = "#38F43D" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_48", { fg = "#42F42A" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_49", { fg = "#4CF413" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_50", { fg = "#61F200" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_51", { fg = "#6DF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_52", { fg = "#79EB00" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_53", { fg = "#85E500" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_54", { fg = "#9DD800" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_55", { fg = "#A8CF00" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_56", { fg = "#B4C600" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_57", { fg = "#BFBC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_58", { fg = "#C9B200" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_59", { fg = "#D2A800" })
      vim.api.nvim_set_hl(0, "AlphaHeader7_60", { fg = "#DC9B00" })

      -- Linea 8
      vim.api.nvim_set_hl(0, "AlphaHeader8_0", { fg = "#C8B400" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_1", { fg = "#D1A900" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_2", { fg = "#DA9D00" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_3", { fg = "#E19300" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_4", { fg = "#E88600" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_5", { fg = "#EF7C00" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_6", { fg = "#F3700E" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_7", { fg = "#F46E11" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_8", { fg = "#FC3E4A" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_9", { fg = "#FA3556" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_10", { fg = "#F62E62" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_11", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_12", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_13", { fg = "#D71FA0" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_14", { fg = "#CD1FAB" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_15", { fg = "#C41FB6" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_16", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_17", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_18", { fg = "#A223D4" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_19", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_20", { fg = "#8A27E3" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_21", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_22", { fg = "#7030EE" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_23", { fg = "#6535F2" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_24", { fg = "#583CF4" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_25", { fg = "#4D43F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_26", { fg = "#424DF6" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_27", { fg = "#3656F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_28", { fg = "#2D61F3" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_29", { fg = "#236BF0" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_30", { fg = "#1A7AF0" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_31", { fg = "#03A3CD" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_32", { fg = "#04AEC4" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_33", { fg = "#05B8B9" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_34", { fg = "#08C2AE" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_35", { fg = "#0FD395" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_36", { fg = "#15DC88" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_37", { fg = "#1AE279" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_38", { fg = "#22E86B" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_39", { fg = "#28EE5C" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_40", { fg = "#31F24D" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_41", { fg = "#38F43D" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_42", { fg = "#42F42A" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_43", { fg = "#4CF413" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_44", { fg = "#59F400" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_45", { fg = "#61F200" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_46", { fg = "#6DF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_47", { fg = "#79EB00" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_48", { fg = "#85E500" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_49", { fg = "#91DF00" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_50", { fg = "#9DD800" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_51", { fg = "#A8CF00" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_52", { fg = "#B4C600" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_53", { fg = "#BFBC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_54", { fg = "#C9B200" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_55", { fg = "#D2A800" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_56", { fg = "#DC9B00" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_57", { fg = "#E29100" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_58", { fg = "#E98400" })
      vim.api.nvim_set_hl(0, "AlphaHeader8_59", { fg = "#F07A00" })

      -- Linea 9
      vim.api.nvim_set_hl(0, "AlphaHeader9_0", { fg = "#E19300" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_1", { fg = "#E88600" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_2", { fg = "#EF7C00" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_3", { fg = "#F3700E" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_4", { fg = "#F7651C" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_5", { fg = "#FA5929" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_6", { fg = "#FC4F33" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_7", { fg = "#FC4540" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_8", { fg = "#F2296F" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_9", { fg = "#ED257B" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_10", { fg = "#E62287" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_11", { fg = "#DE2094" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_12", { fg = "#C41FB6" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_13", { fg = "#B820C0" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_14", { fg = "#AD21CA" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_15", { fg = "#A223D4" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_16", { fg = "#9525DC" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_17", { fg = "#8A27E3" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_18", { fg = "#7D2BE9" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_19", { fg = "#7030EE" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_20", { fg = "#6535F2" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_21", { fg = "#583CF4" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_22", { fg = "#4D43F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_23", { fg = "#4047F9" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_24", { fg = "#424DF6" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_25", { fg = "#3656F6" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_26", { fg = "#2D61F3" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_27", { fg = "#1E71ED" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_28", { fg = "#1281E6" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_29", { fg = "#0A8CDF" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_30", { fg = "#0598D7" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_31", { fg = "#08C2AE" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_32", { fg = "#0BCCA1" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_33", { fg = "#0FD395" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_34", { fg = "#15DC88" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_35", { fg = "#22E86B" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_36", { fg = "#28EE5C" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_37", { fg = "#31F24D" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_38", { fg = "#38F43D" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_39", { fg = "#42F42A" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_40", { fg = "#4CF413" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_41", { fg = "#57F400" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_42", { fg = "#61F200" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_43", { fg = "#6DF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_44", { fg = "#6DF000" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_45", { fg = "#79EB00" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_46", { fg = "#85E500" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_47", { fg = "#9DD800" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_48", { fg = "#A8CF00" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_49", { fg = "#B4C600" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_50", { fg = "#BFBC00" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_51", { fg = "#C9B200" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_52", { fg = "#D2A800" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_53", { fg = "#DC9B00" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_54", { fg = "#E29100" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_55", { fg = "#E98400" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_56", { fg = "#F07A00" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_57", { fg = "#F46E10" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_58", { fg = "#F8631E" })
      vim.api.nvim_set_hl(0, "AlphaHeader9_59", { fg = "#FB582A" })

      local header_val = vim.split(logo, "\n")
      header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)

      dashboard.section.header.opts.hl = header_hl
      dashboard.section.header.val = header_val
      -- Split logo into lines
      local logoLines = {}
      for line in logo:gmatch("[^\r\n]+") do
        table.insert(logoLines, line)
      end

      -- Calculate padding for centering the greeting
      local logoWidth = logo:find("\n") - 1 -- Assuming the logo width is the width of the first line
      local greetingWidth = #greeting
      local padding = math.floor((logoWidth - greetingWidth) / 2)

      -- Generate spaces for padding
      local paddedGreeting = string.rep(" ", padding) .. greeting

      -- Add margin lines below the padded greeting
      local margin = string.rep("\n", marginBottom)

      -- Concatenate logo, padded greeting, and margin
      local adjustedLogo = logo .. "\n" .. paddedGreeting .. margin

      local init_path = vim.fn.stdpath("config")

      dashboard.section.greeting = {
        type = "text",
        val = greeting,
        opts = {
          position = "center",
        },
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
        dashboard.button("s", "  Restore Session", "<cmd>:lua require('persistence').load({ last = true })<CR>"),
        dashboard.button("c", "  Settings", ":cd " .. init_path .. "<CR>:e init.lua<CR>"),
        dashboard.button("q", "󰿅  Quit", "<cmd>q<CR>"),
        -- dashboard.button('', ''),
      }

      dashboard.section.buttons.opts.hl = "AlphaHeader1_0"
      -- local function footer()
      -- 	return "Footer Text"
      -- end

      -- Layout
      dashboard.config.layout = {
        { type = "padding", val = 4 },
        dashboard.section.header,
        { type = "padding", val = 2 }, -- Espacio entre logo y saludo
        dashboard.section.greeting, -- NUESTRA SECCIÓN DE SALUDO
        { type = "padding", val = 2 }, -- Espacio entre saludo y botones
        dashboard.section.buttons,
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        desc = "Add Alpha dashboard footer",
        once = true,
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          dashboard.section.footer.val = {}
          if fill >= 0 then
            table.insert(dashboard.section.footer.val, "")
          end
          table.insert(dashboard.section.footer.val, " Loaded " .. stats.count .. " plugins  in " .. ms .. " ms ")
          for _ = 1, fill do
            table.insert(dashboard.section.footer.val, "")
          end
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
      -- Hide all the unnecessary visual elements while on the dashboard, and add
      -- them back when leaving the dashboard.
      local group = vim.api.nvim_create_augroup("CleanDashboard", {})

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "AlphaReady",
        callback = function()
          -- vim.opt.showtabline = 0
          -- vim.opt.showmode = true
          -- vim.opt.laststatus = 3
          vim.opt.showcmd = false
          vim.opt.ruler = false
        end,
      })

      vim.api.nvim_create_autocmd("BufUnload", {
        group = group,
        pattern = "<buffer>",
        callback = function()
          -- vim.opt.showtabline = 0
          -- vim.opt.showmode = true
          -- vim.opt.laststatus = 3
          vim.opt.showcmd = true
          vim.opt.ruler = true
        end,
      })
      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)
    end,
  },
  --  {
  --    "folke/snacks.nvim",
  --    opts = {
  --      notifier = {},
  --      image = {},
  --      picker = {
  --        exclude = {
  --          ".git",
  --          "node_modules",
  --        },
  --        matcher = {
  --          fuzzy = true,
  --          smartcase = true,
  --          ignorecase = true,
  --          filename_bonus = true,
  --        },
  --        sources = {
  --          -- explorer = { ... },
  --        },
  --      },
  --      dashboard = {
  --        enabled = false
  --        sections = {
  --          { section = "header", hl = "NeovimDashboardLogo1" },
  --          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
  --          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
  --          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
  --          { section = "startup" },
  --        },
  --        preset = {
  --          header = [[
  --
  --
  --      ]],
  --        -- stylua: ignore
  --        ---@type snacks.dashboard.Item[]
  --        keys = {
  --          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
  --          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
  --          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
  --          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
  --          {
  --            icon = " ",
  --            key = "c",
  --            desc = "Config",
  --            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
  --          },
  --          { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load({ last = true })" },
  --          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
  --          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
  --          { icon = " ", key = "q", desc = "Quit", action = ":wqall" },
  --        },
  --        },
  --      },
  --    },
  --  },
  -- }
}
