From: Harvey Muller <hlmuller@yahoo.com>
Subject: iptables-1.3.7 Requires ip_tables to be built as module
Date: Mon, 12 Feb 2007 07:23:18 -0800 (PST)
Message-ID: <449077.77887.qm@web53612.mail.yahoo.com>
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

This is a duplicate report, Freitas reported it first on this list Feb 2.=
=0A=0AI'm using kernel version 2.6.20 on an x86 based system.  Iptables emi=
ts=0Aerrors, "FATAL: module ip_tables not found" when ip_tables is built in=
 the=0Akernel.  The only workaround is to build ip_tables as a module.=0A=
=0AIf iptables is being developed to be used ONLY as a module, you might in=
clude=0Aa note in the INSTALL document to alert the users.=0A=0ABest regard=
s,=0A=0AHarvey=0A=0A

