From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: HTTP slower than SSH on client behind iptables
Date: Tue, 31 Jan 2006 09:11:35 -0500
Message-ID: <43DF7017.8030008@rosi-kessel.org>
References: <20060131033519.GA32564@bostoncoop.net>
	<43DF299D.9070105@prosyst.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig0D6D08303B42A832D4DCEC72"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF299D.9070105@prosyst.com>
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
--------------enig0D6D08303B42A832D4DCEC72
Content-Type: multipart/mixed; boundary="------------060602010109050602080402"

This is a multi-part message in MIME format.
--------------060602010109050602080402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

(sorry, should have sent this to the list)

Boryan Yotov wrote:
>> On the NAT box, my Internet connection goes up to about 700 kilobytes =
per
>> second, regardless of the protocol used (e.g., ssh or http).=20
>> On clients behind the NAT box, however, HTTP connections seem to top o=
ut
>> around 70 kilobytes per second. ssh connections (e.g., rsync) get the
>> full throughput of the Internet connection.
> Are you sure, you don't have some kind of a traffic shaping
> active on the NAT gateway's internal interface?
> For example: If tc is used, you could check that using:
> tc class show dev <nat_box_internal_interface>
> and
> tc filter show dev <nat_box_internal_interface>

I do have traffic shaping on the *external* interface, but it is not port=

dependent.

tc class|filter show dev <internal_interface> gives an empty response.

Also, when I clear the queue (I use wondershaper, so running wondershaper=

clear), it seems I still have the same problem.

=2E..But is there some way that outbound traffic shaping on the external
facing interface could somehow impact *inbound* HTTP traffic on an intern=
al
client connected to the internal facing interface?
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org

--------------060602010109050602080402
Content-Type: application/pgp-signature;
 name="signature.asc"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuNSAo
TWluZ1czMikNCkNvbW1lbnQ6IFVzaW5nIEdudVBHIHdpdGggTW96aWxsYSAtIGh0dHA6Ly9l
bmlnbWFpbC5tb3pkZXYub3JnDQoNCmlEOERCUUZEMzJKeGRUZjNaa2xRNnFZUkF2a3NBSjRv
WEdQK216NWhzV0VwTGd6T2djdXJFdXRyaUFDYUFpY24NClpoQkVicG9hNGJRUTQ0cWxOeUNi
SzhvPQ0KPUNHZjENCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQ0KDQo=
--------------060602010109050602080402--

--------------enig0D6D08303B42A832D4DCEC72
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFD33AZdTf3ZklQ6qYRAktJAKCP1K515OmixSRura1BkHlRQwIvfgCgnCX6
3LX4MuXi/xq+2T4GYnKQKBg=
=SiUN
-----END PGP SIGNATURE-----

--------------enig0D6D08303B42A832D4DCEC72--

