Class {
	#name : #XenqSVG,
	#superclass : #XenqXML,
	#category : #'Xenq-Core'
}

{ #category : #'instance creation' }
XenqSVG class >> extent: aPoint [
	^ self
		x: 0
		y: 0
		width: aPoint x
		height: aPoint y
		with: nil
]

{ #category : #'instance creation' }
XenqSVG class >> with: aBlock [
	^ (self name: 'svg')
		at: 'version' put: '1.1';
		at: 'xmlns' put: 'http://www.w3.org/2000/svg';
		with: aBlock;
		yourself
]

{ #category : #'instance creation' }
XenqSVG class >> x: x y: y width: width height: height with: aBlock [
	^ (self name: 'svg')
		with: [ :svg | 
			x ifNotNil: [ svg at: 'x' put: (svg coordinate: x) ].
			y ifNotNil: [ svg at: 'y' put: (svg coordinate: y) ].
			width ifNotNil: [ svg at: 'width' put: (svg length: width) ].
			height ifNotNil: [ svg at: 'height' put: (svg length: height) ].
			svg
				at: 'version' put: '1.1';
				at: 'xmlns' put: 'http://www.w3.org/2000/svg';
				with: aBlock ];
		yourself
]

{ #category : #'instance creation' }
XenqSVG >> addCircle_cx: cx cy: cy r: r fill: fill stroke: stroke strokeWidth: strokeWidth [
	^ self
		addCircle_cx: cx
		cy: cy
		r: r
		fill: fill
		stroke: stroke
		strokeWidth: strokeWidth
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addCircle_cx: cx cy: cy r: r fill: fill stroke: stroke strokeWidth: strokeWidth with: aBlock [
	^ self
		addElement: 'circle'
		with: [ :circle | 
			cx ifNotNil: [ circle at: 'cx' put: (circle coordinate: cx) ].
			cy ifNotNil: [ circle at: 'cy' put: (circle coordinate: cy) ].
			r ifNotNil: [ circle at: 'r' put: (circle length: r) ].
			fill ifNotNil: [ circle at: 'fill' put: (circle color: fill) ].
			stroke
				ifNotNil: [ circle at: 'stroke' put: (circle color: stroke) ].
			strokeWidth
				ifNotNil: [ circle at: 'stroke-width' put: (circle length: strokeWidth) ].
			circle with: aBlock ]
]

{ #category : #'instance creation' }
XenqSVG >> addCircle_cx: cx cy: cy r: r with: aBlock [
	^ self
		addCircle_cx: cx
		cy: cy
		r: r
		fill: nil
		stroke: nil
		strokeWidth: nil
		with: aBlock
]

{ #category : #'instance creation' }
XenqSVG >> addEllipse_cx: cx cy: cy rx: rx ry: ry fill: fill stroke: stroke strokeWidth: strokeWidth [
	^ self
		addEllipse_cx: cx
		cy: cy
		rx: rx
		ry: ry
		fill: fill
		stroke: stroke
		strokeWidth: strokeWidth
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addEllipse_cx: cx cy: cy rx: rx ry: ry fill: fill stroke: stroke strokeWidth: strokeWidth with: aBlock [
	^ self
		addElement: 'ellipse'
		with: [ :ellipse | 
			cx ifNotNil: [ ellipse at: 'cx' put: (ellipse coordinate: cx) ].
			cy ifNotNil: [ ellipse at: 'cy' put: (ellipse coordinate: cy) ].
			rx ifNotNil: [ ellipse at: 'rx' put: (ellipse length: rx) ].
			ry ifNotNil: [ ellipse at: 'ry' put: (ellipse length: ry) ].
			fill ifNotNil: [ ellipse at: 'fill' put: (ellipse color: fill) ].
			stroke
				ifNotNil: [ ellipse at: 'stroke' put: (ellipse color: stroke) ].
			strokeWidth
				ifNotNil: [ ellipse at: 'stroke-width' put: (ellipse length: strokeWidth) ].
			ellipse with: aBlock ]
]

{ #category : #'instance creation' }
XenqSVG >> addEllipse_cx: cx cy: cy rx: rx ry: ry with: aBlock [
	^ self
		addEllipse_cx: cx
		cy: cy
		rx: rx
		ry: ry
		fill: nil
		stroke: nil
		strokeWidth: nil
		with: aBlock
]

{ #category : #'instance creation' }
XenqSVG >> addG: aBlock [
	^ children add: (self class g: aBlock)
]

{ #category : #'instance creation' }
XenqSVG >> addG_fill: fill stroke: stroke strokeWidth: strokeWidth with: aBlock [
	^ self
		addElement: 'g'
		with: [ :g | 
			fill ifNotNil: [ g at: 'fill' put: (self color: fill) ].
			stroke ifNotNil: [ g at: 'stroke' put: (self color: stroke) ].
			strokeWidth
				ifNotNil: [ g at: 'stroke-width' put: (self length: strokeWidth) ].
			aBlock ifNotNil: [ aBlock value: g ] ]
]

{ #category : #'instance creation' }
XenqSVG >> addLine_x1: x1 y1: y1 x2: x2 y2: y2 stroke: stroke strokeWidth: strokeWidth [
	^ self
		addLine_x1: x1
		y1: y1
		x2: x2
		y2: y2
		stroke: stroke
		strokeWidth: strokeWidth
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addLine_x1: x1 y1: y1 x2: x2 y2: y2 stroke: stroke strokeWidth: strokeWidth with: aBlock [
	^ self
		addElement: 'line'
		with: [ :line | 
			x1 ifNotNil: [ line at: 'x1' put: (line coordinate: x1) ].
			y1 ifNotNil: [ line at: 'y1' put: (line coordinate: y1) ].
			x2 ifNotNil: [ line at: 'x2' put: (line coordinate: x2) ].
			y2 ifNotNil: [ line at: 'y2' put: (line coordinate: y2) ].
			stroke ifNotNil: [ line at: 'stroke' put: (line color: stroke) ].
			strokeWidth
				ifNotNil: [ line at: 'stroke-width' put: (line length: strokeWidth) ].
			line with: aBlock ]
]

{ #category : #'instance creation' }
XenqSVG >> addLine_x1: x1 y1: y1 x2: x2 y2: y2 with: aBlock [
	^ self
		addLine_x1: x1
		y1: y1
		x2: x2
		y2: y2
		stroke: nil
		strokeWidth: nil
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addPolygon_points: points fill: fill stroke: stroke strokeWidth: strokeWidth [
	^ self
		addPolygon_points: points
		fill: fill
		stroke: stroke
		strokeWidth: strokeWidth
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addPolygon_points: points fill: fill stroke: stroke strokeWidth: strokeWidth with: aBlock [
	^ self
		addElement: 'polygon'
		with: [ :polygon | 
			points
				ifNotNil: [ polygon at: 'points' put: (polygon listOfPoints: points) ].
			fill ifNotNil: [ polygon at: 'fill' put: (polygon color: nil) ].
			stroke ifNotNil: [ polygon at: 'stroke' put: (polygon color: stroke) ].
			strokeWidth
				ifNotNil: [ polygon at: 'stroke-width' put: (polygon length: strokeWidth) ].
			polygon with: aBlock ]
]

{ #category : #'instance creation' }
XenqSVG >> addPolygon_points: points with: aBlock [
	^ self
		addPolygon_points: points
		fill: nil
		stroke: nil
		strokeWidth: nil
		with: aBlock
]

{ #category : #'instance creation' }
XenqSVG >> addPolyline_points: points fill: fill stroke: stroke strokeWidth: strokeWidth with: aBlock [
	^ self
		addElement: 'polyline'
		with: [ :polyline | 
			points
				ifNotNil: [ polyline at: 'points' put: (polyline listOfPoints: points) ].
			fill ifNotNil: [ polyline at: 'fill' put: (polyline color: nil) ].
			stroke
				ifNotNil: [ polyline at: 'stroke' put: (polyline color: stroke) ].
			strokeWidth
				ifNotNil: [ polyline at: 'stroke-width' put: (polyline length: strokeWidth) ].
			polyline with: aBlock ]
]

{ #category : #'instance creation' }
XenqSVG >> addPolyline_points: points stroke: stroke strokeWidth: strokeWidth [
	^ self
		addPolyline_points: points
		fill: 'none'
		stroke: stroke
		strokeWidth: strokeWidth
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addPolyline_points: points with: aBlock [
	^ self
		addPolyline_points: points
		fill: nil
		stroke: nil
		strokeWidth: nil
		with: aBlock
]

{ #category : #'instance creation' }
XenqSVG >> addRect_x: x y: y width: width height: height fill: fill stroke: stroke strokeWidth: strokeWidth [
	^ self
		addRect_x: x
		y: y
		width: width
		height: height
		rx: nil
		ry: nil
		fill: fill
		stroke: stroke
		strokeWidth: strokeWidth
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addRect_x: x y: y width: width height: height rx: rx ry: ry fill: fill stroke: stroke strokeWidth: strokeWidth [
	^ self
		addRect_x: x
		y: y
		width: width
		height: height
		rx: rx
		ry: ry
		fill: fill
		stroke: stroke
		strokeWidth: strokeWidth
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addRect_x: x y: y width: width height: height rx: rx ry: ry fill: fill stroke: stroke strokeWidth: strokeWidth with: aBlock [
	^ self
		addElement: 'rect'
		with: [ :rect | 
			x ifNotNil: [ rect at: 'x' put: (rect coordinate: x) ].
			y ifNotNil: [ rect at: 'y' put: (rect coordinate: y) ].
			width ifNotNil: [ rect at: 'width' put: (rect length: width) ].
			height ifNotNil: [ rect at: 'height' put: (rect length: height) ].
			rx ifNotNil: [ rect at: 'rx' put: (rect length: rx) ].
			ry ifNotNil: [ rect at: 'ry' put: (rect length: ry) ].
			fill ifNotNil: [ rect at: 'fill' put: (rect color: fill) ].
			stroke ifNotNil: [ rect at: 'stroke' put: (rect color: stroke) ].
			strokeWidth
				ifNotNil: [ rect at: 'stroke-width' put: (rect length: strokeWidth) ].
			rect with: aBlock ]
]

{ #category : #'instance creation' }
XenqSVG >> addRect_x: x y: y width: width height: height rx: rx ry: ry with: aBlock [
	^ self
		addRect_x: x
		y: y
		width: width
		height: height
		rx: rx
		ry: ry
		fill: nil
		stroke: nil
		strokeWidth: nil
		with: aBlock
]

{ #category : #'instance creation' }
XenqSVG >> addRect_x: x y: y width: width height: height with: aBlock [
	^ self
		addRect_x: x
		y: y
		width: width
		height: height
		rx: nil
		ry: nil
		fill: nil
		stroke: nil
		strokeWidth: nil
		with: aBlock
]

{ #category : #'instance creation' }
XenqSVG >> addText: aString x: x y: y dx: dx dy: dy rotate: rotate textLength: textLength fill: fill fontFamily: fontFamily fontSize: fontSize with: aBlock [
	^ self
		addElement: 'text'
		with: [ :text | 
			x ifNotNil: [ text at: 'x' put: (text listOfCoordinates: x) ].
			y ifNotNil: [ text at: 'y' put: (text listOfCoordinates: y) ].
			dx ifNotNil: [ text at: 'dx' put: (text listOfLengths: dx) ].
			dy ifNotNil: [ text at: 'dy' put: (text listOfLengths: dy) ].
			rotate
				ifNotNil: [ text at: 'rotate' put: (text listOfNumbers: rotate) ].
			textLength
				ifNotNil: [ text at: 'textLength' put: (text length: textLength) ].
			fill ifNotNil: [ text at: 'fill' put: (text color: fill) ].
			fontFamily
				ifNotNil: [ text at: 'fontFamily' put: (text fontFamily: fontFamily) ].
			fontSize
				ifNotNil: [ text at: 'fontSize' put: (text fontSize: fontSize) ].
			aString ifNotNil: [ text append: aString ].
			text with: aBlock ]
]

{ #category : #'instance creation' }
XenqSVG >> addText: aString x: x y: y fill: fill fontFamily: fontFamily fontSize: fontSize [
	^ self
		addText: aString
		x: x
		y: y
		dx: nil
		dy: nil
		rotate: nil
		textLength: nil
		fill: fill
		fontFamily: fontFamily
		fontSize: fontSize
		with: nil
]

{ #category : #'instance creation' }
XenqSVG >> addText: aString x: x y: y fontFamily: fontFamily fontSize: fontSize with: aBlock [
	^ self
		addText: aString
		x: x
		y: y
		dx: nil
		dy: nil
		rotate: nil
		textLength: nil
		fill: nil
		fontFamily: fontFamily
		fontSize: fontSize
		with: aBlock
]

{ #category : #'instance creation' }
XenqSVG >> addText: aString x: x y: y with: aBlock [
	^ self
		addText: aString
		x: x
		y: y
		dx: nil
		dy: nil
		rotate: nil
		textLength: nil
		fill: nil
		fontFamily: nil
		fontSize: nil
		with: aBlock
]

{ #category : #'attribute formatting' }
XenqSVG >> color: aStringOrColor [
	^ aStringOrColor
		ifNil: [ 'none' ]
		ifNotNil: [ aStringOrColor isColor
				ifTrue: [ aStringOrColor isTransparent
						ifTrue: [ 'none' ]
						ifFalse: [ '#' , aStringOrColor asHexString ] ]
				ifFalse: [ aStringOrColor asString ] ]
]

{ #category : #'attribute formatting' }
XenqSVG >> coordinate: aStringOrNumber [
	^ aStringOrNumber ifNil: [ '0' ] ifNotNil: #asString
]

{ #category : #'attribute formatting' }
XenqSVG >> fontFamily: aStringOrFont [
	^ [ aStringOrFont familyName ]
		on: Error
		do: [ :ex | aStringOrFont asString ]
]

{ #category : #'attribute formatting' }
XenqSVG >> fontSize: aStringOrNumber [
	^ [ aStringOrNumber pointSize asString ]
		on: Error
		do: [ :ex | aStringOrNumber asString ]
]

{ #category : #accessing }
XenqSVG >> getCanvas [
	^ XenqSVGCanvas on: self
]

{ #category : #'attribute formatting' }
XenqSVG >> length: aStringOrNumber [
	^ self coordinate: aStringOrNumber
]

{ #category : #'attribute formatting' }
XenqSVG >> listOfCoordinates: aStringOrArray [
	aStringOrArray ifNil: [ ^ '' ].
	aStringOrArray isString
		ifTrue: [ ^ aStringOrArray ].
	aStringOrArray isCollection
		ifTrue: [ ^ String
				streamContents: [ :stream | 
					aStringOrArray
						do:
							[ :pointOrString | stream nextPutAll: pointOrString asString ]
						separatedBy: [ stream nextPut: $, ] ] ].
	^ aStringOrArray asString
]

{ #category : #'attribute formatting' }
XenqSVG >> listOfLengths: aStringOrArray [
	^ self listOfCoordinates: aStringOrArray
]

{ #category : #'attribute formatting' }
XenqSVG >> listOfNumbers: aStringOrArray [
	^ self listOfCoordinates: aStringOrArray
]

{ #category : #'attribute formatting' }
XenqSVG >> listOfPoints: aStringOrArrayOfPoint [
	aStringOrArrayOfPoint ifNil: [ ^ '' ].
	aStringOrArrayOfPoint isString
		ifTrue: [ ^ aStringOrArrayOfPoint ].
	aStringOrArrayOfPoint isSequenceable
		ifTrue: [ ^ String
				streamContents: [ :stream | 
					aStringOrArrayOfPoint
						do: [ :pointOrString | 
							stream
								nextPutAll:
									(pointOrString isPoint
										ifTrue: [ pointOrString x asString , ',' , pointOrString y asString ]
										ifFalse: [ pointOrString asString ]) ]
						separatedBy: [ stream space ] ] ].
	^ aStringOrArrayOfPoint asString
]

{ #category : #printing }
XenqSVG >> printPrologOn: aStream [
	super printPrologOn: aStream.
	aStream
		cr;
		nextPutAll:
			'<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">';
		cr
]
