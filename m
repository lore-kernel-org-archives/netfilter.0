From: Hugo Alves <hugo.ma.alves@gmail.com>
Subject: Post_Routing hook with encapsulated packets (forwarding scenario)
Date: Thu, 14 Aug 2014 01:42:42 +0100
Message-ID: <CALjSwYeMi6xW69qB=9if3RKo=Jh9xd45nsqCvXBgnYCADuE3tQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=DErXT8Jrkeyx8uzTVx8Qf8GMM1qbO0rXHZJ0DPkd3hc=;
        b=kji/a0G0zBcix4BSxzxb0jGay8nYmbyUbEaInQGb5mWSwndEwTvHH3+7gNpKPWRdi1
         n73BvI5Ys8tUa83Sjj+5913Ez4REy5tX6ulDJiFQhK3uA2QIhI1sAC5Ucc81i7ZtkOQn
         KQPIqEPYq/Tn+1Nn5RpXkFMtqrpmcVQuZm0UoKKp8/JFUDtALWTno5o911+ibl11NXSC
         Jx7q5bs7FiqE2oLUoJAMpD4vKZRzMOOeO0Yt1YJ5VUs2n3BV2coYafJv/jHH4SOB+CDw
         6uEDnaRaQ6X3Q0cH1eeNaPj0FO3nxdw8IITlRDZd+bvpNIpJFpCZVndEz1AAqWuA8AMf
         0KMw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I've written a small kernel module to measure packet processing times.
This module registers itself in a netfilter hook, more specifically
the NF_INET_POST_ROUTING. After that it uses the information in skb
struct to calculate some metrics for each packet.
My setup have 3 nodes, a sender, a receiver and a router where the
module is installed.

The router have two network interfaces, eth0 connected to a lan where
the sender is and the other(eth1) connected to the lan where the
receiver is. Lets assume that the traffic only flows from the sender
to the receiver.
The router has also an tunnel "interface"(ip6tnl1) that is connected
to the receiver. All traffic that goes to the receiver passes through
the tunnel.

 _____________
|  Sender          |
|_____________|
      |
      |
      |(eth0)
 ___|_________
|  Router           |
|_____________|
      |(eth1)
      |
      |
     | |
     | |
     | |  (ip6tnl1)
     | |
      |
      |
 ___|________
| Receiver      |
|___________ |

First I've tested my module in a 3.2 kernel.
In this kernel for each packet forwarded I get two calls in my
callback function of the hook. One for the original packet that is
routed from eth0 to ip6tnl1. And the other is the encapsulated packet
that goes from ip6tnl1 to eth1.
In both I have the same skb->tstamp, meaning that even when the kernel
creates the encapsulated packet it preservers the original timestamp
from when the packet entered the system. Is this assumption about the
time correct?

Then I've tested the same module in kernel 3.15.9, and in this case I
only see the encapsulated packet in the Post_routing hook. In this
case the tstamp in skb struct is the time when the original packet
entered the system or is the time when the kernel created the new
encapsulated packet? I am not sure about this tstamp.

The behaviour of the hooks have changed recently in the kernel?


The code of the module: https://gist.github.com/e646eba4765478fbd9c2.git

Regards
Hugo Alves
