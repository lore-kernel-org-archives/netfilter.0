From: "Demetrios J. Tsillas" <jtsillas@appledor.net>
Subject: net POSTROUTING with NFQUEUE
Date: Wed, 23 Dec 2009 13:22:04 -0500
Message-ID: <c9945ec95a5bdea1b2e3bfbcb4849de8.squirrel@www.appledor.net>
Reply-To: jtsillas@appledor.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am attempting to implement a transparent TCP proxy which can delay the
sending of SYN,ACK back to the local client machine until the internet
side server acknowledges the connection.

This is to allow correct operation of TCP services which rely on rejected
connections from the server.

I've got NFQUEUE working with a rule such as (eth1 is my local device):

iptables -t mangle -A POSTROUTING -p tcp --tcp-flags SYN,ACK SYN,ACK -o
eth1 -j NFQUEUE --queue-num 0

The problem is that if I combine the above rule with a NAT rule to
implement the redirection of TCP to my proxy, the packet headers which
arrive in the queue contain the source IP-address/port of the proxy rather
than the internet server's source IP-address/port. Matching the connection
with out the server's info is not reliable.

I've tried putting the above rule on the nat table but I get no matches.

Is there some way to get what I need?

My only other option is to separately track the local's client's source
IP-address/port and try to match up the SYN,ACK packets using that
information.

thanks!!!!
-Jim.


