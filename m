From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Mystics of packet forwarding
Date: Wed, 07 Jan 2009 19:15:28 +1300
Message-ID: <49644880.8000903@treenet.co.nz>
References: <4963B3EB.6090806@arturaz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4963B3EB.6090806@arturaz.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@arturaz.net>
Cc: netfilter@vger.kernel.org

Art=C5=ABras =C5=A0lajus wrote:
> Hello fellow netfilter users,
>=20
> I have a strange problem and I think I should blame my ISP for that..=
=2E
>=20
> Recently I lost connectivity to some sites (i.e. digg.com, yahoo). Th=
e=20
> best part is that I can regain connectivity by clearing out all the=20
> rules from iptables.
>=20
> So if I have empty chains - I can connect to digg. After I add one ru=
le:
>=20
> iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j MASQUERADE (or SN=
AT,=20
> doesn't make a difference)

I very much doubt it's your ISP. Maybe the

one-sided NAT does not usually work very well. Try adding both the=20
symmetrical sides at once:

SNAT on the outbound request packets
   iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j SNAT ...

MASQUERADE on the inbound reply packets
  iptables -t nat -A PREROUTING -d 192.168.0.0/16 -j MASQUERADE


AYJ
