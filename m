From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: 2 ISPs on firewall
Date: Wed, 3 Jul 2002 12:12:51 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1E3@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Matthias Kattanek' <mattes@mykmk.com>
Cc: netfilter@lists.samba.org

that's exactly right.. connection tracking.. meaning the ports connections,
but the path it came from all depends on it's routing so as long as the
packet arrives it knows the connection it's for..

You need something like using the TOS value for minimise-cost and routing
that to the other link... so it works like a redundant link and doesn't go
through the other because it thinks it costs the earth to go that way..
iproute2 might be able to help here but never done it..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Matthias Kattanek [mailto:mattes@mykmk.com]
Sent: Wednesday, 03 July 2002 11:54 AM
To: netfilter@lists.samba.org
Subject: 2 ISPs on firewall



There seems to be lots of question about multihomed firewall/routers.
I am in similiar situation. Having 2 ISP, where to provide services too.

I managed to forward traffic to e.g. a web server in the DMZ zone.
Main problem I encounter is that the response is always going out
via the DEFAULT gateway on the router.
(In my case one ISP doesn't like it and drops the response.)

I was under the impression that connection tracking of Netfilter keeps 
"track" which interface the traffic came in and anticipated it would go 
out the same route it came from.

What am I missing here?
What does it take to make it happen?
Do I just need additional rules for Netfilter?
Would something like "ip_conntrack_isp" work out? Understood such module
needs to be developed. Q just arises is that a way to go?

mattes


