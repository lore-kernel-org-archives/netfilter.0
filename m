From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Newbie netfi;ter question
Date: 20 May 2003 09:48:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053416904.2024.83.camel@kermit.spenneberg.de>
References: <3EBD073B.2050603@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EBD073B.2050603@verizon.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ken Kachnowich <ken.kachnowich@verizon.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Sam, 2003-05-10 um 16.05 schrieb Ken Kachnowich:
> Hi,
>=20
>    I have created a very simple module to use netfilters. I
> display some info from the sk_buff structures.
> The protocol field always has an 8 in it.
If you are reading the ethernet header, the protocol field is supposed
to be 8!

>=20
> What does the 8 mean? I would expect this to indicate this is
> an IP packet of some type, but so far I have not found a header
> or any docs that explains it. Where would be a good place for me
> to find these things out (please don't say read the kernel source).
8 means IP (in the ethernet header).

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

