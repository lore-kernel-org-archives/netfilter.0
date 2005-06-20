From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 18:04:16 -0500
Message-ID: <49bf7d70506201604581683e0@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<Pine.LNX.4.62.0506202125290.28510@mercury.sdinet.de>
	<49bf7d705062013236f4e105a@mail.gmail.com>
	<Pine.LNX.4.62.0506210019551.2906@mercury.sdinet.de>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.62.0506210019551.2906@mercury.sdinet.de>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: netfilter@lists.netfilter.org

hello;

reply below.

On 6/20/05, Sven-Haegar Koch <haegar@sdinet.de> wrote:
> On Mon, 20 Jun 2005, terry l. ridder wrote:
>=20
> > On 6/20/05, Sven-Haegar Koch <haegar@sdinet.de> wrote:
> >> On Mon, 20 Jun 2005, terry l. ridder wrote:
> >>
> >>>>> one example of the leak is below:
> >>>>>
> >>>>> 200.0.0.0/8 is dropped if the destination port is 25 (smtp).
> >>>>
> >>>> iptables-save(8) output, please. What you posted here doesn't tell u=
s
> >>>> much.
> >>>>
> >>>
> >>> while i have reservations concerning posting the output of iptables-s=
ave
> >>> i have placed it on my web server:
> >>>
> >>> http://204.238.34.206/iptables-save-20jun2005.txt
> >>
> >> You are filtering in the nat table.
> >>
> >
> > yes, i am.
> >
> >> The nat table gets only the first packet from each connection (the one
> >> that would match -m state --state NEW).
> >>
> >
> > that is incorrect. the nat table is getting all packets.
>=20
> no, it's not.
>

no, that is incorrect.

>=20
> please have a look at "man iptables":
>=20
>      nat:
>            This  table  is  consulted  when a packet that creates a new
>            connection is encountered.  It consists of three  built-ins:
>            PREROUTING  (for  altering packets as soon as they come in),
>            OUTPUT (for altering locally-generated packets before  rout-
>            ing),  and  POSTROUTING  (for  altering  packets as they are
>            about to go out).
>

there is no connection, netfilter or tcp.
any packets from 200.0.0.0/8 with destination port 25 (smtp) are
dropped, end of story. they are being dropped in nat prerouting.
they are not source nat'ed or destination nat'ed, they are dropped.
there is no connection, netfilter or tcp, ever established.

>=20
> Note the "is consulted when a packet that creates a new connection is
> encountered" - once for every new connection, not for all following
> packets.
>=20

again there is no connection. they are dropped before any connection,
netfilter or tcp, can be established.

>=20
> >> A retransmit from the blocked IP will not be a new connection,
> >> so it will pass through your rules.
> >
> > again this is incorrect.
>=20

see above, your logic is flawed.

>=20
> no - once a connection entry in /proc/net/ip_conntrack is created, a
> restransmit will match this entry even if it's a tcp-syn again.
>=20
> netfilter-connections are different from tcp connections.
>=20

it does not matter whether they are different or the same. there
is no connection, netfilter or tcp. the packets are being dropped in
nat prerouting before any type of connection can be established.

>=20
> >> And on your comment to another mail that you are not using connection
> >> tracking:
> >> This is wrong. If you have the nat table, you must have ip_conntrack
> >> loaded - and if its loaded it tracks your connections, even if you
> >> dont use -m state at all. There is no iptables nat without connection
> >> tracking.
> >
> > i may have been looking at the wrong window, i will check on that.
>=20
> thr textfile referenced your other mail contains IP_NF_CONNTRACK=3Dm for
> your firewall - connection-tracking is at least built.
>=20
> And if you load the nat support (aka iptable_nat module) the ip_conntrack
> module will be loaded, too.
>=20

yes it it. so what?

from the firewall box:
Module                  Size  Used by
ipt_LOG                 7008    1=20
af_packet              21316  0=20
ipt_limit                 2848    3=20
iptable_nat            27780  1=20
ip_conntrack         46928  1 iptable_nat
iptable_filter          3264    1=20
ip_tables               17712  4 ipt_LOG,ipt_limit,iptable_nat,iptable_filt=
er

<snip>

i said i looked at the wrong window and i corrected that mistake.

>=20
> c'ya
> sven
>=20

--=20
terry l. ridder ><>

