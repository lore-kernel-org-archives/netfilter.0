From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: DNAT to a virtual IP problems
Date: Wed, 19 Feb 2003 01:02:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302190102.18012.netfilter@newkirk.us>
References: <20030218200300.GC15233@yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030218200300.GC15233@yahoo.com>
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
To: Stephen Mathezer <mathezer@yahoo.com>, netfilter@lists.netfilter.org

On Tuesday 18 February 2003 03:03 pm, Stephen Mathezer wrote:
> I am having some trouble with DNAT. For various reasons I am running a
> webserver that is listening on virtual IP addresses on the internal
> interface of my firewall.  I am trying to forward ports 80 and 443
> from the external interface to various virtual internals.  No matter
> what I do, packets never seem to show up on the virtual interfaces.

> eth0 is external
> eth1 is internal (192.168.8.1/24)
>
> I have tried using an address on the same subnet (192.168.8.22) as
> well as addresses on other subnets (192.168.3.22) for interfaces
> eth1:0, eth1:1 etc.  NAT'ing to another box on the internal LAN works
> fine, it is just NAT to the virtual that is broken.
>
> I am doing the DNAT as follows:
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to
> 192.168.8.22:443

> Tcpdump on eth0 shows traffic arriving, iptables doesn't log anything
> interesting, although I guess I don't have any logging configured in
> the nat table.  Tcpdump on eth1:0 never sees any packets arriving.

Try setting up a LOG rule first in each chain in filter and nat tables,=20
and in mangle table if you have it loaded.  (just for a few packets, not=20
too long)  What about tcpdump for eth1?

> I am permitting port 443 connections inbound on eth0. An identical
> configuration, except NAT'ing to another webserver on the LAN works
> fine, it is just NAT'ing to a virtual that doesn't work.

Hmmm.  You say you are accepting tcp 443 on eth0.  What about eth1?  That=
=20
is the physical interface the packets should appear 'from' when they hit=20
INPUT chain.=20

j



