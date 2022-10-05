#ifndef COLOROUTPUT_H_
#define COLOROUTPUT_H_

enum Colors {
  CONSOLECOLOR_BLACK         ,
  CONSOLECOLOR_RED           ,
  CONSOLECOLOR_GREEN         ,
  CONSOLECOLOR_YELLOW        ,
  CONSOLECOLOR_BLUE          ,
  CONSOLECOLOR_MAGENTA       ,
  CONSOLECOLOR_CYAN          ,
  CONSOLECOLOR_WHITE         ,
  CONSOLECOLOR_BRIGHT_BLACK  ,
  CONSOLECOLOR_BRIGHT_RED    ,
  CONSOLECOLOR_BRIGHT_GREEN  ,
  CONSOLECOLOR_BRIGHT_YELLOW ,
  CONSOLECOLOR_BRIGHT_BLUE   ,
  CONSOLECOLOR_BRIGHT_MAGENTA,
  CONSOLECOLOR_BRIGHT_CYAN   ,
  CONSOLECOLOR_BRIGHT_WHITE  ,
};

enum FontStyle {
  CONSOLECOLOR_NORMAL          , // Reset style and color
  CONSOLECOLOR_BOLD            ,
  CONSOLECOLOR_FAINT           ,
  CONSOLECOLOR_ITALIC          ,
  CONSOLECOLOR_UNDERLINE       ,
  CONSOLECOLOR_BLINK           ,
  CONSOLECOLOR_INVERT_COLORS   ,
  CONSOLECOLOR_DOUBLY_UNDERLINE,
};

const int COLORS_COUNT = 15;
const int STYLES_COUNT =  8;

/// Set foreground color
/// @param [in] color Code of color
void setForegroundColor(int color);

/// Set background color
/// @param [in] color Code of color
void setBackgroundColor(int color);

/// Set font style
/// @param [in] style Code of style
void setFontStyle(int style);

/// Set consol output to default
void resetConsole();

#endif
