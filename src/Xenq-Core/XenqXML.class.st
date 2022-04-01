Class {
	#name : #XenqXML,
	#superclass : #Object,
	#instVars : [
		'name',
		'attributes',
		'children'
	],
	#classVars : [
		'QuoteChars'
	],
	#category : #'Xenq-Core'
}

{ #category : #'instance creation' }
XenqXML class >> addElement: aString with: aBlock [
	| element |
	element := self name: aString.
	aBlock value: element.
	^ element
]

{ #category : #'instance creation' }
XenqXML class >> element: aString with: aBlock [
	| element |
	element := self name: aString.
	aBlock value: element.
	^ element
]

{ #category : #'instance creation' }
XenqXML class >> name: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #accessing }
XenqXML class >> quoteChars [
	^ QuoteChars
		ifNil: [ QuoteChars := {($< -> '&lt;').
			($> -> '&gt;').
			($& -> '&amp;').
			($' -> '&apos;').
			($" -> '&quot;')} asDictionary ]
]

{ #category : #accessing }
XenqXML >> addElement: aString with: aBlock [
	| child |
	child := self class name: aString.
	aBlock value: child.
	^ children add: child
]

{ #category : #accessing }
XenqXML >> addText: aString [
	^ children add: aString asString
]

{ #category : #accessing }
XenqXML >> append: aXenqXML [
	^ children add: aXenqXML
]

{ #category : #accessing }
XenqXML >> at: aString [
	^ attributes at: aString
]

{ #category : #accessing }
XenqXML >> at: aString ifAbsent: errorBlock [
	^ attributes at: aString ifAbsent: errorBlock
]

{ #category : #accessing }
XenqXML >> at: aString ifAbsentPut: errorBlock [
	^ attributes at: aString ifAbsentPut: errorBlock
]

{ #category : #accessing }
XenqXML >> at: aString ifPresent: aBlock [
	^ attributes at: aString ifPresent: aBlock
]

{ #category : #accessing }
XenqXML >> at: aString ifPresent: aBlock ifAbsent: errorBlock [
	^ attributes at: aString ifPresent: aBlock ifAbsent: errorBlock
]

{ #category : #accessing }
XenqXML >> at: aString put: anotherString [
	^ attributes at: aString put: anotherString
]

{ #category : #accessing }
XenqXML >> childrenDo: aBlock [
	children do: aBlock
]

{ #category : #initialization }
XenqXML >> initialize [
	super initialize.
	attributes := OrderedDictionary new.
	children := OrderedCollection new
]

{ #category : #accessing }
XenqXML >> name [
	^ name
]

{ #category : #accessing }
XenqXML >> name: aString [
	name := aString
]

{ #category : #printing }
XenqXML >> printOn: aStream [
	aStream
		nextPut: $<;
		nextPutAll: name asString.
	attributes
		keysAndValuesDo: [ :key :value | 
			aStream
				space;
				nextPutAll: key asString;
				nextPut: $=;
				nextPutAll: (self quoteAttribute: value) ].
	children
		ifEmpty: [ aStream
				space;
				nextPutAll: '/>' ]
		ifNotEmpty: [ aStream nextPut: $>.
			children
				do: [ :e | 
					e isString
						ifTrue: [ aStream nextPutAll: e ]
						ifFalse: [ e printOn: aStream ] ].
			aStream
				nextPutAll: '</';
				nextPutAll: name asString;
				nextPut: $> ]
]

{ #category : #printing }
XenqXML >> printPrologOn: aStream [
	aStream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'
]

{ #category : #printing }
XenqXML >> printStringWithProlog [
	^ String streamContents: [ :stream | self printWithPrologOn: stream ]
]

{ #category : #printing }
XenqXML >> printWithPrologOn: aStream [
	self
		printPrologOn: aStream;
		printOn: aStream
]

{ #category : #private }
XenqXML >> quoteAttribute: aString [
	(aString includes: $")
		ifFalse: [ ^ '"' , aString , '"' ].
	(aString includes: $')
		ifFalse: [ ^ '''' , aString , '''' ].
	^ String
		streamContents: [ :stream | 
			stream nextPut: $".
			aString
				do: [ :char | 
					char = $"
						ifTrue: [ stream nextPutAll: '&quot;' ]
						ifFalse: [ stream nextPut: char ] ].
			stream nextPut: $" ]
]

{ #category : #private }
XenqXML >> quoteText: aString [
	| quoteChars |
	quoteChars := self class quoteChars.
	^ String
		streamContents: [ :stream | 
			aString
				do: [ :char | 
					quoteChars
						at: char
						ifPresent: [ :string | stream nextPutAll: string ]
						ifAbsent: [ stream nextPut: char ] ] ]
]

{ #category : #accessing }
XenqXML >> removeAt: aString ifAbsent: errorBlock [
	^ attributes removeKey: aString ifAbsent: errorBlock
]

{ #category : #accessing }
XenqXML >> with: aBlock [
	aBlock ifNotNil: [ aBlock value: self ]
]
