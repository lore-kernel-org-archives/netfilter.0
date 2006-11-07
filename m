From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: conntrack -E -i not allowed?
Date: Tue, 7 Nov 2006 10:37:44 -0800
Message-ID: <200611071037.52450.alan.ezust@presinet.com>
References: <200611011043.53370.alan.ezust@presinet.com>
	<200611021111.19134.alan.ezust@presinet.com>
	<45507ED0.4000709@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3354888.uiJvBxjKEH";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45507ED0.4000709@netfilter.org>
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
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@lists.netfilter.org

--nextPart3354888.uiJvBxjKEH
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

We need to be able to determine when we get an UPDATE or a DISCONNECT, whic=
h=20
connections they correspond to. I assumed that was the purpose of the CT id=
=2E=20
Why are you removing it?=20


On Tuesday 07 November 2006 04:40, Pablo Neira Ayuso wrote:
> Alan Ezust wrote:
> >> Is there a trick to getting the ctids to be sent to the output of this?
>
> There is not.
>
> >> conntrack -L -i seems to work, showing me the id. Personally, I think
> >> conntrack should always output the id.
>
> No, actually we have plans to remove it soon. Why do you need the id?

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC,Canada

--nextPart3354888.uiJvBxjKEH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFUNKAsJbtw6GURksRAm1fAJkBQWxUX1YIPbSKYrVobLF2bDMfjQCdFtSX
5uk0VKcX6ighHVPEsi3r9sc=
=UfPi
-----END PGP SIGNATURE-----

--nextPart3354888.uiJvBxjKEH--

