From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: netfilter: port restricted NAT
Date: Tue, 28 Oct 2003 15:49:22 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031028234921.GA19394@home.tig-grr.com>
References: <1066914957.10239.128.camel@tellus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1066914957.10239.128.camel@tellus>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Alfred E. Heggestad" <alfredh@sxdesign.com>
Cc: netfilter@lists.netfilter.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Opening RTP conversations with SIP can be quite complicated -- perhaps
impossible -- if you allow both sides to be behind a NAT.  Even with only
one side behind a NAT, it's not easy.

You are correct that netfilter is a "port restricted cone".  This is by
design -- it's not secure to do it the other way.  Your typical consumer
"residential gatemay" device, on the other hand, will only map the external
port to an internal ip/port regardless of the source.

In order to make STUN/RTP work with Linux, you need to multiplex the
protocols.  Your client must send the STUN request to the negotiated port(s)
on the server, and the server must be listening on those ports for both STUN
and RTP requests.  Now, if your server is also behind a NAT, you are stuck.=
=20
You need a relay that is openly accessible to act as a relay.

On Thu, Oct 23, 2003 at 03:15:58PM +0200, Alfred E. Heggestad wrote:
> Hi
>=20
> I have a question about restricted NAT vs. port restricted NAT
> in the implentation of netfilter in 2.4.18 kernel. We are
> developing Voice-over-IP products using SIP for signalling,
> where the packets normally go over UDP port 5060.
>=20
> For VoIP devices located behind NATs we use a protocol called
> "STUN - Simple Traversal of UDP Through NATs" (RFC3489) to probe
> for public interface ip/ports, and refresh connection tracking
> in netfilter for outgoing/incoming RTP streams. The SIP proxies
> and/or devices are located on the public network.
>=20
> This works quite well with most SIP proxies but we have seen some
> cases where the response is "lost" in the gateway (linux 2.4.18)
> This is the case where the source port of the response is not the
> same as destination port of the request. I have looked around in
> these files:
>=20
>   net/ipv4/netfilter/ip_conntrack_proto_udp.c
>   net/ipv4/netfilter/ip_nat_proto_udp.c
>=20
> and it looks like the connection tracker requires the response to
> come from the same port as the ougoing request was sent to.
>=20
> Typical scenario:
>=20
>=20
> -------------------------------------------
> [           DEVICE 10.47.11.109           ]
> -------------------------------------------
>     |
>     |
>    \/
> src: 10.47.11.109:5060
> dst: 80.80.80.80.5060
>     |
>     |
> -------------------------------------------
> [       GATEWAY 213.187.186.10            ]
> -------------------------------------------
>     |                                 /\
>     |                                  |
>    \/                                  |
> src: 213.187.186.100:5060     src:80.80.80.80.12345
> dst: 80.80.80.80:5060         dst:213.187.186.100:5060
>     |                                 /\
>     |                                  |
>    \/                                  |
> -------------------------------------------
> [        SIP PROXY 80.80.80.80            ]
> -------------------------------------------
>=20
>=20
> The packet is lost in the gateway.
>=20
> >From RFC3489:
>=20
>    Restricted Cone: A restricted cone NAT is one where all requests
>       from the same internal IP address and port are mapped to the same
>       external IP address and port.  Unlike a full cone NAT, an external
>       host (with IP address X) can send a packet to the internal host
>       only if the internal host had previously sent a packet to IP
>       address X.
>=20
>    Port Restricted Cone: A port restricted cone NAT is like a
>       restricted cone NAT, but the restriction includes port numbers. =20
>       Specifically, an external host can send a packet, with source IP=20
>       address X and source port P, to the internal host only if the   =20
>       internal host had previously sent a packet to IP address X and  =20
>       port P.
>=20
>=20
> This behaviour I suspect would be close to the "Port Restricted Cone"
> definition. My main question is: With netfilter, is it possible at all
> to have only "Restricted Cone" with no source port checking and if yes
> how is this possible to configure?
>=20
> I have read through iptables man page and searched www but could not
> find any reference to my problem.
>=20
>=20
> For reference, here is the iptables NAT table on my gateway:
>=20
> root@uranus:~# iptables -t nat -vL
> Chain PREROUTING (policy ACCEPT 1762K packets, 285M bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation        =20
>=20
> Chain POSTROUTING (policy ACCEPT 833K packets, 209M bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation        =20
>  177K   11M MASQUERADE  all  --  any    eth0    10.47.10.0/24        anyw=
here          =20
>  107K   13M SNAT       all  --  any    eth0    anywhere             anywh=
ere           to:213.187.186.100=20
>=20
> Chain OUTPUT (policy ACCEPT 227K packets, 26M bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation =20
>=20
>=20
>=20
> Hopefully you are able to understand my question, thanks for any help.
>=20
> /alfred

--=20
The intelligence of any discussion diminishes with the square of the
number of participants.
        -- Adam Walinsky

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj+fAIEACgkQFMm9uvwPXW735gCfZg2mZ+RPt/YXA5ndRkjPUbyU
btQAniG9d/JflN7c903BGo0GnbYsMNt8
=4LVN
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--

