From: Harvey Muller <hlmuller@yahoo.com>
Subject: iptables-1.3.7 Requires ip_tables to be built as module
Date: Thu, 15 Feb 2007 11:49:07 -0800 (PST)
Message-ID: <580354.86542.qm@web53604.mail.yahoo.com>
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

Yasuyuki,=0A=0ADuring the review, I noticed the inclusion of the load_iptab=
les_ko function within the=0Acompatible_revision function.  Removal of the =
inclusion results in no error messages,=0Aand testing of firewall doesn't s=
eem to show adverse affects.=0A=0AThis is the patch I created for testing:=
=0A=0Adiff -Naur iptables-1.3.7.orig/ip6tables.c iptables-1.3.7/ip6tables.c=
=0A--- iptables-1.3.7.orig/ip6tables.c    2007-02-15 14:04:54.000000000 -05=
00=0A+++ iptables-1.3.7/ip6tables.c    2007-02-15 14:06:32.000000000 -0500=
=0A@@ -1120,8 +1120,6 @@=0A     strcpy(rev.name, name);=0A     rev.revision=
 =3D revision;=0A =0A-    load_ip6tables_ko(modprobe);=0A-=0A     max_rev =
=3D getsockopt(sockfd, IPPROTO_IPV6, opt, &rev, &s);=0A     if (max_rev < 0=
) {=0A         /* Definitely don't support this? */=0Adiff -Naur iptables-1=
.3.7.orig/iptables.c iptables-1.3.7/iptables.c=0A--- iptables-1.3.7.orig/ip=
tables.c    2007-02-15 14:04:54.000000000 -0500=0A+++ iptables-1.3.7/iptabl=
es.c    2007-02-15 14:06:09.000000000 -0500=0A@@ -1148,8 +1148,6 @@=0A     =
    exit(1);=0A     }=0A =0A-    load_iptables_ko(modprobe);=0A-=0A     str=
cpy(rev.name, name);=0A     rev.revision =3D revision;=0A=0ABest regards,=
=0A=0AHarvey=0A=0A

