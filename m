From: Ivan Dubrov <wfragg@gmail.com>
Subject: Re: NAT 1:N
Date: Sat, 30 Jun 2007 14:54:29 +0700
Message-ID: <46860C35.6060805@gmail.com>
References: <A9413ED3DA1D5A47ADDF30EC379CEDA207670F@inepmail.inep.gov.br>
	<007201c7ba8c$cd856e10$68904a30$@COM>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigDD0FA6D3039E0318866FC17F"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:references:in-reply-to:x-enigmail-version:content-type;
	b=jB4rT2BFw+q6xV1WtUiWRXQgXSNfdDQu78tjntzKkjl5CmjIhqQ2HndHI8aj7X+4ULcSwbOL40Cd8gZlYHUr0fr28qASAAGiq6LSrSTGMBCi00kalY+5VdFmt7gyXD0PtltLJq8fXxGptCrQTlKz4SU6roXNIc3CIKJcemNAQTs=
In-Reply-To: <007201c7ba8c$cd856e10$68904a30$@COM>
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
--------------enigDD0FA6D3039E0318866FC17F
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ric Messier wrote:
> Are you looking for redirect rules?
> -A PREROUTING -d w.x.y.z -p tcp -m tcp --dport 80 -j DNAT --to-destinat=
ion 172.16.0.2
>
>
> You can't have two Web servers redirected through one IP address becaus=
e there is only one port 80. You'd have to move the other Web server to a=
nother port. If you are looking for load balancing, you may need to look =
elsewhere.
>  =20
This cannot be done via iptables only, but this can be done with Apache
mod_proxy module. Install Apache on the router and proxy requests to
backend server discriminating by the servername (for example, proxy all
requests to http://web1.example.com/ to first Web server,
http://web2.example.com/ to the second).



--------------enigDD0FA6D3039E0318866FC17F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFGhgw4LZ+Fnc2HIX4RAlpaAKDCKUB8oWyh2Vof8XtYtdXFTv2IJQCgi0K8
h9yBe1aEe2c5zb1L28wP7X0=
=KNTh
-----END PGP SIGNATURE-----

--------------enigDD0FA6D3039E0318866FC17F--

