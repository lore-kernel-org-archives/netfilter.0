From: "Alexander W. Janssen" <yalla@ynfonatic.de>
Subject: Re: Re2: How to block all ports except port 21,22,80,8080 ???
Date: Tue, 18 Feb 2003 20:51:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030218195104.GC23914@ynfonatic.de>
References: <1045555939.94722.jacob_chan@so-net.net.tw> <1045558628.1967.29.camel@kermit.spenneberg.de> <1045560648.1913.39.camel@kermit.spenneberg.de> <3E5207B9.7C2BEDFA@patrick.at> <20030218160348.GA23914@ynfonatic.de> <20030218121919.GA11554@omega.lacnic.net.uy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030218121919.GA11554@omega.lacnic.net.uy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Pablo Allietti <pablo@lacnic.net>
Cc: netfilter@lists.netfilter.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 18, 2003 at 03:19:19PM +0300, Pablo Allietti wrote:
> who is the line to permit all inside to outside??

None of them. You got to differ between to different topics: The traffic
originating on the firewall itself and the forwarded traffic.

If traffic originates on the firewall it will leave the machine through the
OUTPUT chain. Traffic which is destined for the firewall itself will enter =
the
machine through the INPUT chain. This is what you did. To be correct, there=
 is
a problem: Even if you allow traffic leaving the box through the OUTPUT cha=
in,
you have to permit the answers to that traffic to *enter* the firewall agai=
n.
Therefore you should include that line into you firewall-skript, preferably=
 as
the first statement in the INPUT-chain, since is the most used rule ever:

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

Explaining that rule is somewhat beyond the scope of this email, but i sugg=
est
you reading one of the tutorials at [1].

Traffic which is forwarded by the firewall is filtered in the FORWARD chain.
So, for example, if your internet-interface is eth0 and your internal
interface is eth1 and you just want to allow the internal machines accessing
the ouside world, you would to something like that:

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -p tcp -j REJECT --reject-with tcp-reset # everything e=
lse
iptables -A FORWARD -j REJECT # reject everything else
                              # with icmp-port-unreachable
# implicit DROP due to policy happens here

Alex.



[1] http://www.netfilter.org/documentation/index.html

--=20
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so litera=
l."
Instructions for use of this post: Insert tounge in cheek. Read as normal.

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iEYEARECAAYFAj5SjqgACgkQEMMZKORQoYKh/ACeNpzLUUzKcQXRNgh9x/KeW/j3
0K8Anj8Or77VkFVcPeg1w7vPukgyj1dc
=vbvy
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--

