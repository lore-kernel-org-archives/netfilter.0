From: "Robert Allmeroth" <Robert.Allmeroth@epygi.de>
Subject: Endian problem in h323
Date: Tue, 24 Jun 2003 15:59:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PIEIIGGHCLEGAPAHFMDOEEFJCOAA.Robert.Allmeroth@epygi.de>
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

hello :)

It seems that we found another endian problem in the h323

Found in:  patch-o-matic-20030615
File: extra/h323-conntrack-nat.patch

affects:  linux/net/ipv4/netfilter/ip_conntrack_h323.c

Error description:
	Loading ip_nat_h323 with modprobe fails, because
	ip_conntrack_h323 cannot be found in internal list
	due to wrong tuple initialization.

--------------- snip ----------------

static struct ip_conntrack_helper h225 =3D
   { { NULL, NULL },
     "H.225",                  /* name */
     IP_CT_HELPER_F_REUSE_EXPECT,          /* flags */
     THIS_MODULE,                  /* module */
     2,                        /* max_expected */
     240,                      /* timeout */
     { { 0, { __constant_htons(H225_PORT) } }, /* tuple */
       { 0, { 0 }, IPPROTO_TCP } },
     { { 0, { 0xFFFF } },              /* mask */
       { 0, { 0 }, 0xFFFF } },
     h225_help                 /* helper */
   };


should be:

static struct ip_conntrack_helper h225 =3D
	{ { NULL, NULL },
	  "H.225",					/* name */
	  IP_CT_HELPER_F_REUSE_EXPECT,			/* flags */
	  THIS_MODULE,					/* module */
	  2,						/* max_expected */
	  240,						/* timeout */
	  { { 0, { .tcp =3D { __constant_htons(H225_PORT) } } },	/* tuple */
	    { 0, { 0 }, IPPROTO_TCP } },
	  { { 0, { .tcp =3D { 0xFFFF } } },				/* mask */
	    { 0, { 0 }, 0xFFFF } },
	  h225_help					/* helper */
	};


best regards
  Robert & Markus

------------------
Epygi Labs DE           |  Herrenstra=DFe 23
Robert Allmeroth        |  76133 Karlsruhe
Tel: +49 721 20596 43   |  Fax: +49 721 20596 59


