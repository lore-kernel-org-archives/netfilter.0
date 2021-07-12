From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Redirect all traffic or range of ports to an IP
Date: Mon, 12 Jul 2021 19:12:13 +0200
Message-ID: <20210712171213.GA11181@salvia>
References: <f6701047-5ad2-2204-9eee-d8c3ca325574@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f6701047-5ad2-2204-9eee-d8c3ca325574@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Daniel <tech@tootai.net>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Sat, Jul 03, 2021 at 04:13:50PM +0200, Daniel wrote:
> Hi list,
>=20
> I face an error while trying to redirect all traffic to an IP. Let=C5=9B =
say I
> want to redirect all incomint udp to 10.10.10.10 internal address.
>=20
> My rules are working prefectly when redirecting unique ports. I use those
> rules
>=20
> nft add element ip nat fwdtoip_udp.eth0 { $srcport : $mydaddr }
> nft add element ip nat fwdtoport_udp.eth0 { $srcport : $dstport }
>=20
> and then
>=20
> nft add rule ip nat prerouting dnat udp dport map @fwdtoip_udp.eth0 : udp=
 dport map @fwdtoport_udp.eth0
>=20
> If $srcport=3D$dstport=3D1-65534 I get "Error: value must be a singleton"=
 for
> the $dstport when adding element.
>=20
> Is there a way to  use this configuration to redirect all traffic to an IP
> or should I create other rules ? BTW, problem is also existing if I want =
ro
> redirect ports like 20000-30000 for eg RTP.

Please, see:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210712170424.1=
1071-1-pablo@netfilter.org/

Thanks.
