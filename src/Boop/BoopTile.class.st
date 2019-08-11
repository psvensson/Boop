Class {
	#name : #BoopTile,
	#superclass : #BlElement,
	#instVars : [
		'size',
		'num'
	],
	#category : #Boop
}

{ #category : #accessing }
BoopTile >> backgroundPaint [ 
	| |
	^ Color lightYellow  
]

{ #category : #drawing }
BoopTile >> drawOnSpartaCanvas: aCanvas [
	|  |
	aCanvas fill
		paint: self backgroundPaint;
		path: self boundsInLocal;
		draw.
	self drawText: num on: aCanvas.	
]

{ #category : #drawing }
BoopTile >> drawText: text on: aCanvas [
	| font origin textPainter metrics |
	font := aCanvas font
		named: 'Source Sans Pro';
		size: 50;
		build.
	textPainter := aCanvas text
		font: font;
		paint: Color white;
		string: text.
	metrics := textPainter measure.
	origin := (self extent - metrics textMetrics bounds extent) / 2.0.
	origin := origin - metrics textMetrics bounds origin.
	textPainter
		baseline: origin;
		draw
]

{ #category : #initialization }
BoopTile >> initialize [ 
	|  |
	super initialize.
	num := 1.
	self geometry: BlRectangle new.
	size := 25
]

{ #category : #initialization }
BoopTile >> initialize: aNum [ 
	|  |
	super initialize.
	num := aNum.
	self geometry: BlRectangle new.
	size := 25
]
