From: "Garzon Maldonado, Jesus Javier" <jgarzon@indra.es>
Subject: IPv6 options missed
Date: Tue, 10 Jun 2003 12:04:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E7ABA0128F4BB9459611B12C98E9CE7C01213187@MADTORMAIL.indra.es>
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
To: netfilter@lists.netfilter.org

Hello all:

I'm trying to configure an IPv6 Firewall in a Linux machine, (Red Hat 9 =
with kernel 2.4.20), following the steps stated in =
http://www.tldp.org/HOWTO/Linux+IPv6-HOWTO/x2083.html#AEN2085. I've =
downloaded iptables 1.2.8, changed KERNEL_DIR variable and typed make =
and make install (since make pending-patches and make patch-o-matic are =
no valid statements) without problems. However, when I try to setup the =
kernel I can't find some options in IPv6: Netfilter configuration like =
REJECT target support, or AH/ESP match support.

Anybody knows what can be wrong?.

Best regards.

Javi Garzon

