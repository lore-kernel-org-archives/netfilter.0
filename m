From: Jeff McAdams <jeffm@iglou.com>
Subject: Re: Can't forward Win2k VPN through NAT
Date: Fri, 6 Sep 2002 22:37:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020907023658.GA27920@iglou.com>
References: <20020906183946.DFYK1968.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20020906183946.DFYK1968.mta05-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Also Sprach Antony Stone
>On Friday 06 September 2002 5:15 pm, Don Woodruff wrote:
>> Is this really fair? While Windows uses pptp, I believe it is
>> actually RFC 2637. PopTop is a perfectly workable pptp solution for
>> Linux -- so pptp tunelling is not really a "Windows" issue. While I
>> would prefer to use IPSEC where possible, the same issues with NAT
>> still exist (in a similar config).

>I agree that PPTP is an independent standard, and not a M$-developed
>protocol,

No, PPTP is indeed a MS-developed thing.  The RFC for PPTP (and I can't
confirm that 2637 is right, but have no reason to doubt that) is
"Informational", meaning that it hasn't gone through the IETF process of
standard development and can be quite a crappy protocol (which it is,
IMO).  For reference, PPPoE is also an informational protocol, L2TP is a
Standards Track (so it has gone through the IETF process).

>however I consider it to be by far an inferior way to set up
>a VPN than IPsec, and therefore I disapprove of Win2k for having
>provided users with PPTP and not IPsec.

You also might consider IPSec along with L2TP depending on your needs.
--=20
Jeff McAdams                            Email: jeffm@iglou.com
Head Network Administrator              Voice: (502) 966-3848
IgLou Internet Services                        (800) 436-4456

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9eWZKXkUmzpmSrfwRAr18AKDTznqdfUHk0UwvdOQa/j0c1jSLUACcDlxx
T1oGzBGUTK/c91BbKkOzMNg=
=7vHN
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

