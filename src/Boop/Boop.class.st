"
I am the gameborad which shows the Boop game
"
Class {
	#name : #Boop,
	#superclass : #BlElement,
	#instVars : [
		'map'
	],
	#category : #Boop
}

{ #category : #accessing }
Boop >> backgroundPaint [ 
	| |
	^ Color lightBlue 
]

{ #category : #drawing }
Boop >> drawOnSpartaCanvas: aCanvas [
	|  |
	aCanvas fill
		paint: self backgroundPaint;
		path: self boundsInLocal;
		draw
]

{ #category : #initialization }
Boop >> initialize [ 
	"comment stating purpose of message"

	|  |
	super initialize.
	self size: 80 @ 80.
]

{ #category : #initialization }
Boop >> initialize: aBounds [
	| |
	super initialize.
	self size: aBounds.
]
