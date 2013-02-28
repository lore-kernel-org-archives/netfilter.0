From: Steve Kann <stevek@stevek.com>
Subject: SYN Cookies vs ip_conntrack in SYN Flood conditions
Date: Thu, 28 Feb 2013 12:28:52 -0500
Message-ID: <27426969-529E-4D02-A526-39BB80C685D1@stevek.com>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Netfilter-wizards,

	I've been playing around with using iptables and syncookies to try to harden a linux box against SYN Flood attacks, and I seem to have run into something which doesn't work the way I'd want it to.

	Ideally, I'd like to create a situation where there protected host could withstand very high volume SYN attacks (in the order of hundreds of thousands of forged SYN packets per second), as well as fairly significant legitimate traffic volumes (hundreds of megabits).

	From what I've observed, if you have a host which uses ip_conntrack to track connections, and that host is under SYN flood conditions and has begun to send SYN cookies, connection table entries are created for these embryonic connections.

	This seems counter to the design intent of syn cookies, in that ideally, we would like to keep no state at all for TCP connections until the TCP handshake is completed.

It seems there's a couple of options:
a)  Abandon ip_conntrack (and all stateful iptables rules):   This seems to work, but it limits the scope of available rules.   I've also read some concerns about performance implications here.

b) (this is why I'm coming here):  Is there any way to defer ip_conntrack table population until the TCP initiator sends back their valid ACK packet with the SYN Cookie response?  This would seem to be the ideal solution, as it would retain the stateless intent of syncookies, but allow state tracking for more advanced iptables rules.

This seems like something others would have run into before, so I hope I've come to the right place for advice.

Thanks!

-SteveK


