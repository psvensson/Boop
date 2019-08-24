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
BoopTile >> drawBorderPolygonOn: aCanvas [
	|rect vertices polygon|
	
	rect := Rectangle point: (0@0) point: (30@30).
	vertices := { 
    (rect left)@(rect top + 2).
    (rect left + 2)@(rect top).
    (rect right - 3)@(rect top).
    (rect right - 1)@(rect top + 2).
    (rect right -1)@(rect bottom - 3).
    (rect right - 3)@(rect bottom -1).
    (rect left + 2)@(rect bottom - 1).
    (rect left)@(rect bottom - 3).
    (rect left)@(rect top + 2) }.

	polygon := (BlPolygon vertices: vertices) asElement.
	
	self addChild: polygon		
 	  
]

{ #category : #drawing }
BoopTile >> drawOnSpartaCanvas: aCanvas [
	|  |
	aCanvas fill
		paint: self backgroundPaint;
		path: self boundsInLocal;
		draw.
	self drawText: (num asString) on: aCanvas.
	self drawBorderPolygonOn: aCanvas.	
	
	

	
]

{ #category : #drawing }
BoopTile >> drawText: text on: aCanvas [
	| font textPainter metrics baseline origin |
	
	font := aCanvas font
		size: self symbolFontSize;
		build.

	textPainter := aCanvas text
		font: font;
		paint: Color white;
		string: text.
	
	metrics := textPainter measure.
	
	origin := (self extent - metrics textMetrics bounds extent) / 2.0.
	baseline := origin - metrics textMetrics bounds origin.
	
	textPainter
		baseline: baseline;
		draw
]

{ #category : #initialization }
BoopTile >> initialize [ 
	|  |
	super initialize.
	num := 1.
	self geometry: BlRectangle new.
	self geometry extent: 200@200
]

{ #category : #initialization }
BoopTile >> initialize: aNum [ 
	|  |
	super initialize.
	num := aNum.
	self geometry: BlRectangle new.
	self geometry extent: 200@200.
	
]

{ #category : #accessing }
BoopTile >> num: n [
	| |
	num := n.
]

{ #category : #'visual properties' }
BoopTile >> symbolFontSize [
	^ 50
]
