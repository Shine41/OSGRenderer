CC = gcc
CFLAGS = -std=c++11 -fPIC -Wall
LDFLAGS = -shared # -Wl,--no-allow-shlib-undefined
DEBUG_FLAGS = -g -DEBUG
RELEASE_FLAGS = -O2 -D NDEBUG

ANACONDA_PATH = /Users/chrischoy/anaconda/
# ANACONDA_PATH = /home/chrischoy/anaconda/

# Run numpy.get_include() in python to get the following path
NUMPY_INCLUDE = $(ANACONDA_PATH)/lib/python2.7/site-packages/numpy/core/include

# PYCONFIG_PATH = /usr/local/python2.7/
PYCONFIG_PATH = $(ANACONDA_PATH)/include/python2.7

TARGET   = PyRenderer.so
SOURCES  = src/Renderer.cpp src/PyRenderer.cpp
INCLUDES = -I./include -I$(PYCONFIG_PATH) -I$(NUMPY_INCLUDE)
M_LIBRARY_PATH = -L/usr/local/lib

LIBS     = -framework OpenGL -lOpenThreads -losg -losgDB -losgGA -losgViewer -losgUtil -lstdc++ -lm -lboost_python -lpython2.7
# LIBS     = -lGL -lGLU -losg -losgDB -losgGA -losgViewer -losgUtil -lstdc++ -lm -lboost_python -lpython2.7

all: clean
	$(CC) $(CFLAGS) $(LDFLAGS) $(RELEASE_FLAGS) $(SOURCES) -o $(TARGET) $(INCLUDES) $(M_LIBRARY_PATH) $(LIBS)

debug:
	$(CC) $(CFLAGS) $(LDFLAGS) $(DEBUG_FLAGS) $(SOURCES) -o $(TARGET) $(INCLUDES) $(M_LIBRARY_PATH) $(LIBS)

clean:
	rm -f $(TARGET)
