From: John Haxby <john.haxby@oracle.com>
Subject: Re: [Help] Allow website using iptables
Date: Mon, 4 May 2020 15:00:04 +0100
Message-ID: <3EDC495D-8AD1-4687-8496-B17E3CCEB158@oracle.com>
References: <CA+u3GuKsm8o1nv_iJ6kSYHWzrfgCpZsVZKbDq4FmnuCFwOL3BQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Content-Type: multipart/signed;
        boundary="Apple-Mail=_60A7C4C6-AFB0-4404-BDE3-A61E01BB1037";
        protocol="application/pgp-signature";
        micalg=pgp-sha256
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=corp-2020-01-29;
 bh=YwtkJPBOeSbiKx/rsd+ECV2zf1Ag6Z8kaXUX3FdyuK4=;
 b=gD2YSY4V+m8+rRATCHMTJuAoZa/a9AxFqdyIevNAcKzvaNvgSSpaA2ohbp6wTbpjl/p6
 2wxIibNpGQditcyHrM8HLjqFEJrFghNteOHcbNb58QeW3k+41YZlPUkPTGgaaW754jgw
 S+axps4VamiukDrFbES4+Pt2ivREeLHG0B9IULF/vklB4irqYGtWp+HY0mu8GJBtJNSu
 Gni0Z5LAt1EndUjO/9R5VpFVw3ZRZmts6FELp/Phv9mexr9Z+p7atzT/sSjOmyuxkpke
 DR5Pq1nm+K17mN8egX9WVIsiczEAeDomeaeGILWHtyalM3p2IjDzhuTWiVI9ebcn/kR0 yA== 
In-Reply-To: <CA+u3GuKsm8o1nv_iJ6kSYHWzrfgCpZsVZKbDq4FmnuCFwOL3BQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Lazuardi Nasution <mrxlazuardin@gmail.com>
Cc: netfilter@vger.kernel.org, =?utf-8?B?U8ahbiDEkOG7lw==?= <sondd1096@gmail.com>


--Apple-Mail=_60A7C4C6-AFB0-4404-BDE3-A61E01BB1037
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 4 May 2020, at 09:54, Lazuardi Nasution <mrxlazuardin@gmail.com> =
wrote:
>=20
> YouTube use SSL. So you can't match strings inside the packet, it is
> encrypted.

Actually, in most cases you can: the first packet set will usually have =
the hostname in the SNI extension header.

jch

--Apple-Mail=_60A7C4C6-AFB0-4404-BDE3-A61E01BB1037
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iHUEAREIAB0WIQT+pxvb11CFWUkNSOVFC7t+lC+jyAUCXrAf5AAKCRBFC7t+lC+j
yFWKAPwKtrkvWSHbMnMS4fNvc1RkMmvkZkW55wTN81gRxTlX5AD+PdI7FScN1QE8
1HxzWhh2rojS6UlVd/0IY2qiTg5mz68=
=pNvU
-----END PGP SIGNATURE-----

--Apple-Mail=_60A7C4C6-AFB0-4404-BDE3-A61E01BB1037--
