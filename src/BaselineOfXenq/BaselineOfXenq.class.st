Class {
	#name : #BaselineOfXenq,
	#superclass : #BaselineOf,
	#category : #BaselineOfXenq
}

{ #category : #baselines }
BaselineOfXenq >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'Xenq-Core';
				package: 'Xenq-Test' with: [ spec requires: #('Xenq-Core') ];
				group: 'default' with: #('Xenq-Core' 'Xenq-Test') ]
]
