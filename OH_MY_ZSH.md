# OH MY ZSH install

## 离线安装zsh

* 下载zsh

  rpm包下载页面

  [zsh 5.1](https://centos.pkgs.org/7/ghettoforge-plus-x86_64/zsh-5.1-1.gf.el7.x86_64.rpm.html)

  拷贝到主机

  ```shell
  sudo -ivh zsh-5.1-1.gf.el7.x86_64.rpm
  ```

  安装过程中会询问是否切换shell为zsh

  可以`chsh -s /bin/bash`将terminal改回bash

## 安装oh-my-zsh

* github/oh-my-zsh仓库

  https://github.com/ohmyzsh/ohmyzsh

* 注释掉tools/install中的部分代码

  ```shell
  #if [ -d "$ZSH" ]; then
  #	cat <<-EOF
  #		${YELLOW}You already have Oh My Zsh installed.${RESET}
  #		You'll need to remove '$ZSH' if you want to reinstall.
  #	EOF
  #	exit 1
  #fi
  ```

  拷贝到主机

  oh-my-zsh移动到~/.oh-my-zsh

  ```shell
  sh ~/.oh-my-zsh/tools/install.sh
  ```

  ~/.oh-my-zsh/themes中有100多款主题。

  在~/.zshrc设置，参照其中*ZSH_THEME="robbyrussell"*的格式修改主题。
  
## 推荐一种主题

* 下载powerlevel10k

  [Github](https://github.com/romkatv/powerlevel10k)

  把文件夹复制到.on-my-zsh/themes/powerlevel10k

  在~/.zshrc设置，ZSH_THEME="powerlevel10k/powerlevel10k"

  重新连接到shell，会进入样式调整阶段。

  如果服务器无法连接外网，建议关闭fetch gitstatusd

  进入~/.p10k.zsh，添加`typeset -g POWERLEVEL9K_DISABLE_GITSTATUS=true`
