From: "Adem" <for-gmane@alicewho.com>
Subject: The "badguy" example in the man page not working (--> "iptables: No chain/target/match by that name")
Date: Fri, 14 Nov 2008 16:22:38 +0100
Message-ID: <gfk58b$qlv$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

The following example from the man page doesn't work on my box:

  iptables -A FORWARD -m recent --name badguy --rcheck --seconds 60 -j DROP
  iptables -A FORWARD -p tcp -i eth0 --dport 139 -m recent --name badguy --set -j DROP

It says: "iptables: No chain/target/match by that name"

What could be the reason?

My ifconfig:

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:382878 errors:0 dropped:0 overruns:0 frame:0
          TX packets:382868 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:3307823766 (3.0 GiB)  TX bytes:78410937 (74.7 MiB)

venet0    Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:127.0.0.1  P-t-P:127.0.0.1  Bcast:0.0.0.0  Mask:255.255.255.255
          UP BROADCAST POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1
          RX packets:109018 errors:0 dropped:0 overruns:0 frame:0
          TX packets:101974 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:49437708 (47.1 MiB)  TX bytes:49733010 (47.4 MiB)

venet0:0  Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:87.x.x.x  P-t-P:87.x.x.x  Bcast:0.0.0.0  Mask:255.255.255.255
          UP BROADCAST POINTOPOINT RUNNING NOARP  MTU:1500  Metric:1



