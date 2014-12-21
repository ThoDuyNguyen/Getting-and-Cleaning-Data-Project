###Code book

####subject
id of the person who participate the experiments. This integer value bounded within [1,30] 

####activity
Type of activity of the volunteer which was monitored. There are 6 types: 

- **WALKING**
- **WALKING_UPSTAIRS**
- **WALKING_DOWNSTAIRS**
- **SITTING**
- **STANDING**
- **LAYING**

####feature
Feature of the activity. There are 66 feature:

- **t.body.acc.mean.x              ** mean of time domain signal of body acceleration in X axis
- **t.body.acc.mean.y             ** mean of time domain signal of body acceleration in Y axis
- **t.body.acc.mean.z              ** mean of time domain signal of body acceleration in Z axis
- **t.body.acc.std.x              ** standard deviation of time domain signal of body acceleration in X axis
- **t.body.acc.std.y               ** standard deviation of time domain signal of body acceleration in Y axis
- **t.body.acc.std.z              ** standard deviation of time domain signal of body acceleration in Z axis
- **t.gravity.acc.mean.x           ** mean of time domain signal of gravity acceleration in X axis
- **t.gravity.acc.mean.y          ** mean of time domain signal of gravity acceleration in Y axis
- **t.gravity.acc.mean.z           ** mean of time domain signal of gravity acceleration in Z axis
- **t.gravity.acc.std.x           ** standard deviation of time domain signal of gravity acceleration in X axis
- **t.gravity.acc.std.y            ** standard deviation of time domain signal of gravity acceleration in Y axis
- **t.gravity.acc.std.z           ** standard deviation of time domain signal of gravity acceleration in Z axis
- **t.body.acc.jerk.mean.x         ** mean of obtaining Jerk signal from time domain signal  of body accelaration in X axis
- **t.body.acc.jerk.mean.y        ** mean of obtaining Jerk signal from time domain signal of body accelaration in Y axis
- **t.body.acc.jerk.mean.z         ** mean of obtaining Jerk signal from time domain signal of body accelaration in Z axis
- **t.body.acc.jerk.std.x         ** standard deviation  of obtaining Jerk signal from time domain signal of body accelaration in X axis
- **t.body.acc.jerk.std.y          ** standard deviation   of obtaining Jerk signal from time domain signal of body accelaration in X axis
- **t.body.acc.jerk.std.z         ** standard deviation   of obtaining Jerk signal from time domain signal of body accelaration in X axis
- **t.body.gyro.mean.x             ** mean of time domain signal of body gyro in X axis
- **t.body.gyro.mean.y            ** mean of time domain signal of body gyro in Y axis
- **t.body.gyro.mean.z             ** mean of time domain signal of body gyro in Z axis
- **t.body.gyro.std.x             ** standard deviation of time domain signal of body gyro in X axis
- **t.body.gyro.std.y              ** standard deviation of time domain signal of body gyro in Y axis
- **t.body.gyro.std.z             ** standard deviation of time domain signal of body gyro in Z axis
- **t.body.gyro.jerk.mean.x        ** mean of obtaining Jerk signal from body gyro in X axis
- **t.body.gyro.jerk.mean.y       ** mean of obtaining Jerk signal from body gyro in Y axis
- **t.body.gyro.jerk.mean.z        ** mean of obtaining Jerk signal from body gyro in Z axis
- **t.body.gyro.jerk.std.x        ** standard deviation of obtaining Jerk signal from time domain signal of body gyro in X axis
- **t.body.gyro.jerk.std.y         ** standard deviation  of obtaining Jerk signal from time domain signal of body gyro in Y axis
- **t.body.gyro.jerk.std.z        ** standard deviation  of obtaining Jerk signal from time domain signal of body gyro in Z axis
- **t.body.acc.mag.mean            ** mean of magnitude from time domain signal of  body accelaration  
- **t.body.acc.mag.std            ** standard deviation of magnitude from time domain signal of body accelaration  
- **t.gravity.acc.mag.mean         ** mean of magnitude from time domain signal of gravity accelaration  
- **t.gravity.acc.mag.std         ** standard deviation of magnitude from time domain signal of gravity accelaration  
- **t.body.acc.jerk.mag.mean       ** mean of magnitude from obtaining Jerk signal of time domain signal of gravity accelaration  
- **t.body.acc.jerk.mag.std       ** standard deviation of magnitude from obtaining Jerk signal of time domain signal of gravity accelaration  
- **t.body.gyro.mag.mean           ** mean of magnitude from time domain signal of body gyro
- **t.body.gyro.mag.std           ** standard deviation of magnitude from time domain signal of body gyro
- **t.body.gyro.jerk.mag.mean      ** mean of magnitude from obtaining Jerk signal of time domain signal of body gyro 
- **t.body.gyro.jerk.mag.std      ** standard deviation of magnitude from obtaining Jerk signal of time domain signal of body gyro  
- **f.body.acc.mean.x              ** mean of frequency domain signals of body accelaration in X axis
- **f.body.acc.mean.y             ** mean of frequency domain signals of body accelaration in Y axis
- **f.body.acc.mean.z              ** mean of frequency domain signals of body accelaration in Z axis
- **f.body.acc.std.x              ** standard deviation of frequency domain signals of body accelaration in X axis
- **f.body.acc.std.y               ** standard deviation of frequency domain signals of body accelaration in Y axis
- **f.body.acc.std.z              ** standard deviation of frequency domain signals of body accelaration in Z axis
- **f.body.acc.jerk.mean.x         ** mean of obtaining Jerk signal from frequency domain signal of body accelaration in X axis
- **f.body.acc.jerk.mean.y        ** mean of obtaining Jerk signal from frequency domain signal of body accelaration in Y axis
- **f.body.acc.jerk.mean.z         ** mean of obtaining Jerk signal from frequency domain signal of body accelaration in Z axis
- **f.body.acc.jerk.std.x         ** standard deviation of obtaining Jerk signal from frequency domain signal of body accelaration in X axis
- **f.body.acc.jerk.std.y          ** standard deviation Jerk signal from frequency domain signal of body accelaration in Y axis
- **f.body.acc.jerk.std.z         ** standard deviation Jerk signal from frequency domain signal of body accelaration in Z axis
- **f.body.gyro.mean.x             ** mean of frequency domain signal of body gyro in X axis
- **f.body.gyro.mean.y            ** mean of frequency domain signal of body gyro in Y axis
- **f.body.gyro.mean.z             ** mean of frequency domain signal of body gyro in Z axis
- **f.body.gyro.std.x             ** standard deviation of frequency domain signal of body gyro in X axis
- **f.body.gyro.std.y              ** standard deviation of frequency domain signal of body gyro in Y axis
- **f.body.gyro.std.z             ** standard deviation of frequency domain signal of body gyro in Z axis
- **f.body.acc.mag.mean            ** mean of magnitude from frequency domain signal of  body accelaration  
- **f.body.acc.mag.std            ** standard deviation of magnitude from frequency domain signal of body accelaration  
- **f.body.acc.jerk.mag.mean  ** mean of magnitude from obtaining Jerk signal of frequency domain signal of gravity accelaration  
- **f.body.acc.jerk.mag.std  ** standard deviation of magnitude from obtaining Jerk signal of frequency domain signal of gravity accelaration  
- **f.body.gyro.mag.mean      ** mean of magnitude from frequency domain signal of body gyro
- **f.body.gyro.mag.std      ** standard deviation of magnitude from frequency domain signal of body gyro
- **f.body.gyro.jerk.mag.mean ** mean of magnitude from obtaining Jerk signal of frequency domain signal of body gyro 
- **f.body.gyro.jerk.mag.std ** standard deviation of magnitude from obtaining Jerk signal of frequency domain signal of body gyro  
  
####mean.value
Normalized of avarage measured value of the feature. This floating value bounded within [-1, 1]