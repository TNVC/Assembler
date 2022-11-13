#ifndef VIDEO_H_
#define VIDEO_H_

const int SCREEN_WIDTH  = 101;
const int SCREEN_HEIGHT = 30;

/// Enumiration for declarate videomode for this start the programm
enum class VideoMode {
  Console, /// <- Means that you want display graphics in console(alpha == char code)
  Window,  /// <- Means that you want display graphics in window (alpha == light of pixel)
};

/// Error`s codes which may be return from bellow functions
enum VideoErro {
  VIDEO_NOT_INIT       = 0x01 << 0, /// VideoScreen wasn`t init
  VIDEO_INCORRECT_MODE = 0x01 << 1, /// Incorrect MODE value
};

/// Struct with info about 24-bit color with alpha canal
struct Color {
  unsigned char red;   /// <- Red component of color
  unsigned char green; /// <- Green component of color
  unsigned char blue;  /// <- Blue component of color
  unsigned char alpha; /// <- Alpha component of color
};

/// Struct with info about coordinate of some object
struct Coord {
  unsigned x; /// <- x component of coordinate
  unsigned y; /// <- y component of coordinate
};

/// Build Color struct
/// @param [in] red Red component of color
/// @param [in] green Green component of color
/// @param [in] blue Blue component of color
/// @param [in] alpha Alpha component of color
/// @return Color struct
inline Color getColor(
                      unsigned char red,
                      unsigned char green,
                      unsigned char blue,
                      unsigned char alpha = 255
                      )
{
  return Color {
    .red   = red  ,
    .green = green,
    .blue  = blue ,
    .alpha = alpha
  };
}

/// Build Coord struct
/// @param [in] x x component of coord
/// @param [in] y y component of coord
/// @return Coord struct
inline Coord getCoord(unsigned x, unsigned y)
{
  return Coord {.x = x, .y = y};
}

/// Init video screen for work
/// @param [in] mode Wished VideoMode
/// @return Error`s code
int initVideoScreen(VideoMode mode);

/// Destroy video screen after using
/// @return Error`s code
int destroyVideoScreen();

/// Show current status of screen
/// @return Error`s code
int showScreen();

/// Clear current status of screen
/// @return Error`s code
int clearScreen();

/// Set pixel with coord to color
/// @param [in] coord Coord of needed pixel
/// @param [in] color New color of pixel
/// @return Error`s code
/// @note In VideoMode::Console coord is ignored
int setPixelColor(Coord coord, Color color);


#endif
