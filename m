From: alexb@atix.com.br
Subject: Re: Multiple Internet Providers
Date: Mon, 24 Mar 2003 18:32:23 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048541543.3e7f796777cee@www.spsul.com.br>
References: <200303232036.52953.kimj@dawn.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303232036.52953.kimj@dawn.dk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Kim Jensen <kimj@dawn.dk>
Cc: netfilter@lists.netfilter.org

I have similar problem. Did you got it working ?

I used --set-mark in PREROUTING and setup a routing table for the Arcor
connection then used SNAT for packets from internal net going thru the Arco=
r, so
I got replys ok, but I couldn't make incoming connections thru QSC get repl=
yed
to QSC connections, since --set-mark in PREROUTING also mangles that replay=
s and
so the routing tryies to sent them thru Arcor. I couldn't use ESTABLISH,REL=
ATED
since in both situations a meat this conditions.
I couldn't try it now, but I think that the connmark modul could solve the
problem, since it seams to be able to restor a mark based on connection
tracking, so I guess I could mark connections from QSC and then restore this
mark on replay to that connections and use this mark to route them back to =
QSC.

If someone could test this or knows how to connect to 2 ISPs please let me/=
us
know how to set it up.

Alex

C=F3pia Kim Jensen <kimj@dawn.dk>:

> Hi all,
>=20
> After having gnawed myself through tons of docs, having discussed this
> problem=20
> on the Linux Advanced Router & Traffic Control mailinglist, I am simply
>=20
> beginning to be desperate.
>=20
> My problem is as follows; I have 2 internet providers, QSC & Arcor. QSC
> is a=20
> fast connection where we have 32 static IP addresses which should be
> mapped=20
> to our 32 internal machines. Arcor is a cheap flatrate, where we wish to
> see=20
> all our traffic running. I have set up a routing so using --set-mark, I
> can=20
> tell the routing system which route to pick by using an fwmark rule.
>=20
> The way we wish to have the system working is rather simple, all traffic
>=20
> should go via the Arcor, only mail should go via the QSC. All incoming
>=20
> traffic for the QSC should of course be answered.
>=20
> To match the setup, I'm trying two things; First to make external
> connections,=20
> and second, to make internal connections.
>=20
> When making an external connection, the packets passes through the
> firewall,=20
> enters my internal server, and is being replied correctly, but then when
> it=20
> hits the firewall it gets lost!
>=20
> When making an internal connection, the packet hits the external server,
> an=20
> ack comes back and I receive this, but when sending anything after the
> first=20
> ack (initial reply), it gets lost as above!
>=20
> My problem seems tobe lying in the connection tracking, which simply
> doesn't=20
> work properly. I have a rule for all packets arriving on the QSC
> interface=20
> that they should have their destination rewritten to the internal net,
> this=20
> works fine, but when apparently I'm making a mistake somewhere.
>=20
> Instead of showing my embarassing attempts of setting up a set of
> sensible=20
> iptable rules, can anyone please give me a hint to what I have to do?
>=20
> /Kim
>=20
>=20

