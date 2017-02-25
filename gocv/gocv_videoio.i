%{
#include "opencv2/videoio.hpp"
%}

%rename(ReadMat) cv::VideoCapture::operator>>(Mat& image);

namespace cv {

enum VideoCaptureProperties {
       CAP_PROP_POS_MSEC       =0, //!< Current position of the video file in milliseconds.
       CAP_PROP_POS_FRAMES     =1, //!< 0-based index of the frame to be decoded/captured next.
       CAP_PROP_POS_AVI_RATIO  =2, //!< Relative position of the video file: 0=start of the film, 1=end of the film.
       CAP_PROP_FRAME_WIDTH    =3, //!< Width of the frames in the video stream.
       CAP_PROP_FRAME_HEIGHT   =4, //!< Height of the frames in the video stream.
       CAP_PROP_FPS            =5, //!< Frame rate.
       CAP_PROP_FOURCC         =6, //!< 4-character code of codec. see VideoWriter::fourcc .
       CAP_PROP_FRAME_COUNT    =7, //!< Number of frames in the video file.
       CAP_PROP_FORMAT         =8, //!< Format of the %Mat objects returned by VideoCapture::retrieve().
       CAP_PROP_MODE           =9, //!< Backend-specific value indicating the current capture mode.
       CAP_PROP_BRIGHTNESS    =10, //!< Brightness of the image (only for cameras).
       CAP_PROP_CONTRAST      =11, //!< Contrast of the image (only for cameras).
       CAP_PROP_SATURATION    =12, //!< Saturation of the image (only for cameras).
       CAP_PROP_HUE           =13, //!< Hue of the image (only for cameras).
       CAP_PROP_GAIN          =14, //!< Gain of the image (only for cameras).
       CAP_PROP_EXPOSURE      =15, //!< Exposure (only for cameras).
       CAP_PROP_CONVERT_RGB   =16, //!< Boolean flags indicating whether images should be converted to RGB.
       CAP_PROP_WHITE_BALANCE_BLUE_U =17, //!< Currently unsupported.
       CAP_PROP_RECTIFICATION =18, //!< Rectification flag for stereo cameras (note: only supported by DC1394 v 2.x backend currently).
       CAP_PROP_MONOCHROME    =19,
       CAP_PROP_SHARPNESS     =20,
       CAP_PROP_AUTO_EXPOSURE =21, //!< DC1394: exposure control done by camera, user can adjust reference level using this feature.
       CAP_PROP_GAMMA         =22,
       CAP_PROP_TEMPERATURE   =23,
       CAP_PROP_TRIGGER       =24,
       CAP_PROP_TRIGGER_DELAY =25,
       CAP_PROP_WHITE_BALANCE_RED_V =26,
       CAP_PROP_ZOOM          =27,
       CAP_PROP_FOCUS         =28,
       CAP_PROP_GUID          =29,
       CAP_PROP_ISO_SPEED     =30,
       CAP_PROP_BACKLIGHT     =32,
       CAP_PROP_PAN           =33,
       CAP_PROP_TILT          =34,
       CAP_PROP_ROLL          =35,
       CAP_PROP_IRIS          =36,
       CAP_PROP_SETTINGS      =37, //! Pop up video/camera filter dialog (note: only supported by DSHOW backend currently. Property value is ignored)
       CAP_PROP_BUFFERSIZE    =38,
       CAP_PROP_AUTOFOCUS     =39
     };

class VideoCapture {
public:
  VideoCapture();

  VideoCapture(const cv::String& filename);

  virtual ~VideoCapture();

  virtual bool isOpened() const;

  virtual void release();

  virtual bool grab();

/*  virtual bool retrieve(cv::OutputArray image, int flag = 0);

  virtual bool read(cv::OutputArray image);*/

  virtual bool set(int propId, double value);
  
  virtual double get(int propId) const;

  virtual bool open(const cv::String& filename, int apiPreference);

  virtual VideoCapture& operator >> (Mat& image);
};

class VideoWriter {
public:
  VideoWriter();

  VideoWriter(const cv::String& filename, int fourcc, double fps, cv::Size frameSize, bool isColor = true);

  virtual bool open(const cv::String& filename, int fourcc, double fps, cv::Size frameSize, bool isColor = true);

  virtual bool isOpened() const;

  virtual void release();

  virtual void write(const cv::Mat& image);

  virtual bool set(int propId, double value);

  virtual double get(int propId) const;

  static int fourcc(char c1, char c2, char c3, char c4);
};

};
