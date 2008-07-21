From: Dimitri GOURDON <dgourdon@itool.com>
Subject: Iptables find invalid packets
Date: Mon, 21 Jul 2008 14:20:38 +0200
Message-ID: <48847F16.8040604@itool.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I've setup LVS on a box using Keepalived (and Iptables) to load balance 
traffic between 2 web servers. I have a problem :

A lot of TCP packets with FIN or RST flags (all I think) from clients 
are dropped by Iptables as state INVALID. The consequence is that I have 
a lot of connection in FIN_WAIT state (shown by netstat) on the 2 web 
servers...

I have reproduced this on my lab...

I have sniff packets with tcpdump to see flags, ACK number,... I've 
found nothing bad.

I have tried to accept these packets with Iptables and then, all my 
connections are terminated in a normal way (only 1-2 connection(s) stay 
in FIN_WAIT on web servers).

I know I can play with TCP timeout to reduce this behavior, but I'll 
prefer correct the problem. I don't understand why these packets are 
invalid if when I accept them, the connections end normaly...

Google is NOT my friend on this issue.

Is someone can help me ???

Dimitri Gourdon
Linux Web Administrator
Itool systems

PS : Sorry for my poor english !
