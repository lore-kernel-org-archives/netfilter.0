From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ip accounting Help
Date: Wed, 23 Jun 2004 12:41:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231241.29378.Antony@Soft-Solutions.co.uk>
References: <1087962571.2041.10.camel@joel.d2visp.com> <200406231001.24925.Antony@Soft-Solutions.co.uk> <1087988244.2036.60.camel@joel.d2visp.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087988244.2036.60.camel@joel.d2visp.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 23 June 2004 11:57 am, Joel wrote:

> On Wed, 2004-06-23 at 14:31, Antony Stone wrote:
> >
> > Beware of trying to do this if you are using the stateful connection
> > tracking of netfilter (iptables -I FORWARD -m state --state
> > ESTABLISHED,RELATED), because if you are, then almost all of the packets
> > going through the machine (specifically, all except the first one of each
> > connection) will be processed by this one rule, and all the other rules
> > in the FORWARD chain will only see one packet per connection (the first
> > one).
> >
> > You may be able to do what you want using the mangle table of the FORWARD
> > chain, but not with the default filter table.
>
> Yes I am using stateful connection tracking of netfilter ( iptables -I
> FORWARD -m state --state ESTABLISHED,RELATED)
> So as per you i have used FORWARD chain in MANGLE table like this.
>
> # iptables -t mangle -i eth1 -A FORWARD -s 10.1.1.24/29 -j ACCEPT  ---> I
> think for Download traffic  ---> M I right ?
> # iptables -t mangle -i eth0 -A FORWARD -d 10.1.1.24/29 -j ACCEPT  ---> I
> think for Upload traffic ----> M I right ?
>
> This is the output of 
> # iptables -t mangle -nvL FORWARD
>
> Chain FORWARD (policy ACCEPT 1747K packets, 318M bytes)
>  pkts bytes target     prot opt in     out     source             
> destination
> 1068 91499 ACCEPT     all  --  eth1   *       10.1.1.24/29         0.0.0.0/0
>  148 26923 ACCEPT     all  --  eth0   *       0.0.0.0/0           
> 10.1.1.24/29
>
> Antony i have lot of other ip address but i have created only this subnet
> for mangle table for testing.
> Traffic bytes are passing through this.
> So is the correct method ?
> Will be the bytes over here are accurate ???

The byte counts will be accurate, yes, and you have the correct idea about 
using -s a.b.c.d and -d w.x.y.z to capture traffic to and from particular IP 
addresses.

The thing I suggest you change, though, is not to have a -j ACCEPT at the end 
of your rules - just let all the packets flow right through the mangle table, 
with the rules simply counting them as they go past.

In other words, don't do:

iptables -t mangle -i eth1 -A FORWARD -s 10.1.1.24/29 -j ACCEPT

Just do:

iptables -t mangle -i eth1 -A FORWARD -s 10.1.1.24/29

The packets will still get counted just the same.

The reason for this advice is that the filter table is for filtering; the nat 
and mangle tables are not.   Therefore you shouldn't use targets like ACCEPT, 
DROP, etc (which are filtering operations) anywhere except the filter tables.

Regards,

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


