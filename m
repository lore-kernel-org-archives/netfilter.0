From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Outgoing interface selection by source address
Date: 27 Nov 2003 15:20:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069942851.28653.48.camel@kermit>
References: <Pine.GSO.4.33.0311271455320.8613-100000@horus.imag.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.33.0311271455320.8613-100000@horus.imag.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Pawel Hadam <Pawel.Hadam@imag.fr>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-11-27 um 14.55 schrieb Pawel Hadam:
> Hi all
>=20
> I have 2 local interfaces (eth0 & eth1) and thus 2 IPv6 addresses (src0 &
> src1).
>=20
> I have an SCTP/IPv6 application that binds to one of the addresses
> (let's say src0) and sends packets to some destination (dst). But
> according to the classical routing policy, all packets in this
> connection (src0, dst) are routed via eth1. And I would like them to be
> routed via interface eth0, as src0 is the address of eth0 not eth1.
> Is it possible to do it with netfilter for IPv6 ? I mean, is it possible
> to route the packets via the proper outgoing interface by theirs source
> address, like this:
It is, but not using netfilter (AFAIK). Take a look at the=20
Linux Advanced Routing and Traffic Howto: lartc.org

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

