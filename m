From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: ebtables does not forward net request, help please.
Date: Sun, 8 Jul 2012 07:20:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1207080716420.31302@aurora.sdinet.de>
References: <201207081128365653380@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201207081128365653380@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gmail <zhangjin2272@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Sun, 8 Jul 2012, gmail wrote:

> 5, Now again allow this specific mac to travel between eth0 and eth2. 
> ebtable -A FORWARD -s ! 00:11:22:33:44:55 -d ! 00:11:22::33:44:55 -j DROP
> 6, Now again, using ping tool to check network connectivity. (eth0-eth2).
> The expected result is that network connection between eth0 and eth2 should be available. But unfortuntly sometimes the connectivity is not available. This happends about 2-3 times when I tried this for 10 times. This is a little strange to me. And the network is only available after the host send a ARP request through eth0, only then the network becomes available again. 
> Please can anyone help about this? Thanks a lot.

Did you forget about the ARP queries from the other boxes asking for the 
ip of the box with the mac 00:11:22:33:44:55?

They come from the query hosts mac and go to the broadcast 
(ff:ff:ff:ff:ff:ff), asking for the mac of ip a.b.c.d. Those get dropped 
with your above setup and never reaching your special host, so the other 
hosts do not know to which mac to send the packets.

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
