From: "David H. Askew" <daskew2@kc.rr.com>
Subject: firewall host problem
Date: Sun, 19 Oct 2003 16:44:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066599867.1536.10.camel@lappy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5XuKjUTpx9bP1SzF/8Y2"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-5XuKjUTpx9bP1SzF/8Y2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


ok .. so 'I'm trying to setup my first iptables firewall .. and I've got
a semi functional setup so far ... but I do have one small problem .. my
firewall machine .. which is performing NAT for my home network.. cannot
access the Internet with any standard tools ... tracepath .. ping ..
etc.  I know network connectivity is fine .. because my internal
machines function properly.

My router/firewall has 3 interfaces ....
	eth0: ISP
	eth1: Home Subnet 1
	eth2: Home Subnet 2

eth2 can ping my ISP gateway=20
eth1 can ping my ISP gateway=20
eth0 can not ping my ISP gateway=20


my firewall script is below  ...

I've recently switched from an ACCEPT default policy to the DROP default
policy below.  I didn't have this problem previously, so I know i'I've
just forgotten to allow something .. but I'm having trouble coming to a=20
logical conclusion ....

...any help .. critique ... advice you could provide would be helpful

-dave


iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain


# Enable packet forwarding in the kernel
echo 1 > /proc/sys/net/ipv4/ip_forward=20

# Setup IP FORWARDing and Masquerading
iptables --table nat --append POSTROUTING --out-interface eth0 -j
MASQUERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT
iptables --append FORWARD --in-interface eth2 -j ACCEPT


#enable connection tracking
iptables -I FORWARD -m state --state INVALID -j DROP
iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp -i eth0 -s 0/0 -d 0/0 --dport 22 -j ACCEPT
iptables -A INPUT -p udp -i eth0 -s 0/0 -d 0/0 --dport 22 -j ACCEPT

iptables -A INPUT -p tcp -i eth2 -s 0/0 -d 0/0 --dport 22 -j ACCEPT
iptables -A INPUT -p udp -i eth2 -s 0/0 -d 0/0 --dport 22 -j ACCEPT

iptables -P INPUT DROP


--=20
How many Microsoft engineers does it take to change a light bulb ?

Answer : None, they just declare darkness a new standard.=20


--=-5XuKjUTpx9bP1SzF/8Y2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/kwW7y2JQXGULrAERAt/qAJ9CJTsSGmQfdtwnDZXVEZe18UITeACfaoFv
sMmls5tcgePEftF/YGpGVa8=
=O0ML
-----END PGP SIGNATURE-----

--=-5XuKjUTpx9bP1SzF/8Y2--


