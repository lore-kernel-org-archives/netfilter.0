From: =?iso-8859-2?Q?R=F3=BFa=F1ski_Sergiusz?= <rozanski@sergiusz.com>
Subject: ip/snat + port/dnat
Date: Fri, 7 May 2004 23:09:14 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0405072300190.16707-100000@dns.media-lab.com.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


I need dissable routing to smtp servers, and enable smtp on non-standard
port. Like this:

-p tcp -s 192.168/16 -dport 25 -j DENY
-p tcp -s 192.168/16 -dport 2525 -j TARGET_LIKE_SNAT --to $ext_if --to-port=
 25

don't change destination ip.
possible?

--=20
Sergiusz R=F3=BFa=F1ski rozanski.at.sergiusz.dot.com sq3bkn
RTG project http://gg.overwap.net
RMXF Postfix project http://rmxf.comm.pl


