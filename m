From: Christian Lerrahn <lists@penpal4u.net>
Subject: New connlimit: how to use?
Date: Fri, 7 Dec 2007 10:56:45 +1100
Message-ID: <20071207105645.586a0f23@penpal4u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I've seen that this question has been asked before but without reply.
I'll therefore make another attempt to rephrase it.

I need connlimit on one of my boxes. For that I first tried kernel
2.6.22 with patch-o-matic which failed. The kernel dropped everything
on a given port as soon as any rule was set for that port.

So, I decided to go to 2.6.23 and was delighted to see that connlimit
is now included in the vanilla kernel. However, I realised that the
structure is not the same as the patch produced. So I assumed that you
would need the latest version of iptables. I therefore got iptables
1.4.0rc1 and compiled it. Generally speaking iptables works fine now.
However, if I try to set a rule using connlimit, I get an error

"iptables: Invalid argument"

If I run e.g.

iptables -vv -A INPUT -p tcp --dport 80 -m connlimit --connlimit-above 32 -j DROP

I see the output

DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  tcp dpt:80 #conn/32 > 32 
libiptc v1.4.0rc1. 620 bytes.
Table `filter'
Hooks: pre/in/fwd/out/post = 0/0/148/296/0
Underflows: pre/in/fwd/out/post = 0/0/148/296/0
Entry 0 (0):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
Flags: 00
Invflags: 00
Counters: 4598391 packets, 695123203 bytes
Cache: 00000000
Target name: `' [36]
verdict=NF_ACCEPT

Entry 1 (148):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
Flags: 00
Invflags: 00
Counters: 0 packets, 0 bytes
Cache: 00000000
Target name: `' [36]
verdict=NF_ACCEPT

Entry 2 (296):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
Flags: 00
Invflags: 00
Counters: 5476812 packets, 2506858579 bytes
Cache: 00000000
Target name: `' [36]
verdict=NF_ACCEPT

Entry 3 (444):
SRC IP: 0.0.0.0/0.0.0.0
DST IP: 0.0.0.0/0.0.0.0
Interface: `'/................to `'/................
Protocol: 0
Flags: 00
Invflags: 00
Counters: 0 packets, 0 bytes
Cache: 00000000
Target name: `ERROR' [64]
error=`ERROR'

iptables: Invalid argument

Now, being a total n00b (at least when it comes to these things),
that doesn't tell me anything. :(

Any hints?

Cheers,
Christian
