From: "Matthew G. Marsh" <mgm@paktronix.com>
Subject: Re: Packet chain traversals
Date: Thu, 31 Oct 2002 10:55:06 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0210311044410.18355-100000@netmonster.pakint.net>
References: <200210301722.g9UHMEe12082@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210301722.g9UHMEe12082@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Wed, 30 Oct 2002, Antony Stone wrote:

> On Wednesday 30 October 2002 4:11 pm, Matthew G. Marsh wrote:
>
> > > The only thing I can think of is "which interface should this packet go
> > > out of", however that's certainly not the same sort of "decision" as
> > > there is between PREROUTING and INPUT or FORWARD, and I'm not even sure
> > > it belongs quite where it is shown...
> >
> > It does exist between OUTPUT and NAT. But the decision structure is more
> > along the lines of rule application. Thus you can issue rules such as:
> >
> > ip rule add from 10.1.1.1 dev lo table mytable prio 13000
> >
> > and any packet coming from the local machine (ie exiting OUTPUT) would
> > then be acted upon by this rule. see?
>
> Fair enough, but I still don't think this is any sort of decision which
> affects netfilter (which would be the only point of putting it into the
> diagram, I think).
>
> The only decisions of interest to netfilter are "is the packet local ?" and
> if not "which interface is it going out of ?".   Both of those have already
> been decided in the first routing decision, between prerouting and input /
> forward.

Not completely true. fe: if the rule above takes affect then a packet may
have its outbound interface, source address, and next hop all changed by
the contents of table mytable. Illustrate by issuing the following:

ip rule add from 10.1.1.1 dev lo prohibit

This will prohibit all packets source addressed with 10.1.1.1 from leaving
the box. They are basically dropped no matter what your iptables settings
are. So if your eth0 internal network interface is addressed as
10.1.1.1 and you try to issue any ipv4 command from your firewall box it
will simply never leave. You could also try the following rule route
combo:

ip rule add from 10.1.1.1 dev lo table 1 prio 2

ip route add blackhole 11.1.1.0/24 table 1

This combo will simply drop any packet with internal source address
10.1.1.1 destined to 11.1.1.0/24 network. And iptables will never know.

You do need to see that the RPDB for IPv4 under Linux has several effects
upon the iptables structure. fe you can use FastNAT to change both source
and destination addresses of a packet from your box without the iptables
framework ever knowing. Such a change can really screw up your rules
unless you understand what happened.

ok?

> I'm not convinced there's any purpose in having another routing decision
> shown between output and postrouting, especially in a document which is aimed
> at beginners.
>
> Regards,
>
> Anton.
>
> --
>
> Success is a lousy teacher.   It seduces smart people into thinking they
> can't lose.
>
>  - William H Gates III
>

--------------------------------------------------
Matthew G. Marsh,  President
Paktronix Systems LLC
1506 North 59th Street
Omaha  NE  68104
Phone: (402) 932-7250 x101
Email: mgm@paktronix.com
WWW:  http://www.paktronix.com
--------------------------------------------------


