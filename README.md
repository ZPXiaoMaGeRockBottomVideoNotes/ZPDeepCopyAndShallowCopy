# ZPDeepCopyAndShallowCopy
本Demo主要介绍了深拷贝和浅拷贝的概念。总结出的结论：1、不可变对象调用"copy"方法，得到的也是一个不可变对象，是浅拷贝；2、不管是可变对象还是不可变对象，只要调用"mutableCopy"方法，得到的都是可变对象，深拷贝。
