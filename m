From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 14:36:42 -0500
Message-ID: <49bf7d7050620123646910d40@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
	<49bf7d70506201020643ab165@mail.gmail.com>
	<200506201329.19701.rob0@gmx.co.uk>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506201329.19701.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

hello;

reply below.

On 6/20/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Monday 20 June 2005 12:20, terry l. ridder wrote:
> > > Yikes, this is very long. First, I see that you're doing all your
> > > filtering in nat, PREROUTING and POSTROUTING. Why?
> >
> > because that is the way i know that works.
>=20
> Again I doubt you know exactly what it is doing.
>

no one can know exactly what it is doing given all the variables that
may effect what iptables is doing.  unknown bugs in the linux kernel
and/or iptables. memory hiccups. cpu hiccups. random bit flips.

having observed the behaviour of the linux kernel and iptables i
have a reasonable expectation of what they are doing.

>
> For instance in your
> lonely filter table, FORWARD rules there are 3 rules which do nothing
> at all ... ACCEPT targets, when the policy is ACCEPT. (They do packet
> counting which is limited by the "limit" module, so even the packet
> counters are meaningless.)
>
>=20
> > it has worked fine for many years.
>=20
> Luck.
>

there is no such thing as luck.

>=20
> > it was not until i upgraded the
> > firewall machine (new computer with debian sarge) that iptables
> > began to leak.
> >
> > > I prefer to do filtering in the filter table as $DEITY intended. :)
>=20
> For me that is more or less a matter of faith. I hope someone who knows
> more about it will come along and explain why your NAT use is poor
> design. In the meantime I bet a few external nmap's of your IP would
> give you some unpleasant surprises.
>

you have my permission to nmap my network, 204.238.34.0/24.
you must post the results of nmap here.

do you have anything to contribute besides sniping at the manner in
which i run and manage my network?
=20
>
> > <major sniip>
> >
> > one of the reasons for using table nat is to dnat all ip addresses
> > with destination port 25 (smtp) to the mail server, 204.238.34.206.
>=20
> I'd do that with a single DNAT rule,  have a single SNAT rule to let the
> internal mail server out, and do my filtering in filter / FORWARD. It
> also seems odd that you are using NAT at all, since the mail server
> already has a real Internet IP. I only use NAT with RFC 1918 addresses.
>

because the spammers, scammers, and other scum keep hammering
my network trying every address in 204.238.34.0/24 destination port 25.

>=20
> > connection tracking is turned off since at one time i was
> > using tarpit instead of just dropping the connections.
>=20
> Whatever. Without connection tracking you might as well use ipchains.
>

the tarpit howto does say to turn connection tracking off.

>=20
> > i have added logging on both the firewall box, 204.238.34.232, and
> > the mail server, 204.238.34.206. both boxes will be logging the
> > leaks.
>=20
> Please do followup with the results; I will be interested to see what
> packets are getting through.
>

i will post the results.

>

--=20
terry l. ridder ><>

