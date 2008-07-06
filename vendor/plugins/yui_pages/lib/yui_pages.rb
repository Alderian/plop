module YUIPages
  silence_warnings do
    PAGE_750    = "doc"
    PAGE_950    = "doc2"
    PAGE_974    = "doc4"
    PAGE_FLUID  = "doc3"

    LEFT_160    = "yui-t1"
    LEFT_180    = "yui-t2"
    LEFT_300    = "yui-t3"
    RIGHT_180   = "yui-t4"
    RIGHT_240   = "yui-t5"
    RIGHT_300   = "yui-t6"

    GRID_50_50    = "yui-g"
    GRID_33_33_33 = "yui-gb"
    GRID_67_33    = "yui-gc"
    GRID_33_67    = "yui-gd"
    GRID_75_25    = "yui-ge"
    GRID_25_75    = "yui-gf"
  end

  # Inserts stylesheet link tags to the compressed YUI Resets and YUI Grids CSS
  # files on Yahoo's servers.
  def yui_grids_stylesheet_link_tags
    stylesheet_link_tag(
      "stylesheets/yui/reset-min.css",
      "stylesheets/yui/grids-min.css"
    )
  end
  
  # Inserts a div tag to wrap an entire YUI Grids-based page. Specify a page
  # width constant in <tt>options[:width]</tt> (defaults to 950px) and a
  # secondary content block arrangement constant in <tt>options[:secondary]</tt>
  # (defaults to none).
  #
  # Valid values for <tt>options[:width]</tt> are PAGE_750, PAGE_950, PAGE_974
  # and PAGE_FLUID.
  #
  # Valid values for <tt>options[:secondary]</tt> are LEFT_160, LEFT_180,
  # LEFT_300, RIGHT_180, RIGHT_240 and RIGHT_300.
  def yui_page(options = {}, &block)
    options = { :width => PAGE_950, :secondary => nil }.merge(options)
    concat(content_tag(:div, capture(&block), :id => options[:width], :class => "#{options[:secondary]} outer"), block.binding)
  end

  # Wrap a block in a div marked at header.
  def header(&block)
    concat(content_tag(:div, capture(&block), :id => "hd"), block.binding)
  end

  # Wrap a block in a div marked as the page body content.
  def body(&block)
    concat(content_tag(:div, capture(&block), :id => "bd"), block.binding)
  end

  # Wrap a block in a div marked at footer.
  def footer(&block)
    concat(content_tag(:div, capture(&block), :id => "ft"), block.binding)
  end

  # Used inside the <tt>body</tt> block. Wrap a block in a div marked as the main
  # page content (as opposed to the secondary/sidebar page content).
  def main(&block)
    concat(content_tag(:div, content_tag(:div, capture(&block), :class => "yui-b"), :id => "yui-main"), block.binding)
  end

  # Used inside the <tt>body</tt> block. Wrap a block in a div marked as the
  # secondary/sidebar page content
  def secondary(&block)
    concat(content_tag(:div, capture(&block), :class => "yui-b"), block.binding)
  end

  # Create a YUI grid. The optional <tt>options[:columns]</tt> value specifies
  # the number of columns and their widths (defaults to two columns split 50/50).
  #
  # Valid values for <tt>options[:columns]</tt> are GRID_50_50, GRID_33_33_33,
  # GRID_67_33, GRID_33_67, GRID_75_25 and GRID_25_75.
  def grid(options = {}, &block)
    options = { :columns => GRID_50_50 }.merge(options)

    class_first = @in_grid && @grid_first
    @grid_first = true

    with_in_grid(true) do
      results = capture(&block)
    end

    @grid_first = !class_first

    concat(content_tag(:div, results, :class => class_first ? "#{options[:columns]} first" : options[:columns]), block.binding)
  end
  
  # Specifies a unit (a.k.a. column) inside a grid. If this unit itself is
  # subdivided into another grid, use the <tt>grid</tt> helper directly instead.
  def unit(&block)
    with_in_grid(false) do
      results = capture(&block)
    end

    concat(content_tag(:div, results, :class => @grid_first ? "yui-u first" : "yui-u"), block.binding)
    @grid_first = false
  end
  
protected

  def with_in_grid(value) # :nodoc:
    existing_in_grid = @in_grid
    @in_grid = value
    yield
    @in_grid = existing_in_grid
  end
end