编译打包步骤
1. 编译binary
打开BlackHole.xcodeproj, 编译，拷贝生成的 product Omi Mirror Audio Driver.driver到当前目录

2. 给binary签名（使用Developer ID certificate）
https://help.apple.com/xcode/mac/current/#/deve51ce7c3d

security find-identity

codesign -s "Developer ID Application: Chenghao Wu (UFC6W2DD6Z)" --timestamp -o runtime -f Omi\ Mirror\ Audio\ Driver.driver/Contents/MacOS/Omi\ Mirror\ Audio\ Driver Omi\ Mirror\ Audio\ Driver.driver/Contents/MacOS/Omi\ Mirror\ Audio\ Driver

检查签名
codesign -dvvv Omi\ Mirror\ Audio\ Driver.driver/Contents/MacOS/Omi\ Mirror\ Audio\ Driver

3. 安装packages, 打包成pkg
http://s.sudre.free.fr/Software/Packages/about.html
选择build的目标文件夹
设置bundle id: com.omi.pkg.OmiMirrorAudioDriver
New Folder: Library/Audio/Plug-Ins/HAL, 添加build出来签过名driver文件夹到这个目录下
选择pre-install和post-install script
cmd + B 编译出pkg文件

4. 给pkg签名(使用Developer ID Installer certificate)
productsign --sign "Developer ID Installer: Chenghao Wu (UFC6W2DD6Z)" Omi\ Mirror\ Audio\ Driver/Omi\ Mirror\ Audio\ Driver.pkg Notarization/Omi\ Mirror\ Audio\ Driver.pkg

检查签名
pkgutil --check-signature Notarization/Omi\ Mirror\ Audio\ Driver.pkg

5. notarize pkg
https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution/customizing_the_notarization_workflow?language=objc

xcrun altool --notarize-app --primary-bundle-id "audio.existential.OmiMirrorAudioDriver" --username "772387860@qq.com" --password "wafz-hdsp-lzsh-skss" --file Notarization/Omi\ Mirror\ Audio\ Driver.pkg  &> tmp

检查
xcrun altool --notarization-history 0 -u "772387860@qq.com" -p "wafz-hdsp-lzsh-skss"

6.Staple the Ticket to pkg
xcrun stapler staple Notarization/Omi\ Mirror\ Audio\ Driver.pkg

7.Final check pkg
spctl -a -v --type install Notarization/Omi\ Mirror\ Audio\ Driver.pkg
