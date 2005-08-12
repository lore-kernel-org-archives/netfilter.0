From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Fri, 12 Aug 2005 09:07:39 -0400
Message-ID: <42FC9F1B.4060204@rosi-kessel.org>
References: <20050809012914.GA23108@bostoncoop.net>	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>	<20050811130700.GA15463@bostoncoop.net>	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>	<42FBB957.30003@rosi-kessel.org>
	<42FC2D70.7000701@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig692C840592AE3C5C51629059"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42FC2D70.7000701@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig692C840592AE3C5C51629059
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Grant Taylor wrote:
> Is the faketarget and realtarget on the same subnet or are they on
> different subnets?  The reason that I ask is if you could make the
> traffic returning from realtarget back to userbox pass through
> faketarget it could be unDNATed and then sent back to the userbox. 
> However to pull this off you would have to play with the routing on the
> realtarget to make it use faketarget as it's upstream gateway and then
> do postrouting SNATing of the source IP back to that of the faketarget
> as the traffic left the faketarget.  This same idea can be expanded upon
> if the faketarget and realtarget are not on the same subnet, but it is
> not easy.

Different subnets.

Another complication is that some of the packets coming into realtarget
will be coming in directly from their original source, so I couldn't
just route *all* traffic back through faketarget.

But is there some way I could tag packets coming in from faketarget, so
that realtarget knows that all traffic returning back with that tag goes
through faketarget?
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

--------------enig692C840592AE3C5C51629059
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFC/J8bdTf3ZklQ6qYRAuEbAKCHpYcpkQzrw/AKvltyO9TkfrOr4ACgv545
k+5zfjbQ6luFu2Xg+K3V8x4=
=aCz9
-----END PGP SIGNATURE-----

--------------enig692C840592AE3C5C51629059--


