From: Steve <steve@sheddy.net>
Subject: Re: Broken fwmark
Date: Mon, 3 Jun 2002 13:37:45 +0100 (BST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206031317001.24311-100000@shaun.sheddy.net>
References: <Pine.LNX.4.33.0206031218260.4553-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.33.0206031218260.4553-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.samba.org



On Mon, 3 Jun 2002, Jozsef Kadlecsik wrote:

> Actually, I'm surprised that at some time it worked.

So am I ;)

> What you want to achieve can be done by using Henrik Nordstrom's CONNMARK
> patch from patch-o-matic.

Thanks!! I've installed CONNMARK and got that working nicely.

In the following config I'm marking connections incoming on eth2 to ensure
replies go via eth2:-

iptables -A PREROUTING -i eth2 -t mangle -j CONNMARK --set-mark 1

Check if connmark is set and,if true, set the normal fwmark.
I assumed the mark connmark set was the standard one set by mark but this
doesn't seem to be the case?

iptables -A PREROUTING -t mangle -m connmark --mark 1 -j MARK --set-mark 1

Then take predefined route via eth2:-

ip rule add from 1.2.3.0/28  fwmark 1 table wan

This works nicely and allows my desktops to route their normal outgoing
traffic via the NAT'd broadband connection but also respond to requests
via the public routed subnet they sit on.

Steve.


