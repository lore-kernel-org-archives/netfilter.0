From: =?ISO-8859-15?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Patch-o-matick H323 patch bricked the kernel 2.6.12.1 compilation
Date: Mon, 27 Jun 2005 20:24:53 +0200
Message-ID: <42C04475.4030107@arcoscom.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040600000000030702060602"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------040600000000030702060602
Content-Type: text/plain; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

When apply last pom patches (the h323 is the "victim") over 2.6.12.1=20
kernel, iptables 1.3.1 compile fine, but kernel not.

Appears that h323 pom, breaks any structure that is needed by=20
"standalone" nat module.

Sorry, but I only remember the "standalone" and I don't know if were=20
"nat" or "contrack" the .c kernel source.

=BFAnyone have used it or have any idea on how to solve?


Thanks

P.D.: Sorry for the "without more info" e-mail, but I haven't got the=20
machine now to say us the exact kernel compilation error.

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


--------------040600000000030702060602--

