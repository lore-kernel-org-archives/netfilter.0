From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not seeing injected packets traversing iptables
Date: Sun, 4 Jul 2004 14:15:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407041415.40900.Antony@Soft-Solutions.co.uk>
References: <e62310192.10192e623@euskalnet.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <e62310192.10192e623@euskalnet.net>
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
To: netfilter@lists.netfilter.org

On Thursday 01 July 2004 1:03 pm, JOSE MIGUEL MARTINEZ wrote:

> I am injecting packets in a network. I can see this packets from libpca=
p
> from several machines so the packets are there. The machine supposed to
> receive the packets can see them too in a tcpdump. Besides it answers t=
o
> some of them (syn/ack if I inject tcp syncs) so packets are arriving. T=
he
> tools I use to inject packets are packit, nemesis and others home-made =
over
> libnet. The problem is that in spite of packets being received they doe=
s not
> seem to enter iptables as I cannot LOG or ULOG them in destination mach=
ine.
> This does not happen with convencional traffic as pings or tcp connecti=
ons
> that can be logged normally.
> It seems to be a problem related to "artificially" injected traffic not
> reaching iptables. =BFIs conttrack or some part of iptables realising t=
his
> packets are not legal enough to reach iptables?

Sounds very much like it to me, yes.

I would say it's probably just the normal TCP/IP stack in the Linux kerne=
l,=20
not specifically netfilter, which is rejecting the packets.   Most likely=
=20
cause would be a checksum error, I'd guess.

Try capturing a real packet using tcpdump or ethereal (one which comes fr=
om a=20
normal machine and is accepted and processed normally), then try to gener=
ate=20
a fake version of the same packet, and look at the difference between the=
 two=20
tcpdump outputs - that should show you what's not right about the artific=
ial=20
packets.

Regards,

Antony.

--=20
In Heaven, the police are British, the chefs are Italian, the beer is Bel=
gian,=20
the mechanics are German, the lovers are French, the entertainment is=20
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is Americ=
an,=20
the mechanics are French, the lovers are Swiss, the entertainment is Belg=
ian,=20
and everything is organised by the Italians.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


