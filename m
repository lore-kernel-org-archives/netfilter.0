From: Alexander Samad <alex@samad.com.au>
Subject: Re: Iptables / KAME IPSec problem: source port information lost
Date: Wed, 10 Mar 2004 06:36:30 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040309193630.GJ24806@samad.com.au>
References: <404DB826.3000709@blinkenlichten.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="++alDQ2ROsODg1x+"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <404DB826.3000709@blinkenlichten.de>
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


--++alDQ2ROsODg1x+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2004 at 01:27:18PM +0100, Carsten Maass wrote:
> Dear List,
>=20
> my network layout looks like this:
> ----------------------------------
>=20
> (Localnet A)---(Gateway A)=3D=3DIPSec=3D=3D(Gateway B)---(Localnet B)
>=20
> where "=3D=3DIPSec=3D=3D" is a IPSec connection using the backport of the=
 2.6=20
> KAME IPSec stack on a static 2.4.24 kernel in tunnel-mode. Both gateways=
=20
> are running Debian stable with racoon and the ipsec-tools coming from=20
> testing:
>=20
> kernel-source-2.4.24          2.4.24-3
> iptables                      1.2.6a-5
> ipsec-tools                   0.2.2-8
> racoon                        0.2.2-8
>=20
>=20
> My problem is:
> --------------
>=20
> At some point in the filtering process, the information about the source=
=20
> ports of the incoming and decrypted packet gets lost, so that the=20
> clients on the localnet don't accept it as one of the established=20
> connection.
>=20
> Here is some example:
> ---------------------
>=20
> The tcpdump was taken on Gateway A, listening on all interfaces.
>=20
> Client 192.168.3.4 on Localnet A tries to establish a http-connection to=
=20
> client 192.168.0.1 on Localnet B.
>=20
> 12:05:48.370984 192.168.3.4.35114 > 192.168.0.1.80: S=20
> 3186461765:3186461765(0) win 5840 <mss 1460,sackOK,timestamp 220395665=20
> 0,nop,wscale 0> (DF)
>=20
> The initial packet...
>=20
> 12:05:48.372462 218.10.35.139 > 146.254.136.108:=20
> ESP(spi=3D0x0a6825be,seq=3D0xaf) (DF)
>=20
> ...gets correctly encrypted and sent out to Gateway B (146.254.136.108).
>=20
> 12:05:48.447361 146.254.136.108 > 218.10.35.139:=20
> ESP(spi=3D0x03e34241,seq=3D0xa5) (DF)
>=20
> The encrypted response arrives at Gateway A (218.10.35.139).
>=20
> 12:05:48.447361 192.168.0.1.80 > 192.168.3.4.35114: S=20
> 969293027:969293027(0) ack 3186461766 win 5792 <mss=20
> 1460,sackOK,timestamp 2220996862 220395665,nop,wscale 0> (DF)

Sorry but isnt this the Sync/Ack packat in response to the sync above

>=20
> The packet gets decrypted, the source port is correct.
>=20
> 12:05:48.448584 192.168.0.1.1 > 192.168.3.4.35114: S=20
> 969293027:969293027(0) ack 3186461766 win 5792 <mss=20
> 1460,sackOK,timestamp 2220996862 220395665,nop,wscale 0> (DF)

Isn't this the same packet above but looks NAT'd ? Not sure why it is
coming from port 1 though.

>=20
> And here the strange thing apperars: The packet is sent out with a=20
> source port of 1!
>=20
> 12:05:48.448816 192.168.3.4.35114 > 192.168.0.1.1: R=20
> 3186461766:3186461766(0) win 0 (DF)
>=20
> As it comes from source port 1, the client does not recognize it as a=20
> packet which belongs to the established connection and rejects it.
>=20
> 12:05:48.449038 218.10.35.139 > 192.168.0.1:=20
> ESP(spi=3D0x0a6825be,seq=3D0xb0) (DF)
>=20
> The reject gets encrypted, sent out over the tunnel and the game starts=
=20
> over again.
>=20
> Portless connections like ping don't show this behavior and gets=20
> established correctly.
>=20
> So my questions are:
> --------------------
>=20
> I this an iptables problem or IPSec related?
> Can you think of any iptables rules, which causes this behavior?
> Do you know how to explore this problem further?
> Do you have any other hints?
>=20
>=20
> I hope i was able to make the problem clear. Please tell me if you need=
=20
> more information. As i have no clue how to go on with this problem, any=
=20
> help would be highly appreciated.
>=20
> Thanks for your time and patience,
> Carsten.
>=20
>=20
>=20

--++alDQ2ROsODg1x+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAThy+kZz88chpJ2MRAsRSAJ9Dp+9fv0Yme6LDIYQekknqzb12igCbB5ik
WVvJD9xtwc87PdR9qhai83s=
=pJXQ
-----END PGP SIGNATURE-----

--++alDQ2ROsODg1x+--

