# Import file "YouPay"
sketch = Framer.Importer.load("imported/YouPay@1x")

Utils.globalLayers(sketch)

# init
notification.visible = false
bg2.visible = false
bg0.bringToFront()

# progress
animation = new Animation
    layer: progress
    properties:
        rotation: 360 * 3
    time: 3
    curve: "linear"
    
progress.onAnimationStop ->
	bg2.visible = true
	bg2.bringToFront()
	animationBeam0.start()

# event   
finger.on Events.Click, ->
	bg1.bringToFront()
	animation.start()

# beam
beam0 = new Layer
	x: 0
	width: 1440
	height: 1440
	borderRadius: 1440 / 2
	backgroundColor: "white"
	opacity: 0.5
	parent: bg2
	scale: 0.5

card.bringToFront()
notification.bringToFront()

animationBeam0 = new Animation
    layer: beam0
    properties:
        scale: 1.0
        opacity: 0.2
    time: 1
    curve: "linear"
    repeat: 100

timer = 0
beam0.onAnimationEnd ->
	if ++timer is 3
		notification.visible = true