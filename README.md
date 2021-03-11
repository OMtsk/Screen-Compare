Screen Compare
===

## Overview

画面の状態をユーザに伝える

## Description
  
　makeやあアップデートなどで待つことが多い。その間に他のこと(仮眠)をしたい。しかし、進捗を確認するため画面を見なければならない。これでは仮眠(他の作業)に集中できない!!そこで、"Screen Compare"を使用する。    

　"Screen Compare"は画面全体のスクリーンショットを1秒おきに取得する。取得したスクリーンショットを比較し、もし同じならサーボモータを回転させる。これによってmakeやアップデートなどが終わったと分かる。（近くにサーボモータがあったのでサーボモータを使用した）
  
## Demo
  
画面に変更がある(ない)と、サーボモータが動きます
  
## Requirement
  
Bash 			- bashスクリプト  
ImageMagick		- 画像の比較に使用  
xwd				- スクリーンショット  
Arduino IDE	    - Arduinoへ書き込み  
  
## Usage
  
```bash
$ scomp.sh 1 or 0 Serial Port
```
  
## Example
  
画面に変更がない時にサーボモータを動かす
```bash
$ scomp.sh 0 /dev/ttyACM0
```
  
画面に変更があった時にサーボモータを動かす
```bash
$ scomp.sh 1 /dev/ttyACM0
```
  
## Install
  
Ubuntu / Debian
```bash
$ sudo apt install imagemagick 
```
  
Gentoo Linux
```bash
$ sudo emerge -av imagemagick xwd
```
  
1. Arduino IDEをインストール  
2. Digital pin 6にサーボモータの信号線を接続 
3. ArduinoをPCにUSBで接続  
4. Arduino/scomp.ino をArduinoに書き込む  
5. scomp.shを実行  
