From: Gary Smith <gary.smith@holdstead.com>
Subject: ipv6 and a single port forward
Date: Tue, 21 Dec 2010 10:41:14 -0800
Message-ID: <034DEBCAE934A74991E6E76B8DA72D146EB67F1A51@HSSBS.holdstead.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

I have an odd case where I need to redirect port 25 and 587 incoming to a mail store to a different MTA.  Basically, the mail store is just that and I need all send traffic to go through our cluster of outgoing MTA's.  Anyway, right now I'm doing the port NAT's using IPV4 on the bridge and was hoping to do something similar on the new bridge that will be running IPV4.  All servers have both an IPV6 and IPV4 address.

Anyway, is there a simple way to redirect this traffic destined to these two ports to a different IPV6?  I've read a couple threads using TPROXY under mangle, but I wanted to find out what the recommended way is.

Firewall is opensuse 11.3 with 1.4.8


