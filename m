From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Netfilter NAT port mapping question
Date: Tue, 4 Oct 2011 23:23:34 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1110042312450.20951@aurora>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hello,

Today at work a question came up about the Linux Netfilter NAT and how 
it remaps tcp/udp ports, and if we should plan to use more than one 
external IP address if we expect more than 64k connections with 
load-spikes, or do we not need to.

The question is, in the following case, does Netfilter "use" two 
external ports or are/can both connections be mapped to the same 
external source port?

Connections before SNAT:

  10.1.2.3 port 1024  -> 8.8.8.8 port 80
  10.1.2.10 port 1024 -> 9.9.9.9 port 80

After SNAT is it:

  a.b.c.d port 1024 -> 8.8.8.8 port 80
  a.b.c.d port 1025 -> 9.9.9.9 port 80

or

  a.b.c.d port 1024 -> 8.8.8.8 port 80
  a.b.c.d port 1024 -> 9.9.9.9 port 80

I know that a tcp/udp connection can be completely described as 
src-ip+src-port+dst-ip+dst-port, so if the destination address is 
different the connection would still be unique - but does Netfilter make 
use of it or not?

Googling for an answer did not result in anything conclusive, can 
someone on this list tell me?

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
