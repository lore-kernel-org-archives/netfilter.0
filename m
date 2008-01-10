From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Why REJECT target  is not supported with MANGLE ?
Date: Thu, 10 Jan 2008 09:53:45 +0100
Message-ID: <4785DD19.5050605@unipex.it>
References: <478548BA.2020903@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478548BA.2020903@zensoluciones.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

S?=E9bastien Cramatte wrote:
> Hello,
>=20
> Why REJECT target  is not supported with MANGLE ?
>=20
>=20

I'm a iptables guru, but mangle it's there for "mangling packets", not
for filter them. filter tables are for that!

> My server is running debian etch4 with 2.6.22 kernel  and setuped as
>  traffic shaper + transparent bridge
>=20
> The command with connlimit  bellow won't work and return me "Invalid
>  Argument"
>=20
> iptables  -t mangle -N mytable iptables --table mangle --append
> POSTROUTING --out-interface br0 --match physdev --physdev-is-bridged
> --physdev-out eth0 --jump  mytable
>=20
> iptables  -t mangle -A mytable --proto tcp --match connlimit=20
> --connlimit-above 15 --connlimit-mask 32 --jump REJECT iptables  -t
> mangle -A mytable --jump CLASSIFY --set-class 1:10
>=20
> How can I achieve this kind of setup ?
>=20

DROP_MARK=3D"0x10"
iptables -t mangle -N table_mark
iptables  -t mangle -A mytable --proto tcp --match connlimit
  --connlimit-above 15 --connlimit-mask 32 --jump table_mark
iptables -t mangle -A table_mark -j MARK --set-mark $DROP_MARK
iptables -t filter -m mark --mark $DROP_MARK -j REJECT

the "-t filter" parameter are optional, but I wrote it for say to you
that this is the right place where kernel make the filter!

http://www.faqs.org/docs/iptables/mangletable.html

Michele
