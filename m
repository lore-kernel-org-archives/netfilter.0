From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Some errors applying last pom-ng to 2.6.14.5 kernel [BUGS REPORT]
Date: Fri, 30 Dec 2005 17:08:01 +0100
Message-ID: <43B55B61.9090501@arcoscom.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: samueldg@arcoscom.com

I detected some error (compiling) after patch 2.6.14.5 kernel with pom-ng.
With h323 patch, rstp, and so on.

I corrected:
    ip_conntrack_h323_h245.c
    ip_conntrack_h323_h225.c
    ip_conntrack_rtsp.c
    ip_conntrack_mms.c

Changing
   "ip_conntrack_expect_alloc()" calls by "ip_cocnntrack_expect_alloc( ct )"

It appears to compile fine, but some warnings with implicit declaration=20
for function "ip_conntrack_expect_free" appears.

With sources:
    ip_nat_rtsp.c
    ip_conntrack_quake3.c
    ip_conntrack_quake3.h
    ipt_IPMARK.c
    ipt_IPV4OPTSSTRIP.c

I don't know how to fix them and I disabled from kernel config, but I=20
need QUAKE3 at least.

Perhaps some sources where affected too, but I don't know.

Any one can help me?

Thanks



--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83


