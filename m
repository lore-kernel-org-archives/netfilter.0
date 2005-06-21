From: "terry l. ridder" <artisticforge@gmail.com>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 03:24:44 -0500
Message-ID: <49bf7d705062101242489dd90@mail.gmail.com>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<Pine.LNX.4.58.0506210901510.3630@blackhole.kfki.hu>
	<49bf7d70506210021181593cc@mail.gmail.com>
	<Pine.LNX.4.58.0506210937090.3687@blackhole.kfki.hu>
Reply-To: "terry l. ridder" <artisticforge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0506210937090.3687@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

hello.

reply below.

On 6/21/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> On Tue, 21 Jun 2005, terry l. ridder wrote:
>=20
> >
> > On 6/21/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> > > On Mon, 20 Jun 2005, terry l. ridder wrote:
> > >
> > > > while i have reservations concerning posting the output of iptables=
-save
> > > > i have placed it on my web server:
> > > >
> > > > http://204.238.34.206/iptables-save-20jun2005.txt
> > >
> > > Thou salt not filter in the nat table.
> >
> > there is no good reason not to filter in the nat table.
>=20
> Your firewall setup is a perfect example why one should not filter in the
> nat table.
>

my firewall has worked for many years just the way it is, never had any
problems with any leaks of any kind.

>=20
> Look at the packets which "leaked in": all of them TCP RST packets.
>

yes, they are all tcp rst packets.

>=20
> According to the TCP connection tracking, a RST packet which belongs to n=
o
> known connection will be marked as INVALID. Because it's a NEW INVALID
> packet, connection tracking drops the conntrack reference immediately.
> Consequently, as having no conntrack reference attached to the packet, th=
e
> nat table skips processing it. And because you intentionally not filter i=
n
> the filter table, the packets "leak in".
>

there is not connection to track.

all packets from 200.0.0.0/8 with destination port 25 (smtp) are
dropped. the only addresses leaking in are the 200.0.0.0/8 with
destination port 25 (smtp). none of the other network address
blocks which are blocked are leaking.

if what you wrote above were true i should be seeing more tcp rst
packets from blocked network address blocks leaking in. i am not.
therefore, what you wrote above is not true.

>=20
> Thou salt not filter in the nat table.
>

will you please stop with the 'party line'.

>=20
> Best regards,
> Jozsef
>

--=20
terry l. ridder ><>

