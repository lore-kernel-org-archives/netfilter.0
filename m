From: =?iso-8859-1?q?darmian=20martinez?= <darmianm@yahoo.com.ar>
Subject: SNAT question
Date: Thu, 16 Sep 2004 14:20:12 -0300 (ART)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916172012.68861.qmail@web61101.mail.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,
=20
I am trying to change the source ip address of icmp reply packets of the
firewall, just because i am trying to hide the firewall ip address in the c=
ase someone makes a traceroute to my protected network. I dont want
to block the icmp packet, just to change the source ip address.
i try it with:
=20
iptables -t nat -I POSTROUTING -s [FIREWALL_IP] -d [TRACEROUTE_ORIGINATOR] =
-m state --state RELATED,NEW,ESTABLISHED -j SNAT --to [FAKE_IP_ADDRESS]
=20
it's does not work. anyone know how to make it?
=20
thanks.

		100mb gratis, Antivirus y Antispam
Correo Yahoo!, el mejor correo web del mundo
=A1Tenelo ya!
