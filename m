From: Christian Parpart <cparpart@surakware.net>
Subject: Anti-DoS protection
Date: Sun, 2 Jun 2002 16:15:17 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206021615.22846.cparpart@surakware.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

I think about implementing a rule chain that protects me against DoS atta=
cks.=20
Well, I think that this may be done by putting all source addresses havin=
g=20
more SYN packets send to me than normally (e.g. 60 syn-packets maximum).=20
Every host sending more syn packets a minute should be dropped since then=
=20
completely by putting its address into a special pool. Then all/any packe=
ts=20
caused by this host should be log'n'dropped out.

I unfortunately found no good rule chains that works fine so I hope that=20
anyone can help me.

This is the one I put into my firewall:

iptables -N AutoDeny
iptables -A AutoDeny -j LOG --log-prefix 'fw-auto-denied: '
iptables -A AutoDeny -j DROP

iptables -N ChkAutoDeny
iptables -A ChkAutoDeny -m recent --rcheck -j AutoDeny

iptables -N Add2AutoDeny
iptables -A Add2AutoDeny -m recent --set --name AutoDeny -j AutoDeny

iptables -N AntiDoS
iptables -A AntiDoS -m recent --set --name SYNs
iptables -A AntiDoS -m recent --hitcount 60 --name SYNs -j Add2AutoDeny

# allow "all" already established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# put in the auto-deny-list checking
iptables -A INPUT -m state --state NEW -j ChkAutoDeny
# do check for new hosts to be auto denied
iptables -A INPUT -m state --state NEW -j AntiDoS

So. That's it. But it unfortunately doesn't work correctly. Why? Does any=
one=20
have a different way? Perhaps using the iplimit, pool, or even the recent=
=20
extension?

btw: how long is a source address kept in a `recent list`??? (it's better=
 if=20
it's only dropped whenever _I_ want to have dropped it)

Thanks in advance,
Christian Parpart.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE8+ih1Ppa2GmDVhK0RAqjaAJ4m3Ie4RZyhIxcjPXXnraB9A3kzIgCeKyYl
VV04RLXsGHTDWMRp/q0ogtE=3D
=3DxiiI
-----END PGP SIGNATURE-----


