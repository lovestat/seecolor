---
title: "Introduction to seecolor"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Intro}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---




<STYLE type='text/css' scoped>
PRE.fansi SPAN {padding-top: .25em; padding-bottom: .25em};
</STYLE>

## Use the cursor to select object to print in the console.


```r
# Highlight objects by cursor to show the contained colors
pick_color()

# Change output styles, "ribbon" or "mosaic"
pick_color(type = "r")

# Change the length of the color blocks
pick_color(blank.len = 1)
```



## Use `print_color` to print color literals, palettes and ggplot2 objects.


```r
print_color(c("red", "navy", "tomato", "#521354", "sienna"))
```

<PRE class="fansi fansi-output"><CODE>#&gt; 
#&gt;  ------ c red navy tomato #521354 sienna ------
#&gt; <span style='color: #BBBB00;background-color: #BB0000;'>   </span><span style='color: #BBBB00;background-color: #0000BB;'>   </span><span style='color: #BBBB00;background-color: #BB0000;'>   </span><span style='color: #BBBB00;background-color: #000000;'>   </span><span style='color: #BBBB00;background-color: #BB0000;'>   </span><span>
</span></CODE></PRE>

```r
print_color(palette())
```

<PRE class="fansi fansi-output"><CODE>#&gt; 
#&gt;  ------ palette ------
#&gt; <span style='color: #BBBB00;background-color: #000000;'>   </span><span style='color: #BBBB00;background-color: #BB0000;'>   </span><span style='color: #BBBB00;background-color: #00BB00;'>   </span><span style='color: #BBBB00;background-color: #00BBBB;'>      </span><span style='color: #BBBB00;background-color: #BB00BB;'>   </span><span style='color: #BBBB00;background-color: #BBBB00;'>   </span><span style='color: #BBBB00;background-color: #BBBBBB;'>   </span><span>
</span></CODE></PRE>

```r
print_color(colors()[seq(1, 100, 5)], blank.len = 4)
```

<PRE class="fansi fansi-output"><CODE>#&gt; 
#&gt;  ------ [ colors() seq(1, 100, 5) ------
#&gt; <span style='color: #BBBB00;background-color: #BBBBBB;'>        </span><span style='color: #BBBB00;background-color: #00BBBB;'>    </span><span style='color: #BBBB00;background-color: #BBBBBB;'>        </span><span style='color: #BBBB00;background-color: #0000BB;'>    </span><span style='color: #BBBB00;background-color: #BB00BB;'>    </span><span style='color: #BBBB00;background-color: #BB0000;'>        </span><span style='color: #BBBB00;background-color: #00BBBB;'>    </span><span style='color: #BBBB00;background-color: #00BB00;'>    </span><span style='color: #BBBB00;background-color: #BB0000;'>        </span><span style='color: #BBBB00;background-color: #BBBBBB;'>    </span><span style='color: #BBBB00;background-color: #00BBBB;'>    </span><span style='color: #BBBB00;background-color: #BBBB00;'>    </span><span style='color: #BBBB00;background-color: #000000;'>    </span><span style='color: #BBBB00;background-color: #BBBB00;'>    </span><span style='color: #BBBB00;background-color: #BB0000;'>    </span><span style='color: #BBBB00;background-color: #BB00BB;'>    </span><span>
</span></CODE></PRE>

```r
print_color(palette(rainbow(6)))
```

<PRE class="fansi fansi-output"><CODE>#&gt; 
#&gt;  ------ palette rainbow(6) ------
#&gt; <span style='color: #BBBB00;background-color: #000000;'>   </span><span style='color: #BBBB00;background-color: #BB0000;'>   </span><span style='color: #BBBB00;background-color: #00BB00;'>   </span><span style='color: #BBBB00;background-color: #00BBBB;'>      </span><span style='color: #BBBB00;background-color: #BB00BB;'>   </span><span style='color: #BBBB00;background-color: #BBBB00;'>   </span><span style='color: #BBBB00;background-color: #BBBBBB;'>   </span><span>
</span></CODE></PRE>

```r
p1 <- ggplot(mpg) +
  geom_point(aes(displ, cyl, color = manufacturer))
print_color(p1)
```

<PRE class="fansi fansi-output"><CODE>#&gt; 
#&gt;  ---ggplot object--- 
#&gt; <span style='color: #BBBB00;background-color: #BB0000;'>   </span><span style='color: #BBBB00;background-color: #BBBB00;'>         </span><span style='color: #BBBB00;background-color: #00BB00;'>         </span><span style='color: #BBBB00;background-color: #00BBBB;'>            </span><span style='color: #BBBB00;background-color: #BBBBBB;'>   </span><span style='color: #BBBB00;background-color: #BB00BB;'>         </span><span>
</span></CODE></PRE>

```r
p2 <- ggplot(iris) +
  geom_point(aes(Sepal.Length, Petal.Length, color = Petal.Width))
print_color(p2)
```

<PRE class="fansi fansi-output"><CODE>#&gt; 
#&gt;  ---ggplot object--- 
#&gt; <span style='color: #BBBB00;background-color: #000000;'>                  </span><span style='color: #BBBB00;background-color: #0000BB;'>                  </span><span style='color: #BBBB00;background-color: #00BBBB;'>   </span><span style='color: #BBBB00;background-color: #0000BB;'>   </span><span style='color: #BBBB00;background-color: #00BBBB;'>                        </span><span>
</span></CODE></PRE>


## Use `open_sample()` to open a sample file to have a instant try.


```r
# Open the pre-defined test file
open_sample()
```

