From: hanxin <hanxin@mail.sc.cninfo.net>
Subject: Help for cut the nat connection.
Date: 15 Jan 2003 10:57:49 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042599499.343.36.camel@mobile_benny>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-E/rcJIBmk8UvF+QB4mJq"
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
To: netfilter <netfilter@lists.netfilter.org>


--=-E/rcJIBmk8UvF+QB4mJq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,
My prolem is I can't cut a established TCP connection through NAT.

Detail:
I have a Redhat linux 7.2 with default iptables(v1.2.3) installed. The
box has two ethernet cards, eth0(61.139.69.7) direct connect to internet
and eth1(192.168.0.1) is my intranet gateway.
I used this rule for NAT :
iptables -A POSTROUTING -o eth0 -j SNAT --to-source 61.139.69.7
and it worked fine.But for managment, I want to only allow authed client
can use NAT to internet.So I wrote a simple CGI and added some rules for
control NAT client.
The default rules like this:
iptables -t nat -A PREROUTING -d 192.168.0.1 -j ACCEPT
iptables -t nat -A PREROUTING -s 192.168.0.1 -j ACCEPT
iptables -t nat -A PREROUTING -d 61.139.69.7 -j ACCEPT
iptables -t nat -A PREROUTING -s 61.139.69.7 -j ACCEPT
iptables -t nat -P PREROUTING DROP
When a client login correct, my CGI adds a rule:
iptables -t nat -I PREROUTING -s <client_ip> -j ACCEPT
So the client can use NAT now. And if I delete this rule, the client
should not use NAT.
But I found if a client established a TCP connection like telnet, when I
delete the rule, the telnet connection is still active.
eg.:
The client 192.168.0.73 telnet to 61.139.69.11, then I delete its' nat
rule, if 192.168.0.73 has not exit form the telnet, he can still use
this telnet session.But he can't ping 61.139.69.11. Why?
How can I realy cut the client  NAT connection?
Maybe my method to control NAT is stupid. Any advice is welcome.
Thanks.

--=20

-hanxin


--=-E/rcJIBmk8UvF+QB4mJq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQA+JM4tyLEy9gLqsBsRAjjYAJsGmfcqHz+DW8+do3P2NQoQVbj2rQCgkLqX
09W9D/g9RihqwlxjeTSas6g=
=f/NC
-----END PGP SIGNATURE-----

--=-E/rcJIBmk8UvF+QB4mJq--


