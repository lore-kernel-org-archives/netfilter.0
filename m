From: Lopsch <lopsch@lopsch.com>
Subject: Re: Does anybody work on supporting SPD matching Netfilter MARKS?
Date: Wed, 19 Jan 2005 20:12:55 +0100
Message-ID: <41EEB137.1030901@lopsch.com>
References: <41EE01DF.5040707@protactive.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigBBEE0FF227DFE0CFD733F59C"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41EE01DF.5040707@protactive.nl>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigBBEE0FF227DFE0CFD733F59C
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ludo Stellingwerff schrieb:
> Hi All,
>
> I was wondering if someone has been working on and/or has a patch
> which implement's the use of Netfilter Marks for ipsec spd matching
> under the linux kernel 2.6. This would be similar to the NetBSD
> "tagged" option of 'setkey':
>
> spdadd tagged "ssh" -P out esp/transport//require
>
> But then something like:
>
> ~     spdadd tagged 1 -P out esp/transport//require
> or  spdadd mark 1 -P out esp/transport//require
>
> Thank in advance,
> greetings,
>
> Ludo Stellingwerff.
>
> --
> Ludo Stellingwerff
>
> V&S B.V. The Netherlands
> ProTactive firewall solution.
> Tel: +31 172 416116
> Fax: +31 172 416124
>
> site: www.protactive.nl
> demo: http://www.protactive.nl:81/netview.html

Taken from the policy match from p-o-m: "This patch adds the policy
match to netfilter.

The policy match is used to match the IPsec policy
used for handling a packet."

Perhaps what you are looking for.


--

PGP-ID 0xF8EAF138

--------------enigBBEE0FF227DFE0CFD733F59C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1-nr1 (Windows XP)

iQIVAwUBQe6xOiXe0Lt4Z4FpAQIeTRAA0PwW/LvYeUbZZi8KUL+QesxKCWxFR2FC
B62V8e3QRcHtrcYO2N7gzfEjgAZ7a71e7jTAI7uFZ2ciKqQ6Q3gykkQ217mxTeYt
vsEHblBBpZYSPrVv8EamfPbfDFGleWMk5TMHvTcrGyc7z5OjL3kWAOrrGPc3+Y7o
ef6tdNVHIFbG/E1pCZGzXKwTzkkrmhNNeMOYIFRK6IoDeTs1A3X3hxDfM9xMIC8G
Oe3CROb6wf125xk9QaX/sDzi0CzAMyRAono9/LbxB/NsKcOKBw37X5+4m3hmE/xF
PXjj9Rc/9SCawkcn80OwiXp3LMMqezzMGLsNDoCF+fiG4Wq3E44KZKwGGq2UOpza
2IG+jTKuGnfeaWdc/XRv/8yjQqIMRlhRJZ0p+FFg4IiBpmGmwgMzMQS0kwpLoIul
/FF6rxEq/N4fPOkv9CDB2yXdfrWGEX/kIfYPxPwqS2rfnWrkt9KYdideNya9svfp
bd33M1w3OK0S4EwrZrrgPG+6GeZaLPUp50TdZHNKvKz2SiTZO+vKDrr9FjV+hm4p
CXTRay5XNc/ZPMnQ0ADtRrhwdKtQ+jchMq4SF7bH2e1faYNo/FlGYuIPDDr7y1hS
KdhIkAqmHE5xladOuqsEwIkvIghUzpcdHFetgJsXCNBVwe9M2ALA8pRDWN8VHz2e
trEklpQ7FHs=
=bQEs
-----END PGP SIGNATURE-----

--------------enigBBEE0FF227DFE0CFD733F59C--

