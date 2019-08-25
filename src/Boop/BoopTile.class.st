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
BoopTile >> drawHexagon [
	| vertices polygon |
	"canvasContext.beginPath();
        canvasContext.moveTo(x + hexRadius, y);
        canvasContext.lineTo(x + hexRectangleWidth, y + hexHeight);
        canvasContext.lineTo(x + hexRectangleWidth, y + hexHeight + sideLength);
        canvasContext.lineTo(x + hexRadius, y + hexRectangleHeight);
        canvasContext.lineTo(x, y + sideLength + hexHeight);
        canvasContext.lineTo(x, y + hexHeight);
        canvasContext.closePath();"
	vertices := { 
    (self hexRadius )@0.
    (self hexRectangleWidth )@(self hexHeight ).
    (self hexRectangleWidth)@(self hexHeight + self sideLength ).
    (self hexRadius )@(self hexRectangleHeight ).
    (0)@(self sideLength  + self hexHeight ).
    (0)@(self hexHeight ).
   }.

	polygon := (BlPolygon vertices: vertices) asElement.
	self addChild: polygon.
	
]

{ #category : #drawing }
BoopTile >> drawOnSpartaCanvas: aCanvas [
	|  |
	aCanvas fill
		paint: self backgroundPaint;
		path: self boundsInLocal;
		draw.
	self drawText: (num asString) on: aCanvas.
	self drawHexagon.	
	
	

	
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

{ #category : #data }
BoopTile >> hexHeight [
 "Math.sin(hexagonAngle) * sideLength;"
	^ (self hexagonAngle sin ) * self sideLength 
]

{ #category : #data }
BoopTile >> hexRadius [
	"Math.cos(hexagonAngle) * sideLength;"
	^ (self hexagonAngle sin) * self sideLength.
]

{ #category : #data }
BoopTile >> hexRectangleHeight [
	"sideLength + 2 * hexHeight"
	^ self sideLength + (2 * self hexHeight )
]

{ #category : #data }
BoopTile >> hexRectangleWidth [
	"2 * hexRadius"
	^ 2 * self hexRadius 
]

{ #category : #data }
BoopTile >> hexagonAngle [
	^ 0.523598776
]

{ #category : #initialization }
BoopTile >> initialize [ 
	|  |
	super initialize.
	num := 1.
	self geometry: BlRectangle new.
	self geometry extent: 300@300
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

{ #category : #data }
BoopTile >> sideLength [
	^ 30
]

{ #category : #'visual properties' }
BoopTile >> symbolFontSize [
	^ 50
]
