From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: Can netfilter do this?
Date: Thu, 25 Mar 2004 22:56:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040325215636.GA65121@jesus.seclab.jp>
References: <4062C994.5000506@rochester.rr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4062C994.5000506@rochester.rr.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Joe Mott <jmott1@rochester.rr.com>
Cc: netfilter@lists.netfilter.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, 25 Mar 2004, Joe Mott wrote:

> I have been searching the archived lists without any success to have the
> following question answered:
>
> Is netfilter capable of knowing when someone is crafting SMTP (or FTP or
> HTTP or ...) packets that violate RFC rules to exploit a vulnerability
> in some server?
>

Hi,
what you need is an IDS (intrusion detection system).
The most well known are prelude (prelude-ids.org) and snort.

Did I  mention that  I don't  trust snort because  of too  much passed
vulnerabilities?

Regards
Frederic


--
< Ylli> lol je rigole neuro jte prend pa pr un pervers ms un president et pere de famille respectable :s
http://www.seclab.jp

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (FreeBSD)

iD8DBQFAY1WUYBnsNILdO64RAmviAJ0RSbQBKu+rZHK8HuPUC0xdJl6B7ACeMua9
MdcFj5nG4dUnwf1Q98rrxEg=
=9vLU
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--

