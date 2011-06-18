From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Use ebtables to forward 802.1x frames ?
Date: Sat, 18 Jun 2011 09:19:26 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106180910160.32594@frira.zrqbmnf.qr>
References: <BANLkTi=eN=K9RMbBh4QQpZD4CO6uWBNBWg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=eN=K9RMbBh4QQpZD4CO6uWBNBWg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Carter <ncarter100@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2011-06-17 23:01, Nick Carter wrote:

>Hi,
>
>Its been suggested to me that ebtables can be used to forward 802.1x
>frames.

Nope, ebtables [ebtables.ko] can filter/change them. For mere bridging 
activity, brctl [bridge.ko] is used, and forwarding is done by routing 
[net/*/route.c].

>I need to do this to bridge a virtual machine supplicant to
>an external authenticator switch.  As far as I can see ebtables acts
>as a frame filter.  With this rule:
>sudo ebtables -t filter -A INPUT -p 0x888E -i vnet0 -j ACCEPT --log

As a filter yes, and you indicated to that command that you do not 
want to discard the packet - which then so occurred.

>I get a match
>Jun 17 19:48:47 mill kernel: [ 1271.665003]  IN=vnet0 OUT= MAC source
>= 52:54:00:e3:ec:01 MAC dest = 01:80:c2:00:00:03 proto = 0x888e
>But the frame (skb) continues in the default manner and is returned
>back from the bridge code, rather than being forwarded.
>br_handle_frame()
>...
>               if (NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN, skb, skb->dev,
>                           NULL, br_handle_local_finish))
>                       return NULL;    /* frame consumed by filter */
>               else {
>                 return skb;   /* continue processing */
>               }
>       }
>forward:

The "..." part contains:
	if (is_link_local(dest))

which checks whether dstmac is local - and if that is the case, ethernet 
frames are not bridged, but delivered to the local L3 routing.
