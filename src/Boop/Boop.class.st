"
I am the gameborad which shows the Boop game
"
Class {
	#name : #Boop,
	#superclass : #BlElement,
	#instVars : [
		'map',
		'aLayoutConstraints'
	],
	#category : #Boop
}

{ #category : #accessing }
Boop >> backgroundPaint [ 
	| |
	^ Color lightBlue 
]

{ #category : #drawing }
Boop >> drawBoard [
	|  |
	
	1 to: 5 do: 
		[ :n || tile |
		tile := BoopTile  new: (n asString) .
		self addChild: tile ]
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
	|  |
	super initialize.
	self layout: BlGridLayout horizontal.
	self drawBoard.
	
]
