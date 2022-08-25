From: John Haxby <john.haxby@oracle.com>
Subject: Re: Upgrading iptables firewall on Red Hat Enterprise Linux 9.0
Date: Thu, 25 Aug 2022 10:04:13 +0000
Message-ID: <C2301397-3025-4C11-9FFC-879B9190B1CB@oracle.com>
References: <CACsrZYYqnegWpwEqr_ZCnLQm9UvDjXYB=irTx25WU_E=UzK1iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
        boundary="Apple-Mail=_39A2C0D6-64A8-4A0A-A1F9-15B75030DF89";
        protocol="application/pgp-signature";
        micalg=pgp-sha256
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2022-7-12;
 bh=zRwhI66reYjmsPR5dmP7dEF3X+WZutdwvTDgG9L3CKc=;
 b=wz5bB5Lo3ScthHdtyCI2Drk4c+B+TLJPoRtZlVvYF4EHwMnCJ2rtXirmN4/F2hd736Xb
 EPbjJrwf1G4rl+hlVKkKfp4LdvI3d9ObuRjCp1icvlrQPZY/eYO2yLQRXB9G5RWp727S
 KGfYmizkAXcGiXtf6tMXVrdEiDNNGNy/tQ/06udCZthBSWqodtdQqk+cRb2iTYTjw0h1
 18fbfkJgzggwk9SdENFeu6vYifWE+De4aOOIg730vs+340BLWCQ2vcuRfI69V9BcKiYx
 WZowaVpxag32dILsWaZIxnb71rLnKux+a1hmOMNWq9TlcUr72auKG4kalA1TKn810At0 Cg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRwhI66reYjmsPR5dmP7dEF3X+WZutdwvTDgG9L3CKc=;
 b=sZDRPLVcPSmOPMknRDmR8bChUynNO1/tceAOf6/lqDrZcFlcMjABwWedddaf0OGLRlb1vfJ9Nahx6yKtssnpS5ugYuWx2411OcO4wAaEjEuPEhDP0lcBMmGc9Q6dTK8BCIWMoTVWcvmLcyL6Z61Vm++jS9/YFgma6UF0/vaAvr8=
In-Reply-To: <CACsrZYYqnegWpwEqr_ZCnLQm9UvDjXYB=irTx25WU_E=UzK1iw@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: Turritopsis Dohrnii Teo En Ming <tdtemccna@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>

--Apple-Mail=_39A2C0D6-64A8-4A0A-A1F9-15B75030DF89
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 11 Aug 2022, at 08:37, Turritopsis Dohrnii Teo En Ming =
<tdtemccna@gmail.com> wrote:
>=20
> Subject: Upgrading iptables firewall on Red Hat Enterprise Linux 9.0
>=20
> Good day from Singapore,
>=20
> The following RPM packages are installed on my Red Hat Enterprise
> Linux 9.0 virtual machine.
>=20
> iptables-libs-1.8.7-28.el9.x86_64
> iptables-nft-1.8.7-28.el9.x86_64
>=20
> Is it possible to upgrade iptables firewall to the latest version =
1.8.8?

I wouldn't recommend it.  Red Hat back port security and bugfixes to the =
base version so that it remains stable -- it's quite possible that =
updating would change the api/abi and, for example, podman.

TBH, I'm surprised iptables is still there: I thought RHEL had switch =
over to nft entirely.

jch



--Apple-Mail=_39A2C0D6-64A8-4A0A-A1F9-15B75030DF89
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iHUEAREIAB0WIQT+pxvb11CFWUkNSOVFC7t+lC+jyAUCYwdJHAAKCRBFC7t+lC+j
yGv5AP9e6Uu/74mHuE1tytVi0mNbQVwqoX0VZqXAJTUtXDJnWQD/cUP4yQHciWLI
jJFt5XTB0Dnwr4+CndgXaCN062c8h00=
=r4wJ
-----END PGP SIGNATURE-----

--Apple-Mail=_39A2C0D6-64A8-4A0A-A1F9-15B75030DF89--
