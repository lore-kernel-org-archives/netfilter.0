From: Azfar Hashmi <azfar.hashmi@cloudways.com>
Subject: xtables issue
Date: Sat, 04 Feb 2012 17:40:16 +0500
Message-ID: <4F2D2730.50205@cloudways.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everyone,

I am getting following error with xtables.

RTNETLINK answers: Invalid argument
We have an error talking to the kernel
   ERROR: Command "tc filter add dev eth0 protocol all parent 1:0 prio
276 handle 0 fw classid 1:10" Failed

iptables-1.4.9.1
xtables-1.41
Shorewall-4.4.11.6
kernel-2.6.32-5-686
shorewall conf files:

tcrules:

RESTORE:F            -             -           all
CONTINUE:F           -             -           all         
-              -          -       !0
1:F                  -             -           ipp2p:all        edk
1:F                  -             -           ipp2p:all        dc
1:F                  -             -           ipp2p:all        kazaa
1:F                  -             -           ipp2p:all        bit
1:F                  -             -           ipp2p:all        apple
1:F                  -             -           ipp2p:all        winmx
1:F                  -             -           ipp2p:all        soul
1:F                  -             -           ipp2p:all        ares
SAVE:F               -             -           all         
-              -          -       1

tcdevices:
eth0            100mbps         100mbps
tun0            100mbps         100mbps
tun1            100mbps         100mbps

tcclasses:
eth0            0       full/2  full    1               default
eth0            1       1kbit   1kbit   2
tun0            0       full/4  full    1               default
tun0            1       1kbit   1kbit   2
tun1            0       full/4  full    1               default
tun1            1       1kbit   1kbit   2

Same setup working on other machines. Tried from module-assistant and
source of different version of both xtables and iptables. Shorewall show
capabilities showing all available and also shorewall check result ok.
