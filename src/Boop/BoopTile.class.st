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
	^ Color darkGray   
]

{ #category : #drawing }
BoopTile >> drawOnSpartaCanvas: aCanvas [
	|  |
	aCanvas fill
		paint: self backgroundPaint;
		path: self boundsInLocal;
		draw.
	self drawText: (num asString) on: aCanvas.	
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
	Transcript show: text; cr.
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
	self geometry extent: 100@100
]

{ #category : #initialization }
BoopTile >> initialize: aNum [ 
	|  |
	super initialize.
	num := aNum.
	self geometry: BlRectangle new.
	self geometry extent: 100@100
]

{ #category : #accessing }
BoopTile >> num: n [
	| |
	num := n.
]
