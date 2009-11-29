From: Alessio Cimmino <rainmaker85@libero.it>
Subject: Help with BR_POSTROUTING hack
Date: Sun, 29 Nov 2009 10:08:57 +0100
Message-ID: <4B123A29.6060904@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Helllo.
I need to add a new header between layer 2 and 3 for my own purposes. My 
machines are configured in bridge mode because I need all interfaces for 
load balancing purposes; What I did is just intercept the outgoing 
packet at _BR_POSTROUTING hook to expand socket buffer if needed, shift 
the MAC header up and let my header join.
I changed MTU of netdevice with ifconfig eth0 mtu command.
This way I could handle the new header bytes overhead to not impact with 
the given mtu, which in my case is 1500 for ethernet.

My question is mainly focused on the understanding of the situation in 
the BR_POSTROUTING hook. I would like to understand if at that point the 
CRC32 field of the ethernet formed frame is already written and if I 
have to recompute it and in case, how and where to store it (*(skb->tail)?).
What I experiment is a lot of retrasmissions in a tcp session and 
problems with fragmentation of ip packet in skb_gso_fragment function. I 
know the checksums calculation is done completely via software in case 
of ip fragmentation, but I don't know at that point what do I have to 
(re)compute.
Any help would make me so gratefull. Thanks

