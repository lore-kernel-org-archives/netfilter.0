From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: RE: ip_conntrack_standalone issues...
Date: Thu, 9 Feb 2006 15:31:24 -0600
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D161013336@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

My issue still seems to stem from the fact that I don't have =
ip_set_ipporthash.h which defines the ip_set_req_ipporthash_create =
structure.

Please help :)

-----Original Message-----
From: Samuel D=EDaz Garc=EDa [mailto:samueldg@arcoscom.com]=20
Sent: Thursday, February 09, 2006 3:14 PM
To: Thomas Raef
Cc: netfilter@lists.netfilter.org
Subject: Re: ip_conntrack_standalone issues...

Take a look into a message send by me some days ago with subject: "Last=20
patch-o-matic patches status report".

Some patches broke the kernel compilation.

Use the "--reverse" option for "./runme" to undo the don't needed patch.

Good luck.

Thomas Raef wrote:
> I started with 2.6.15 kernel & iptables-1.3.4
>=20
> I'm trying to add the ipset-2.2.8 functionality and in trying to use
> pom, I mistakenly added ip_conntrack_standalone and now I can't
> recompile my kernel.
>=20
> Is there a way to start over?
>=20
> Please help.
>=20
> Thank you in advance.
>=20
> Thomas J. Raef
> e-Based Security, Inc.
> www.ebasedsecurity.com
> "You're either hardened, or you're hacked!"
>=20
>=20
>=20
>=20

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

