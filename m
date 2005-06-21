From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 09:36:34 -0500
Message-ID: <49bf7d705062107362321dee6@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201329.19701.rob0@gmx.co.uk>
	<49bf7d70506201347749fdeed@mail.gmail.com>
	<200506210717.47018.rob0@gmx.co.uk>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506210717.47018.rob0@gmx.co.uk>
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

On 6/21/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
> On Monday 20 June 2005 15:47, terry l. ridder wrote:
> > > In the meantime I bet a few external nmap's of your IP would
> > > give you some unpleasant surprises.

you made the above comment did you not?
you implied that my network was not secured.

> >
> > you lose the bet.
> > since you did not have the courage to post the results of an nmap of
> > my network, i will.
> >
> > please see http://uuoc.com/?id=3D953 for the results of an external
> > nmap of my network, 204.238.34.0/24.
>=20
> Lack of courage, lack of interest, lack of will to be your unpaid
> security analyst, whatever. It's remarkable that you found that nmap
> acceptable, neither unpleasant nor surprising.
>

i see, yet you make unfounded statements which i quote below:

> > > In the meantime I bet a few external nmap's of your IP would
> > > give you some unpleasant surprises.

>=20
> You certainly have won your arguments! People point to specific
> documented examples of why you're wrong, and you insist otherwise.
> Indeed I am convinced: writing to you is a waste of my time. Your
> arguments have been very persuasive in that regard.
>=20

you should really read the Iptables Tutorial 1.1.19 written by
Oskar Andreasson located at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

since you may not read it, i will quote a few  parts.

<begin quote>
6.2. Tables

The nat table is used mainly for Network Address Translation. "NAT"ed
packets get
their IP addresses altered, according to our rules. Packets in a stream onl=
y=20
traverse this table once. We assume that the first packet of a stream
is allowed.
The rest of the packets in the same stream are automatically "NAT"ed or=20
Masqueraded etc, and will be subject to the same actions as the first packe=
t.=20
These will, in other words, not go through this table again, but will
nevertheless be
treated like the first packet in the stream.
<end quote>

did you catch that last sentence? since the the first packet in the stream =
is
dropped the rest of the packets in the same stream are also dropped.

<begin quote>
This is the main reason why you should not do any filtering in this
table, which we
will discuss at greater length further on. The PREROUTING chain is
used to alter
packets as soon as they get in to the firewall. The OUTPUT chain is used fo=
r=20
altering locally generated packets (i.e., on the firewall) before they
get to the
routing decision. Finally we have the POSTROUTING chain which is used to al=
ter=20
packets just as they are about to leave the firewall.
<end quote>

7.2.10. PREROUTING chain of the nat table

The PREROUTING chain should not be used for any filtering since, among
other things, this chain is only traversed by the first packet in a
stream. The PREROUTING chain should be used for network address
translation only, unless you really know what you are doing.


--=20
terry l. ridder ><>

