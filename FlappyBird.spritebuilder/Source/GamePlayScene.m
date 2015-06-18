#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character =  (Character*)[CCBReader load:@"Character"];
    
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
    
}
    //this will be run every frame.
    //delta is the time that has elapsed since the last time it was run. 
-(void)update:(CCTime)delta
{
//Increment thetime since the last obstacle was added
timeSinceObstacle += delta;
}
// delta ia approximately 1/60th of a second
// check to see if two seconds have passed
if (timeSinceObstacle > 2.0f)
{
    //add a new obstacle
    [self addObstacle];
    //then reset the timer.
    timeSinceObstacle = 0.0f;
    
    // put update code here
}

// put new methods here
- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    //this will get called every time the player touches the screen
    [character flap];
}

@end
