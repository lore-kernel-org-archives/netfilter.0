From: Samir Sharma <s53554@beuth-hochschule.de>
Subject: problems loading a module
Date: Wed, 04 Feb 2015 11:56:30 +0100
Message-ID: <fb56a1bf58ef25fb3352a1c12b6ac168@beuth-hochschule.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi everyone, i've trying to test the module which was described in the 
tutorial. (xt_ipaddr).
i've put the xt_ipaddr.c, xt_ipaddr.h and libxt_ipaddr.c in the right 
folder (extensions-folder).

what i did then was:
> ./configure
> make
> sudo make install

the module was obviously not loaded...do i have to use the modprobe 
commad? if yes, how?? because these commands are not working
> modeprobe -v xt_ipaddr.ko
> modeprobe -v xt_ipaddr
> modeprobe -v ipaddr

HELP PLEASE
(used version : ubuntu 14.04, iptables 1.4.21, kernel 3.16.0)
