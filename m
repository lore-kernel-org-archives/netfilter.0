From: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Subject: editing
  /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c. Conntrack
  TimeOuts
Date: Mon, 03 Mar 2003 13:48:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030303134132.01e38258@172.26.0.8>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

I have here a linux router that lost memory, it can't recovers it.
As I read into some emails, mailing lists and webs the reason is the=20
conntrack module.
I want to know if someone here edited=20
/usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c
I used patch-o-matic but I couldn't use tcp-window-tracking patch yet due=
=20
to some incompatibility with other patches.

My dudes are:
Are there any perfomance problems if I reduce timeouts into=20
/usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c?
Can edited /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c and=
=20
use tcp-window-tracking at the same time? (I don't use it now, but I hope=
=20
to use it in the future)


Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)



