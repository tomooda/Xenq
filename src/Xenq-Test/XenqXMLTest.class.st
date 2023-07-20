Class {
	#name : #XenqXMLTest,
	#superclass : #TestCase,
	#category : #'Xenq-Test'
}

{ #category : #tests }
XenqXMLTest >> testAddElementWith [
	| xml |
	xml := XenqXML name: 'xml'.
	xml addElement: 'e' with: [ :e | e at: 'x' put: '1' ].
	self
		assert:
			(String
				streamContents: [ :stream | 
					xml
						childrenDo: [ :child | stream nextPutAll: (child at: 'x' ifAbsent: [ '' ]) ] ])
		equals: '1'
]

{ #category : #tests }
XenqXMLTest >> testAddText [
	| xml |
	xml := XenqXML
		element: 'xml'
		with: [ :element | element addText: 'test&debug' ].
	self
		assert:
			(String
				streamContents: [ :stream | xml childrenDo: [ :child | stream nextPutAll: child ] ])
		equals: 'test&amp;debug'
]

{ #category : #tests }
XenqXMLTest >> testAt [
	| xml |
	xml := XenqXML name: 'xml'.
	xml at: 'abc' put: 'def'.
	self assert: (xml at: 'abc') equals: 'def'
]

{ #category : #tests }
XenqXMLTest >> testAtIfAbsent [
	| xml |
	xml := XenqXML name: 'xml'.
	self assert: (xml at: 'abc' ifAbsent: [ 'xyz' ]) equals: 'xyz'.
	xml at: 'abc' put: 'def'.
	self assert: (xml at: 'abc' ifAbsent: [  ]) equals: 'def'
]

{ #category : #tests }
XenqXMLTest >> testAtIfAbsentPut [
	| xml |
	xml := XenqXML name: 'xml'.
	self assert: (xml at: 'abc' ifAbsentPut: [ 'xyz' ]) equals: 'xyz'.
	self assert: (xml at: 'abc' ifAbsentPut: [ 'XYZ' ]) equals: 'xyz'
]

{ #category : #tests }
XenqXMLTest >> testAtIfPresentIfAbsent [
	| xml |
	xml := XenqXML name: 'xml'.
	self
		assert: (xml at: 'abc' ifPresent: [ :abc | abc ] ifAbsent: [ 'xyz' ])
		equals: 'xyz'.
	xml at: 'abc' put: '1.0'.
	self
		assert: (xml at: 'abc' ifPresent: [ :abc | abc ] ifAbsent: [ 'xyz' ])
		equals: '1.0'
]

{ #category : #tests }
XenqXMLTest >> testAtPut [
	| xml |
	xml := XenqXML name: 'xml'.
	xml at: 'abc' put: 'def'.
	self assert: (xml at: 'abc' ifAbsent: [  ]) equals: 'def'.
	xml removeAt: 'abc' ifAbsent: [  ].
	self assert: (xml at: 'abc' ifAbsent: [  ]) equals: nil
]

{ #category : #tests }
XenqXMLTest >> testName [
	| xml |
	xml := XenqXML name: 'xml'.
	self assert: xml name equals: 'xml'.
	xml name: 'XML'.
	self assert: xml name equals: 'XML'
]

{ #category : #tests }
XenqXMLTest >> testPrintOn [
	| xml |
	xml := XenqXML
		element: 'xml'
		with: [ :e | 
			e
				at: 'id' put: '123';
				addText: 'abc';
				addElement: 'e' with: [ :e2 | e2 at: 'x' put: '1' ];
				addText: 'xyz' ].
	self
		assert: (String streamContents: [ :stream | xml printOn: stream ])
		equals: '<xml id="123">abc<e x="1" />xyz</xml>'
]

{ #category : #tests }
XenqXMLTest >> testPrintStringWithProlog [
	| xml |
	xml := XenqXML
		element: 'xml'
		with: [ :e | 
			e
				at: 'id' put: '123';
				addText: 'abc';
				addElement: 'e' with: [ :e2 | e2 at: 'x' put: '1' ];
				addText: 'xyz' ].
	self
		assert: xml printStringWithProlog
		equals: '<?xml version="1.0" encoding="UTF-8"?><xml id="123">abc<e x="1" />xyz</xml>'
]
