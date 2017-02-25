// Copyright 2011 <chaishushan@gmail.com>. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"fmt"
	//	"os"
	//	"path"
	//	"runtime"

	"github.com/lazywei/go-opencv/gocv"
	//"../gocv" // can be used in forks, comment in real application
)

func main() {
	capture := gocv.NewVideoCapture(gocv.NewString("/Users/matt/Downloads/sample.mp4"))

	fmt.Printf("%t\n", capture.IsOpened())

	size := gocv.NewGcvSize2f64(capture.Get(int(gocv.CAP_PROP_FRAME_WIDTH)), capture.Get(int(gocv.CAP_PROP_FRAME_HEIGHT)))

	writer := gocv.NewVideoWriter(
		gocv.NewString("/Users/matt/Downloads/sample-out-test.jpg"),
		gocv.VideoWriterFourcc("M"[0], "J"[0], "P"[0], "G"[0]),
		capture.Get(int(gocv.CAP_PROP_FPS)),
		size,
		true)

	frame := gocv.NewGcvMat()
	for {
		capture.ReadMat(frame)

		if frame.Empty() {
			fmt.Printf("Empty frame.\n")
			break
		}

		fmt.Printf("read frame\n")

		if writer.IsOpened() {
			writer.Write(frame)
			fmt.Printf("write frame\n")
		}
	}

	writer.Release()
	capture.Release()
}
