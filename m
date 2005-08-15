From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Transparent proxy where source IP address remains unchanged --
 possible?
Date: Mon, 15 Aug 2005 10:33:43 -0400
Message-ID: <4300A7C7.3080402@rosi-kessel.org>
References: <20050809012914.GA23108@bostoncoop.net>	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>	<20050811130700.GA15463@bostoncoop.net>	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>	<42FBB957.30003@rosi-kessel.org>	<42FC2D70.7000701@riverviewtech.net>	<42FC9F1B.4060204@rosi-kessel.org>	<42FD95F9.4070504@riverviewtech.net>	<20050813131224.GD25192@bostoncoop.net>
	<43003B7A.4040404@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigFE50371E0336E821FD819C85"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43003B7A.4040404@riverviewtech.net>
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
--------------enigFE50371E0336E821FD819C85
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Grant Taylor wrote:
> This is the command that you would need to run on the fake target to do=

> the up and over part:
> iptables -t nat -A PREROUTING -i $INet -d $FakeTargetIP -p tcp --dport
> 22 -j DNAT --to-destination $RealTargetIP:2222
> This is the corresponding command that you would need to run on the rea=
l
> target to do the down and in part:
> iptables -t mangle -A PREROUTING -i $INet -d $RealTargetIP -p tcp
> --dport 2222 -j MARK --set-mark $Mark
> iptables -t nat -A PREROUTING -i $INet -d $RealTargetIP -p tcp --dport
> 2222 -j REDIRECT --to-ports 22

Okay, I understand all this. Is this all that is necessary to make sure
the response packets go back through faketarget, though? Isn't this just
 taking care of the first part--the "up and over/down and in" part--but
not the second part, where packets need to go back to source through
faketarget?


--------------enigFE50371E0336E821FD819C85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDAKfHdTf3ZklQ6qYRAkrGAKDNull5NZLKELpKYi85/JaBfKg0hwCeKf7v
PLt5SCoQhw3rBqDTBsOivBk=
=YbIh
-----END PGP SIGNATURE-----

--------------enigFE50371E0336E821FD819C85--

