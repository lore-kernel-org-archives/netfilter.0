From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: Best Practices for iptables
Date: Fri, 5 Dec 2003 10:40:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031205154012.GA23513@alcove.wittsend.com>
References: <BAY10-F59WC6BgBxfpG0000cde9@hotmail.com> <1070633501.10348.10.camel@raylinux.internal>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1070633501.10348.10.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2003 at 04:11:42PM +0200, Ray Leach wrote:
> On Fri, 2003-12-05 at 16:01, Gabby James wrote:
> > Hi,

> > I want to allow everything on eth1 and be selective on eth0.  What is t=
he=20
> > best way of handling unwanted packets?

> > A) Change the policy of the chain to DROP then allow what I want.  Exam=
ple:
> > iptables -P INPUT DROP
> > iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT


> > B) or leave the policy of the INPUT chain to ACCEPT but put REJECT rule=
s at=20
> > the end. Example:
> > iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
> > iptables -A INPUT -p tcp -m tcp -j REJECT
> > iptables -A INPUT -p udp -m udp -j REJECT
> > iptables -A INPUT -p icmp -j DROP

> > This will give me the same outcome won't it?
> No, none of your rules reference the interface, e.g -i eth0
> So your rules allow/reject on all interfaces.

	One HUGE difference between A and B is what's not seen in there
at all.  Not all protocols are tcp, udp, or icmp.  There's also things
like AH, ESP, SIT (aka IPv6), and GRE.  All of these things would be
blocked by A and will pass straight through B unempeded.  SIT, especially,
could be problematical since an attacker could simply set up and IPv6 over
IPv4 tunnel that will pass straight through your firewall and route
entire subnets out to the Internet.  With 6to4 (6over4 using the 2002::/16
TLA) they don't even need static IPv6 configurations.  If you let that
pass through, your IPv4 iptables won't even see tcp or udp in that
tunnel, all it will see is IPv4 protocol 41 (SIT/ipv6).  Even if you have
iptables6 loaded, it wont see tcp or udp on IPv6, because it's IPv4
protocol 41 and not seen by the IPv6 iptables at all.  So, either way,
that protocol has to be stopped or you may end up with IPv6 on your network
and never realize it or successfully filter it.

	Always remember...  There's more riding on the next layer up than
just tcp, udp, and icmp.  A lot more.  And what you don't know can come
back to bite you.

> > Thanks in advance!

> > _________________________________________________________________
> > Winterize your home with tips from MSN House & Home.=20
> > http://special.msn.com/home/warmhome.armx
> --=20
> --
> Raymond Leach <raymondl@knowledgefactory.co.za>
> Network Support Specialist
> http://www.knowledgefactory.co.za
> "lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
> Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
> --

	Mike
--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBP9Cm3OHJS0bfHdRxAQGKnAP/Xv0giwezWRbuvl0rrBnEHjjp1j/klDdS
tFVqpf+WDCUDd/UF57p3S8FZlzcH7/Ojp9fYdjJnggErr9WTsXX7GZ4nkPxXNa+4
QXaL+Pu09N43quxONtJ/XspUs4oQ7L6UKW+woWib8wz1qxk6sIDeYo9RK1FYesfR
ns3VO8u9MRk=
=pHtm
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

