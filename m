From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: netfilter periodically thinks local traffic is FORWARDed
Date: Tue, 19 Jul 2011 13:07:59 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107191305580.31431@frira.zrqbmnf.qr>
References: <j03nj6$sql$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j03nj6$sql$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: netfilter@vger.kernel.org


On Tuesday 2011-07-19 12:51, Brian J. Murrell wrote:

>I have a router running 2.6.32.27.  It has an ip6 interface on it:
>
># ifconfig sixxs
>sixxs     Link encap:IPv6-in-IPv4  
>          inet6 addr: 2001:1234:f:107::2/64 Scope:Global
>          inet6 addr: fe80::a08:1/64 Scope:Link
>          inet6 addr: fe80::a4b:16fe/64 Scope:Link
>          inet6 addr: fe80::ae8a:d6fb/64 Scope:Link
>          inet6 addr: fe80::a4b:16c4/64 Scope:Link
>          inet6 addr: fe80::43c1:d6f2/64 Scope:Link

Uh better use `ip addr`.

>I have ip6tables rules installed (courtesy of Shorewall).  It seems
>occasionally however that netfilter thinks that traffic that is
>(supposed to be) local is being forwarded:
>
>Jul 19 06:44:41 10.75.22.196 kernel: Shorewall:FORWARD:REJECT:IN=sixxs
>OUT=sixxs SRC=2001:1234:000f:0107:0000:0000:0000:0001
>DST=2001:1234:000f:0107:0000:0000:0000:0002 LEN=104 TC=0 HOPLIMIT=63
>FLOWLBL=0 PROTO=ICMPv6 TYPE=128 CODE=0 ID=19746 SEQ=16622

Routing determines whether it is forwarded or not - cf.
`ip route show table all`, not Netfilter or Xtables.


>I have put a "watch" on the interface to see if it's temporarily losing
>that address while those packets are being logged and rejected and I
>didn't see any evidence of such.

How do you watch it?
