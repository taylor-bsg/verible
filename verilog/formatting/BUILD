# This package SystemVerilog-specific code formatting functions.

licenses(["notice"])

package(
    default_visibility = [
        "//verilog/tools/formatter:__pkg__",
    ],
)

# libraries

cc_library(
    name = "tree_unwrapper",
    srcs = ["tree_unwrapper.cc"],
    hdrs = ["tree_unwrapper.h"],
    deps = [
        ":verilog_token",
        "//common/formatting:basic_format_style",
        "//common/formatting:format_token",
        "//common/formatting:token_partition_tree",
        "//common/formatting:tree_unwrapper",
        "//common/formatting:unwrapped_line",
        "//common/text:concrete_syntax_leaf",
        "//common/text:concrete_syntax_tree",
        "//common/text:constants",
        "//common/text:symbol",
        "//common/text:syntax_tree_context",
        "//common/text:text_structure",
        "//common/text:token_info",
        "//common/text:token_stream_view",
        "//common/util:container_iterator_range",
        "//common/util:enum_flags",
        "//common/util:logging",
        "//common/util:value_saver",
        "//verilog/CST:identifier",
        "//verilog/CST:verilog_nonterminals",
        "//verilog/parser:verilog_parser",  # only for verilog_symbol_name
        "//verilog/parser:verilog_token_enum",
        "@com_google_absl//absl/base:core_headers",
        "@com_google_absl//absl/strings",
    ],
)

cc_test(
    name = "tree_unwrapper_test",
    srcs = ["tree_unwrapper_test.cc"],
    deps = [
        ":tree_unwrapper",
        "//common/formatting:basic_format_style",
        "//common/formatting:format_token",
        "//common/formatting:token_partition_tree",
        "//common/formatting:unwrapped_line",
        "//common/text:text_structure",
        "//common/util:container_iterator_range",
        "//common/util:logging",
        "//common/util:spacer",
        "//common/util:status",
        "//common/util:vector_tree",
        "//verilog/analysis:verilog_analyzer",
        "@com_google_absl//absl/memory",
        "@com_google_absl//absl/strings",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "verilog_token",
    srcs = ["verilog_token.cc"],
    hdrs = ["verilog_token.h"],
    deps = [
        "//common/util:container_util",
        "//verilog/parser:verilog_token_enum",
        "@com_google_absl//absl/container:node_hash_map",
    ],
)

cc_test(
    name = "verilog_token_test",
    srcs = ["verilog_token_test.cc"],
    deps = [
        ":verilog_token",
        "//common/formatting:format_token",
        "//common/text:token_info",
        "//verilog/parser:verilog_token_enum",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "formatter",
    srcs = ["formatter.cc"],
    hdrs = [
        "formatter.h",
    ],
    deps = [
        ":comment_controls",
        ":format_style",
        ":token_annotator",
        ":tree_unwrapper",
        "//common/formatting:format_token",
        "//common/formatting:line_wrap_searcher",
        "//common/formatting:token_partition_tree",
        "//common/formatting:unwrapped_line",
        "//common/strings:range",
        "//common/text:line_column_map",
        "//common/text:text_structure",
        "//common/text:token_info",
        "//common/util:expandable_tree_view",
        "//common/util:iterator_range",
        "//common/util:logging",
        "//common/util:spacer",
        "//common/util:status",
        "//common/util:vector_tree",
    ],
)

cc_test(
    name = "formatter_test",
    srcs = ["formatter_test.cc"],
    deps = [
        ":format_style",
        ":formatter",
        "//common/formatting:format_token",
        "//common/formatting:unwrapped_line",
        "//common/formatting:unwrapped_line_test_utils",
        "//common/text:text_structure",
        "//common/util:logging",
        "//common/util:status",
        "//verilog/analysis:verilog_analyzer",
        "@com_google_absl//absl/strings",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "comment_controls",
    srcs = ["comment_controls.cc"],
    hdrs = ["comment_controls.h"],
    deps = [
        "//common/strings:comment_utils",
        "//common/text:token_stream_view",
        "//common/util:logging",
        "//verilog/parser:verilog_parser",
        "//verilog/parser:verilog_token_enum",
        "@com_google_absl//absl/strings",
    ],
)

cc_test(
    name = "comment_controls_test",
    srcs = ["comment_controls_test.cc"],
    deps = [
        ":comment_controls",
        "//verilog/analysis:verilog_analyzer",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "format_style",
    srcs = ["format_style.cc"],
    hdrs = ["format_style.h"],
    deps = [
        "//common/formatting:basic_format_style",
        "//common/util:enum_flags",
        "@com_google_absl//absl/strings",
    ],
)

cc_test(
    name = "format_style_test",
    srcs = ["format_style_test.cc"],
    deps = [
        ":format_style",
        "//common/util:enum_flags_test_util",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "token_annotator",
    srcs = ["token_annotator.cc"],
    hdrs = ["token_annotator.h"],
    deps = [
        ":format_style",
        ":verilog_token",
        "//common/formatting:format_token",
        "//common/formatting:tree_annotator",
        "//common/strings:range",
        "//common/text:symbol",
        "//common/text:syntax_tree_context",
        "//common/text:text_structure",
        "//common/text:token_info",
        "//common/util:iterator_range",
        "//common/util:logging",
        "//common/util:with_reason",
        "//verilog/CST:verilog_nonterminals",
        "//verilog/parser:verilog_parser",
        "//verilog/parser:verilog_token_enum",
        "@com_google_absl//absl/strings",
    ],
)

cc_test(
    name = "token_annotator_test",
    srcs = ["token_annotator_test.cc"],
    deps = [
        ":format_style",
        ":token_annotator",
        ":verilog_token",
        "//common/formatting:format_token",
        "//common/formatting:unwrapped_line",
        "//common/formatting:unwrapped_line_test_utils",
        "//common/text:syntax_tree_context",
        "//common/text:tree_builder_test_util",
        "//common/util:casts",
        "//common/util:iterator_adaptors",
        "//verilog/CST:verilog_nonterminals",
        "//verilog/parser:verilog_parser",
        "//verilog/parser:verilog_token_enum",
        "@com_google_absl//absl/strings",
        "@com_google_googletest//:gtest_main",
    ],
)
