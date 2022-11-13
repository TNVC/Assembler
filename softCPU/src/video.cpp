#include "video.h"

#include "errorhandler.h"

#include <stdio.h>
#include <pthread.h>
#include <SFML/Window.hpp>
#include <SFML/Graphics.hpp>


#include <stdlib.h>

#pragma GCC diagnostic ignored "-Wunused-parameter"

#define CHECK                                   \
  do                                            \
    {                                           \
      if (!WasInit)                             \
        return VIDEO_NOT_INIT;                  \
    } while (0)

#define CASE(name,funct, ...)                                 \
  case VideoMode::name:                                       \
  {                                                           \
    int error = funct##name(__VA_ARGS__);                     \
                                                              \
    if (error)                                                \
      return error;                                           \
                                                              \
    break;                                                    \
  }

#define SWITCH_FUNCTION(funct, ...)                                     \
  do                                                                    \
    {                                                                   \
      switch (MODE)                                                     \
        {                                                               \
          CASE(Console, funct __VA_OPT__(,) __VA_ARGS__);               \
          CASE(Window , funct __VA_OPT__(,) __VA_ARGS__);               \
        default:                                                        \
          {                                                             \
            handleError("Incorrect MODE value in line [%d]", __LINE__); \
                                                                        \
            return VIDEO_INCORRECT_MODE;                                \
          }                                                             \
        }                                                               \
    } while (0)

static int WasInit = 0;

static VideoMode MODE = VideoMode::Console;

static sf::RenderWindow window;

static void *runScreen(void *ptr);

static int initVideoScreenConsole();
static int initVideoScreenWindow ();

static int destroyVideoScreenConsole();
static int destroyVideoScreenWindow ();

static int showScreenConsole();
static int showScreenWindow ();

static int clearScreenConsole();
static int clearScreenWindow ();

static int setPixelColorConsole(Coord coord, Color color);
static int setPixelColorWindow (Coord coord, Color color);

int initVideoScreen(VideoMode mode)
{
  MODE = mode;

  WasInit = true;

  SWITCH_FUNCTION(initVideoScreen);

  return 0;
}

int destroyVideoScreen()
{
  CHECK;

  SWITCH_FUNCTION(destroyVideoScreen);

  WasInit = false;

  return 0;
}

int showScreen()
{
  CHECK;

  SWITCH_FUNCTION(showScreen);

  return 0;
}

int clearScreen()
{
  CHECK;

  SWITCH_FUNCTION(clearScreen);

  return 0;
}

int setPixelColor(Coord coord, Color color)
{
  CHECK;

  SWITCH_FUNCTION(setPixelColor, coord, color);

  return 0;
}

static int initVideoScreenConsole() { return 0; }

static int initVideoScreenWindow ()
{
  window.create(sf::VideoMode(SCREEN_WIDTH, SCREEN_HEIGHT), "");

  pthread_t thread = {};

  pthread_create(&thread, nullptr, runScreen, nullptr);

  return 0;
}

static int destroyVideoScreenConsole() { return 0; }

static int destroyVideoScreenWindow ()
{
  window.close();

  return 0;
}

static int showScreenConsole() { return 0; }

static int showScreenWindow ()
{
  window.display();

  return 0;
}

static int clearScreenConsole()
{
  printf("\033[0;0H");

  static int i = 0;

  if (!(i++ % 1000))
    printf("\033c");

  return 0;
}

static int clearScreenWindow ()
{
  //window.clear(sf::Color::Black);

  return 0;
}

static int setPixelColorConsole(Coord coord, Color color)
{
  printf(
         "\033[38;2;%d;%d;%d;m%c\033[0m",
         255 - color.red,
         255 - color.green,
         255 - color.blue,
         color.alpha
         );

  return 0;
}

static int setPixelColorWindow (Coord coord, Color color)
{
  static sf::RectangleShape rect(sf::Vector2f(1.f, 1.f));

  unsigned char cl = color.alpha != ' ' ? 255u : 0u;

  rect.setFillColor(sf::Color(cl, cl, cl, 255 - color.alpha));

  rect.setPosition(sf::Vector2f((float)coord.x, (float)coord.y));

  window.draw(rect);

  return 0;
}

static void *runScreen(void *ptr)
{
  while (window.isOpen())
    {
      sf::Event event;

      while (window.pollEvent(event))
        {
          if (event.type == sf::Event::Closed)
            {
              window.close();

              return nullptr;
            }
        }
    }

  return nullptr;
}
