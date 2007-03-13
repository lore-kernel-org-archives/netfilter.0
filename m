From: Giovanni Lovato <giovanni.lovato@aldu.net>
Subject: Matching packets by HTTP header "Host"
Date: Tue, 13 Mar 2007 11:47:53 +0100
Message-ID: <45F68159.5040606@aldu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all.
I'm trying to forward packets to different hosts depending on the "Host"
header in HTTP packets, e.g. packets on port 80 requesting "Host:
one.example.org" to 192.168.0.1 and all other on port 80 to 192.128.0.2.
I did:

iptables -t nat -A PREROUTING -p TCP -i eth0 -m string --algo bm
- --string "Host: one.example.org" --destination-port 80 -j DNAT
- --to-destination 192.168.0.1

iptables -t nat -A PREROUTING -p TCP -i eth0 --destination-port 80 -j
DNAT --to-destination 192.168.0.2

But all packets are going to 192.168.0.2. Do I miss something?

Regards,
G.L.
- --
www.aldu.net/~heruan
giovanni.lovato@aldu.net
ldaps://pgpkeys.aldu.net
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFF9oFZaWLXrn9dopwRAjfbAKCAyWaZ5h/1w9Bvaj5aOhmsj0GIgACfXbbM
l3+Z0tatK47gMv7iMANg6u4=
=LAJU
-----END PGP SIGNATURE-----

