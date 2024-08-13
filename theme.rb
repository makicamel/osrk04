@default_foreground ||= @foreground
@default_background ||= @background
@default_shadow_color ||= @shadow_color

base_color             = '#333333'
accent_color           = '#5a9cbb'
@default_font          = 'Federo'
@font_family           = find_font_family(@default_font)
@bold_font             = @default_font
@bold_font_family      = find_font_family(@bold_font)
@monospace_font        = 'HackGen'
@monospace_font_family = find_font_family(@monospace_font)

@default_item1_mark_color = accent_color
@default_item2_mark_color = accent_color

@xxxx_large_font_size = screen_size(10 * Pango::SCALE)
@xxx_large_font_size  = screen_size(8 * Pango::SCALE)
@xx_large_font_size   = screen_size(6 * Pango::SCALE)
@x_large_font_size    = screen_size(4.5 * Pango::SCALE)
@large_font_size      = screen_size(4 * Pango::SCALE)
@normal_font_size     = screen_size(3.5 * Pango::SCALE)
@small_font_size      = screen_size(3.2  * Pango::SCALE)
@x_small_font_size    = screen_size(3 * Pango::SCALE)
@xx_small_font_size   = screen_size(2.8 * Pango::SCALE)
@xxx_small_font_size  = screen_size(2.5 * Pango::SCALE)
@script_font_size            = @x_small_font_size
@large_script_font_size      = @small_font_size
@x_large_script_font_size    = @large_font_size
@title_slide_title_font_size = @xxx_large_font_size

@block_quote_fill_color = "#f8f8f8"
@preformatted_fill_color = "#f8f8f8"
@default_headline_line_color = accent_color
@description_term_line_color = @default_headline_line_color
@default_headline_line_width = 1.2

@title_slide_background_image = 'image/title_background.png'
@slide_background_image = 'image/normal_background.png'

set_foreground(base_color)
# set_background(@default_background)

include_theme("default-icon")
include_theme("default-title-text")
include_theme("default-text")
include_theme("default-title-slide")
include_theme("default-slide")
include_theme("default-item-mark")
include_theme("default-method-list")
include_theme("default-preformatted")
include_theme("default-block-quote")
include_theme("default-foot-text")
include_theme("default-description")
include_theme("image")
include_theme("table")
include_theme("newline-in-slides")
include_theme("per-slide-background-color")
include_theme("background-image-toolkit")
include_theme("per-slide-background-image")
include_theme("body-background-image")
include_theme("tag")
include_theme("syntax-highlighting")
include_theme("default-comment")

include_theme("title-slide-background-image")
include_theme("slide-background-image")

@lightning_talk_proc_name = "lightning-rabbit"
@lightning_talk_as_large_as_possible = true
@lightning_talk_color = base_color
@lightning_talk_font_family = 'Noto Sans JP'
include_theme("lightning-talk-toolkit")

match(TitleSlide) do |slides|
  slides.vertical_centering = true
  slides.prop_set("weight", "Bold")
end
match(TitleSlide, Title) do |titles|
  titles.margin_left = -360
  titles.padding_top = @space * 6
  titles.prop_set("font-family", @bold_font)
  titles.prop_set("size", @xxx_large_font_size)
  titles.prop_set("weight", "bold")
end
match(TitleSlide, Author) do |author|
  author.margin_top = 80
  author.margin_bottom = 0
  author.vertical_centering = true
  author.prop_set("weight", "normal")
end
match(TitleSlide, Place) do |place|
  place.margin_top = 4
  place.prop_set("weight", "normal")
  place.prop_set("size", @small_font_size)
end
match(TitleSlide, Date) do |date|
  date.margin_top = 4
  date.prop_set("weight", "normal")
end
match(TitleSlide, ContentSource) do |cs|
  cs.margin_top = 4
  cs.prop_set("weight", "normal")
end
match(TitleSlide, "*") do |elems|
  elems.prop_set("style", "normal")
end

match(Slide, HeadLine) do |heads|
  heads.margin_top = 4
  heads.margin_bottom = 40
  heads.prop_set("size", @x_large_font_size)
  heads.prop_set("weight", "SemiBold")
end

match(Slide) do |slides|
  slides.each do |slide|
    if slide.lightning_talk?
      slide.lightning_talk
    end
  end
end

pp "reloaded!"
