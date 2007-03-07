From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: redirect
Date: Wed, 07 Mar 2007 18:14:21 +0200
Message-ID: <45EEE4DD.9090508@gmail.com>
References: <20070306094208.csonro2nwc8kogso@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig1D64818F4AEB93CCFEDAAFC4"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:cc:subject:references:in-reply-to:x-enigmail-version:content-type;
	b=cMBVhB5rB1Ng7yrd9NxJBaqkvmm2EvTePbejP11X4BdkLYuqRRb/MQx8zNiCZkrXknLZB4oikZvV826MqG1TZZE7ocoTaTRGPt0cFqneeNjlgZXBaaL9Ee+LVrXE2TYlG09UdLQrNl9izrwdtMeweKs3lnY9P/SoivJT9jws8YE=
In-Reply-To: <20070306094208.csonro2nwc8kogso@webmail.harrisonburg.k12.va.us>
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
To: dhottinger@harrisonburg.k12.va.us
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1D64818F4AEB93CCFEDAAFC4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

dhottinger@harrisonburg.k12.va.us wrote:
> I currently redirect all traffic on port 80 to my proxy server with
> $IPC -t nat -A PREROUTING -p tcp -i ! $IF --dport 80    -s !
> 204.111.40.0/24 -d ! 204.111.40.0/24 -j DNAT --to-destination
> $PROXY_IP:8080
>=20
> I would like to have any traffic destined for apple.com excluded from
> this redirect.  I cant seem to get the syntax right.  Anyone got any id=
eas?
<snip*>

iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d $apples_net
-j RETURN

iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d
$another_not_to_proxy_network -j RETURN

iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -j DNAT --to
$proxy:$port

--=20
regards,
Georgi Alexandrov

key server - pgp.mit.edu :: key id - 0x37B4B3EE
Key fingerprint =3D E429 BF93 FA67 44E9 B7D4  F89E F990 01C1 37B4 B3EE


--------------enig1D64818F4AEB93CCFEDAAFC4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFF7uTd+ZABwTe0s+4RAk3uAJ44t69OAQkmBndqFH0TJpuFXwRfbQCdFiVi
E6BHccgMYd83DFIyTXtmWc8=
=Fq3Y
-----END PGP SIGNATURE-----

--------------enig1D64818F4AEB93CCFEDAAFC4--

