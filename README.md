Screen Compare
===

## Overview

���̤ξ��֤�桼����������

## Description
  
��make�䤢���åץǡ��Ȥʤɤ��ԤĤ��Ȥ�¿�������δ֤�¾�Τ���(��̲)�򤷤���������������Ľ���ǧ���뤿����̤򸫤ʤ���Фʤ�ʤ�������Ǥϲ�̲(¾�κ��)�˽���Ǥ��ʤ�!!�����ǡ�"Screen Compare"����Ѥ��롣    

��"Screen Compare"�ϲ������ΤΥ����꡼�󥷥�åȤ�1�ä����˼������롣�������������꡼�󥷥�åȤ���Ӥ����⤷Ʊ���ʤ饵���ܥ⡼�����ž�����롣����ˤ�ä�make�䥢�åץǡ��Ȥʤɤ�����ä���ʬ���롣�ʶ᤯�˥����ܥ⡼�������ä��Τǥ����ܥ⡼������Ѥ�����
  
## Demo
  
���̤��ѹ�������(�ʤ�)�ȡ������ܥ⡼����ư���ޤ�
  
## Requirement
  
Bash 			- bash������ץ�  
ImageMagick		- ��������Ӥ˻���  
xwd				- �����꡼�󥷥�å�  
Arduino IDE	    - Arduino�ؽ񤭹���  
  
## Usage
  
```bash
$ scomp.sh 1 or 0 Serial Port
```
  
## Example
  
���̤��ѹ����ʤ����˥����ܥ⡼����ư����
```bash
$ scomp.sh 0 /dev/ttyACM0
```
  
���̤��ѹ������ä����˥����ܥ⡼����ư����
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
  
1. Arduino IDE�򥤥󥹥ȡ���  
2. Digital pin 6�˥����ܥ⡼���ο���������³ 
3. Arduino��PC��USB����³  
4. Arduino/scomp.ino ��Arduino�˽񤭹���  
5. scomp.sh��¹�  
