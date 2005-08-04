From: =?ISO-8859-1?Q?Ricardo_J=2E_M=E9ndez?= <mendezster@gmail.com>
Subject: Re: IP forwarding
Date: Thu, 4 Aug 2005 12:42:32 -0600
Message-ID: <286cf082050804114220fcca1f@mail.gmail.com>
References: <286cf082050803183749d1f514@mail.gmail.com>
	<200508040415.j744FBjF040033@fenyo.mail.t-online.hu>
	<5d2f3791050803220225ab8670@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Ricardo_J=2E_M=E9ndez?= <mendezster@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f3791050803220225ab8670@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

> > The roule should look like this:
> >
> > iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT
> > --to-destination 192.168.1.202
>=20
> Actually, I believe that --to is a valid unique prefix for
> --to-destination.  The fact that it didn't flag as a syntax error
> supports this.

Agreed.  Webmin's IPTables interface displays the rule properly as
well, so --to is a valid substitute.

> The problem is that locally generated packets (from the firewall
> itself) to 1.2.3.4 never pass through filter.PREROUTING. =20

But I 'm testing this from a desktop on the network, not the firewall
itself. PREROUTING should apply to those packets, correct?


> Each
> forwarded port may need up to four rules to NAT all access.  The
> script I use (at http://www.curby.net/doc/curbywall ) is an example of
> using all four, though it may be difficult to understand. =20

From what I can see from the script, besides creating 1 PRE DNAT and
up to 2 POST SNAT rules (one for the internal network and one for the
de-militarized zone),  cw_forwardin is creating also an OUT rule for
the destination IP.    It also seems that the SNAT rule for the
internal network is using the ip address for the iptables machine as
the source.

Assuming that last one is correct, would that still be the IP address
used for SNAT on the scenario I'm faced with?  IE, doing DNAT/SNAT for
a machine internal to the network, redirecting to it the requests that
come from our network to a web server outside of it.

(Am I missing something?  It's a bit difficult to read, now having
that much experience with bash scripts)


>=20
> Other folks here are proponents of running a local DNS server so you
> don't have to do such NAT contortions.

Indeed, it's an approach we considered, but we need this to work with
some internal apps that access the IP address directly.

Thanks,



Ricardo J. M=E9ndez
http://ricardo.strangevistas.net/

