From: erik.rousset@free.fr
Subject: problem for filtering multicast 224.0.0.2
Date: Wed, 04 Jul 2007 13:35:07 +0200
Message-ID: <1183548907.468b85eb96a10@imp.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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


Hello,

My computeur have :(OS linux FC6)
- a network card (eth0) in network 10.1.2.0/24
- a network card (eth1) in network 192.168.1.0/24

I try to filter packet with destination 224.0.0.2 (multicast) which comes=
 from
CISCO'switch  with protocol HSRP because they are present on eth1 in netw=
ork
192.168.1.0 and it's bad trafic.

Have you the good rules to do that ?

Thank you.

