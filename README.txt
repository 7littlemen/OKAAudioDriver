编译打包步骤
1. 编译binary
打开BlackHole.xcodeproj, 编译，拷贝生成的 product Omi Mirror Audio Driver.driver到当前目录

2. 给binary签名（使用Developer ID certificate）
https://help.apple.com/xcode/mac/current/#/deve51ce7c3d

security find-identity

codesign -s "Developer ID Application: Chenghao Wu (UFC6W2DD6Z)" --timestamp -o runtime -f Omi\ Mirror\ Audio\ Driver.driver/Contents/MacOS/Omi\ Mirror\ Audio\ Driver Omi\ Mirror\ Audio\ Driver.driver/Contents/MacOS/Omi\ Mirror\ Audio\ Driver

查看
codesign -dvvv Omi\ Mirror\ Audio\ Driver.driver/Contents/MacOS/Omi\ Mirror\ Audio\ Driver

3. 安装packages, 打包成pkg
http://s.sudre.free.fr/Software/Packages/about.html

4. 给pkg签名(使用Developer ID Installer certificate)

