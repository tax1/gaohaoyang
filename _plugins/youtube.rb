class YouTube < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
          @width = 560
          @height = 420
      else
          @width = $2.to_i
          @height = $3.to_i
      end
    else
      raise "No YouTube ID provided in the \"youtube\" tag"
    end
  end

  def render(context)
    " <div class=\"video-container mb3\"><iframe width=\"#{@width}\" height=\"#{@height}\" frameborder=\"0\" allowfullscreen src=\"https://www.youtube.com/embed/#{@id}?color=white&theme=light&rel=0&amp;showinfo=0\"></iframe></div>"
  end

  Liquid::Template.register_tag "youtube", self
end
