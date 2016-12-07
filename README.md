# TouchIDDemo
TouchID
一句代码集成指纹解锁：

如何使用?

导入头文件 #import "MTTouchHelper.h" ,在想要使用指纹的地方调用下面代码:

   if ([MTTouchHelper validateByTouchID])
    {
        NSLog(@"success");
    }
    else
        NSLog(@"fail");

![image](https://github.com/MrTung/TouchIDDemo/blob/master/TouchIDDemo/Screenshots/1.png?raw=true)
![image](https://github.com/MrTung/TouchIDDemo/blob/master/TouchIDDemo/Screenshots/2.PNG?raw=true)
![image](https://github.com/MrTung/TouchIDDemo/blob/master/TouchIDDemo/Screenshots/3.PNG?raw=true)

