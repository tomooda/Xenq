Class {
	#name : #XenqSVGCanvas,
	#superclass : #Canvas,
	#instVars : [
		'svg'
	],
	#category : #'Xenq-Core'
}

{ #category : #'instance creation' }
XenqSVGCanvas class >> on: aXenqSVG [
	^ self new
		svg: aXenqSVG;
		yourself
]

{ #category : #'drawing-support' }
XenqSVGCanvas >> clipBy: aRectangle during: aBlock [
	"Set a clipping rectangle active only during the execution of aBlock.
	Note: In the future we may want to have more general clip shapes - not just rectangles"
	^ self shouldNotImplement 
]

{ #category : #accessing }
XenqSVGCanvas >> clipRect [
	"Return the currently active clipping rectangle"

	^ self origin extent: self extent
]

{ #category : #accessing }
XenqSVGCanvas >> contentsOfArea: aRectangle into: aForm [
	"Return the contents of the given area"

	^ self shouldNotImplement
]

{ #category : #'drawing-polygons' }
XenqSVGCanvas >> drawPolygon: vertices color: aColor borderWidth: bw borderColor: bc [
	svg
		addPolygon_points: vertices
		fill: aColor
		stroke: bc
		strokeWidth: bw
		with: nil
]

{ #category : #'drawing-text' }
XenqSVGCanvas >> drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c [
	svg
		addText: (s copyFrom: firstIndex to: lastIndex)
		x: boundsRect left
		y: boundsRect top
		dx: nil
		dy: nil
		rotate: nil
		textLength: nil
		fill: c
		fontFamily: fontOrNil
		fontSize: fontOrNil
		with: [ :text | text at: 'alignment-baseline' put: 'top' ]
]

{ #category : #'drawing-text' }
XenqSVGCanvas >> drawString: s from: firstIndex to: lastIndex in: boundsRect font: fontOrNil color: c underline: underline underlineColor: uc strikethrough: strikethrough strikethroughColor: sc [
	svg
		addText: (s copyFrom: firstIndex to: lastIndex)
		x: boundsRect left
		y: boundsRect top
		dx: nil
		dy: nil
		rotate: nil
		textLength: nil
		fill: c
		fontFamily: fontOrNil
		fontSize: fontOrNil
		with: [ :text | text at: 'alignment-baseline' put: 'top' ]
]

{ #category : #accessing }
XenqSVGCanvas >> extent [
	^ (svg at: 'width') asNumber @ (svg at: 'height') asNumber
]

{ #category : #'drawing-ovals' }
XenqSVGCanvas >> fillOval: r color: c borderWidth: borderWidth borderColor: borderColor [
	svg
		addEllipse_cx: r center x
		cy: r center y
		rx: r width / 2.0
		ry: r height / 2.0
		fill: c
		stroke: borderColor
		strokeWidth: borderWidth
]

{ #category : #'drawing-rectangles' }
XenqSVGCanvas >> frameAndFillRectangle: r fillColor: fillColor borderWidth: borderWidth borderColor: borderColor [
	svg
		addRect_x: r left
		y: r top
		width: r width
		height: r height
		fill: fillColor
		stroke: borderColor
		strokeWidth: borderWidth
]

{ #category : #private }
XenqSVGCanvas >> image: aForm at: aPoint sourceRect: sourceRect rule: rule [
	"Note: The public use of this protocol is deprecated. It will become private. Nobody in the outside world must assume that a thing like a combination rule has any specific effect."

	^ self shouldNotImplement
]

{ #category : #drawing }
XenqSVGCanvas >> line: pt1 to: pt2 width: w color: c [
	"Draw a line using the given width and color"

	svg
		addLine_x1: pt1 x
		y1: pt1 y
		x2: pt2 x
		y2: pt2 y
		stroke: c
		strokeWidth: w
]

{ #category : #accessing }
XenqSVGCanvas >> origin [
	"Return the current origin for drawing operations"

	^ (svg at: 'x' ifAbsent: [ 0 ]) asNumber
		@ (svg at: 'y' ifAbsent: [ 0 ]) asNumber
]

{ #category : #drawing }
XenqSVGCanvas >> paragraph: paragraph bounds: bounds color: c [
	^ self shouldNotImplement
]

{ #category : #'drawing-images' }
XenqSVGCanvas >> stencil: stencilForm at: aPoint sourceRect: sourceRect color: aColor [
	"Flood this canvas with aColor wherever stencilForm has non-zero pixels"

	^ self shouldNotImplement
]

{ #category : #accessing }
XenqSVGCanvas >> svg [
	^ svg
]

{ #category : #accessing }
XenqSVGCanvas >> svg: aXenqSVG [
	svg := aXenqSVG
]

{ #category : #'drawing-support' }
XenqSVGCanvas >> transformBy: aDisplayTransform clippingTo: aClipRect during: aBlock smoothing: cellSize [
	"Transform the receiver by the given display transformation during the execution of aBlock. The given clip rectangle defines the *global* (e.g., outer) rectangle against which the receiver should clip (which would be equivalent to 'self clipRect: aClipRect; transformBy: aDisplayTransform')."

	^ self shouldNotImplement
]

{ #category : #'drawing-support' }
XenqSVGCanvas >> translateBy: delta during: aBlock [
	"Set a translation only during the execution of aBlock."

	^ self notYetImplemented
]

{ #category : #'drawing-images' }
XenqSVGCanvas >> warpImage: aForm transform: aTransform at: extraOffset sourceRect: sourceRect cellSize: cellSize [
	"Warp the given using the appropriate transform and offset."

	^ self shouldNotImplement
]
