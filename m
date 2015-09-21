From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: how to do port forwarding using nftables map
Date: Mon, 21 Sep 2015 10:49:06 +0200
Message-ID: <20150921084906.GA3549@salvia>
References: <CAP8bwDUTn=zfWNjzypzLw5a4z7earJ6Ou2Uh4JHv_Am9uu_4Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAP8bwDUTn=zfWNjzypzLw5a4z7earJ6Ou2Uh4JHv_Am9uu_4Lw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?56We5qW95Z2C546y5aWI?= <zh99998@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Sep 21, 2015 at 10:09:25AM +0800, =E7=A5=9E=E6=A5=BD=E5=9D=82=E7=
=8E=B2=E5=A5=88 wrote:
> I'm doing many port forwarding service on a linux server. There will
> be many(may thousands of) port forward rule so I want to use nftables
> map to improve performance rather than just many rules.
>=20
> the policy will be [protocol : port -> address : port], like [tcp 123=
4
> -> 1.1.1.1:4321], forward tcp 1234 port to address 1.1.1.1 same
> protocol port 4321.
> the protocol may only tcp and udp. so it's also ok if the key can
> support only one port field. i can set maps and rules for each
> protocol.
>=20
> the problem is, how to define the value "ip:port" using map?
>=20
> I tried create 2 maps, using
>=20
> > nft add map nat forward_address {type inet_service : ipv4_addr \;}
> > nft add map nat forward_port {type inet_service : inet_service \;}
>=20
> but then I don't know how to set dnat rule....... seems the dnat
> destnation can only accept one map value? and also i don't know how t=
o
> set "ip:port" as one value in map.

Could you provide an example of your iptables ruleset? Thanks.
