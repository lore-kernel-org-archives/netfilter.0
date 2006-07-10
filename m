From: Antonio Di Bacco <antonio.dibacco@aruba.it>
Subject: Re: iptables rule doesn't work
Date: Mon, 10 Jul 2006 21:28:56 +0200
Message-ID: <200607102128.57001.antonio.dibacco@aruba.it>
References: <200607082247.06089.antonio.dibacco@aruba.it>
	<44B243FA.6060305@eld.physics.leidenuniv.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44B243FA.6060305@eld.physics.leidenuniv.nl>
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

This is my scenario:

LAN-A =A0 =A0 ------------ =A0 =A0 =A0 =A0 =A0 =A0 =A0PtP =A0 =A0 =A0 =A0 =
=A0----------- =A0 =A0LAN-B
=A0---------------| Box A =A0|------------------------- | Box B =A0| ------=
=2D--- =A0=20
=A0 =A0 =A0 =A0 eth0 =A0------------ eth1 =A0 =A0 =A0 =A0 =A0 =A0 eth1 ----=
=2D----- =A0eth0

Both the boxes are identical , this means that both ETH1 must be configured=
=20
the same way and the two eth0 too.=20
ETH1 has the NOARP flag set and I chose for them IP 192.168.0.20 .
=46orwarding is enabled too.
ETH0(s) have 192.168.1.15 .
Both boxes run a web-server.

I then I configured iptables as here on both boxes:

ifconfig eth1 192.168.0.20 -arp
iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth1 =A0-p tcp -j SNAT --to-source \=20
192.168.0.21:6000-6050
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT \=20
=2D-to-destination 192.168.0.20:80
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8081 -j DNAT --to \=20
192.168.0.21:80

I try to connect with my browser on a notebook on LAN-A
to address 192.168.1.15:8080 and I expect to receive answer from BOX-B web=
=20
server but nothing happens. Box B receives a tcp packet 192.168.0.21:6000 -=
>=20
192.168.0.21:80 on eth1 (tcpdump saw it) but the web server doesn't receive=
=20
this packet probably.

Thank you for your attention,
Antonio.

