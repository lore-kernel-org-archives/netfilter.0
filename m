From: Akolinare@gmx.net
Subject: Re: two negatived parameters
Date: Mon, 6 Sep 2004 13:48:55 +0200 (MEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <5943.1094471335@www56.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

> I take it to mean that packets from host2 to host 3 were NOT accepted by
this=20
> rule? ... What do the counters for the rule say? ( iptables -L -n -v -x=20
).

yes, I already look after the counter. A paket from host2 to host3 dont
increase the counter.=20

> What other rules exist that might affect said packets? -- I note the above
is =20
> an ADD.  Could rules farther up the FORWARD chain have already=20
> accepted/denied the said packets?

this was only a example. I tested also on a other pc, with has normal no
rulesset to be sure.

> FYI -- I just tested this by inserting a double negative rule in my
firewall=20
>=20
> iptables -I tcp_packets -p tcp -s ! {internal_lan} -d ! {internal lan ip}=
=20
> --dport 25 -j allowed=20
>=20
> and sending myself an email from outside.  The packet counter incremented=
=20
> appropriately.

Sorry, but why are you able to send with this rule a mail from outside to a
mailserver in your internal network? I suppose, that with the "-d !
{internal lan ip}" it ist not possible to send a paket to your mailserver.

> well... my two cents :-)
>
> iptables -A FORWARD -s host1 -d host2 -j DROP

well sorry it is not that easy as it seems. The rule should forward pakets
to a user-chain only if host1 ist not the source and host2 are is not the
destination.

I also tested with the 2.6.7 kernel and 1.2.11, so I can exclude this.

--=20
Superg=FCnstige DSL-Tarife + WLAN-Router f=FCr 0,- EUR*
Jetzt zu GMX wechseln und sparen http://www.gmx.net/de/go/dsl


