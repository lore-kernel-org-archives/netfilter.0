From: "Didier Hung Wan Luk" <DidierH@frci.net>
Subject: XMAS and NMAP scanning.... With default rules dropping all packets
Date: Sat, 14 Dec 2002 13:09:53 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39778BFB9C25BA429794B15B50AEC78104EAA0@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi people,

I was wondering whether I really need to include these rules if I am
already using a default rule of DROP for INPUT, OUTPUT and FORWARD
chains.

Default rule:-
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

Do I really need these rules? To protect me from these scans..

iptables -I FORWARD -p tcp --tcp-flags ALL ALL -j DROP
iptables -I INPUT -p tcp --tcp-flags ALL ALL -j DROP

#nmap NULL-Packets drop
iptables -I FORWARD -p tcp --tcp-flags ALL NONE -j DROP
iptables -I INPUT -p tcp --tcp-flags ALL NONE -j DROP


Thanks,

Didier
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (MingW32)

iD8DBQE9+vVhH0p2xGbWNGwRAqebAJ9qQqpvAY0wZ50NqiaaW51HyQHLGwCePEAo
NPYRxMYonG0SWe0GzKiNb3M=3D
=3DbEjK
-----END PGP SIGNATURE-----


