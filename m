From: "Javier Garza" <ejgg71@hotmail.com>
Subject: problem with mac address and  SNAT
Date: Tue, 22 Jul 2003 18:23:40 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-F82XIwOnCSBs4K00010097@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hy
  I have a redhat-release-7.2-1,  with   kernel-2.4.7-10  and  =20
iptables-1.2.3-1.

I want to assign a public  IP 200.40.199.221  to my PCs for access to=20
internet,
and the interface outside  is 200.40.199.220.

       iptables -t nat -A POSTROUTING -s 10.220.5.13 -o eth1 -j SNAT=20
--to-source   200.40.199.221

The problems is the router outside, not kwon the mac to  200.40.199.221,=20
because my linux not reply the
MAC assigned to  200.40.199.221.
my linux have a MAC  entry to IP  200.40.199.221  equql to MAC of interface=
=20
outside.

Help me please.!!

_________________________________________________________________
Charla con tus amigos en l=EDnea mediante MSN Messenger:=20
http://messenger.yupimsn.com/


