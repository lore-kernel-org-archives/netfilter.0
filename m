From: Shri Shrikumar <shri@urbyte.com>
Subject: Help setting up a firewall on a machine
Date: 15 May 2003 12:35:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052998517.1355.61.camel@VISHNU.INTERNAL>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-d0eP0tNqMhbhZq7SC7e2"
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


--=-d0eP0tNqMhbhZq7SC7e2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I am just configuring a machine and would like to setup a firewall on it
using iptables. I am keen on setting up properly on the first go since I
dont want to be left with a machine that I cant ssh into.

The machine has just one nic eth0 which is connected to the net. There
is not NAT or MASQ to be done

Here is what I have so far.

/sbin/iptables -N block
/sbin/iptables -A block -p ICMP -j ACCEPT
/sbin/iptables -A block -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A block -j DROP

/sbin/iptables -A INPUT -j block
/sbin/iptables -A FORWARD -j block

What rules do I need to add to the block chain to allow any new
connections from machine to the outside world ? would it just be

/sbin/iptables -A block -m state --state NEW -o eth0 -j ACCEPT

I am also going to be hosting a site, so the following rule will be
added as well,

/sbin/iptables -I block -p tcp --dport 80 -j ACCEPT


Do these rules sound about right ?


Thanks and regards,



Shri
--=20
------------------------------------------------------------------------
Shri Shrikumar       U R Byte Solutions           Tel:   0845 644 4745
I.T. Consultant	     Edinburgh, Scotland          Mob:   0773 980 3499
                     Web: www.urbyte.com          Email: shri@urbyte.com

--=-d0eP0tNqMhbhZq7SC7e2
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+w3t1BqoC2HdbEIcRApZxAKCcnsgYPOQ84En/AqImyYSbFEApGwCgv+0+
8xT/clAh8Ajd5sqAOj23KRg=
=wcDU
-----END PGP SIGNATURE-----

--=-d0eP0tNqMhbhZq7SC7e2--


