From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: Packets Counting
Date: Thu, 17 Mar 2005 10:11:41 +0100
Message-ID: <1111050702.6949.2.camel@nostromo.bgsecm.com>
References: <423885E3.4000802@critical.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <423885E3.4000802@critical.com>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El mi=C3=A9, 16-03-2005 a las 14:15 -0500, Bill Chappell escribi=C3=B3:
> I do not have time this instant to share the code but the outline of
> a packet counter I use is to create chain MANGLE_ACTIVITY in -t mangle,
> add a rule that simply RETURNs to MANGLE_ACTIVITY, Insert a jump to the
> MANGLE_ACTIVITY chain in -t mangle PREROUTING (so it is the first chain
> hit by all incoming packets), use whatever matches, like --sport or
> --dport (remember to specify protocol with port matches) and/or an
> interface match.  Then, in a script (mine happens to be Perl), run
> "iptables -t mangle -nvL MANGLE_ACTIVITY" and pipe (|) it through grep
> to get the RETURN line with the packet count and pipe it through
> awk to pick off the packet count followed by
> "iptables -t mangle -Z MANGLE_ACTIVITY" to zero the counter,
> both in a loop with a sleep to get the interval (approximately).
>=20
> Hope this helps.
>=20
> Bill
>=20
> (Without deadlines, we'd live forever.)

If you have a lot of rules you have to watch the counters it's
better to do a little daemon that read the counters using
libiptc, because using bash or perl to read them it's too slow.

We have a daemon that do this called bastion-firewall-stats in
our bastion-firewall GPL firewall. Anyone interested can download
the source in our web site: http://www.bgsec.com/downloads.html

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



