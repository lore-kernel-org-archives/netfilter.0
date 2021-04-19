From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: nftables port forward on DHCP interface to static IP
Date: Mon, 19 Apr 2021 17:20:46 -0400
Message-ID: <0111b128-5639-7694-3e9a-67452408f71e@fhmtech.com>
References: <CABvnMci0-E23tAVE3MVgToSdbNuECqtMOe2wWimMmqZ9HZ9dHg@mail.gmail.com>
 <973b2d85-567a-e9aa-1b64-749a1fb116a5@fhmtech.com>
 <CABvnMchqLVxNWqqd36-0s+ug-aPi3kQe7UT6NnVedAHL=2MOyA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=pgX892F5vJ/hjvI7gEHZlJkn1xP/lGeEQxQkWq+m1hk=;
        b=SR3xXNB3L+Xk+edweWGx4Kdk1kVx3KxPAXZ9z5UEUbvQrk23qncx025F9vXEglgZ3cKSpFX9PIo8ozpUMGTolp6tG5Fn8cm9zP3DWfTSR1b8Kfx1iU6EaZd0XGfGWivUjj2mMsL+VdWmi1M6lRq2quUnFXY6gcH94ucn2ztdvEc=;
In-Reply-To: <CABvnMchqLVxNWqqd36-0s+ug-aPi3kQe7UT6NnVedAHL=2MOyA@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: =?UTF-8?Q?Pekka_J=c3=a4rvinen?= <pekka.jarvinen@gmail.com>
Cc: netfilter@vger.kernel.org

On 2021/04/19 13:22, Pekka J=C3=A4rvinen wrote:
> On Sun, 18 Apr 2021 at 22:23, Frank Myhr <fmyhr@fhmtech.com> wrote:
>>
>> Hi Pekka,
>>
>> Try:
>> iifname $wanif tcp dport 12345 dnat 192.168.1.11
>>
>> or
>> iifname $wanif tcp dport {12345} dnat 192.168.1.11
>>          (but the braces are unnecessary unless you want to add more tha=
n one dport)
>>
>> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Add=
ress_Translation_(NAT)#Destination_NAT
>=20
> Thanks. I managed to fix it just moments ago.=20

Great! Thanks for reporting back. A few comments:


> I had remnants of iptables kernel modules which I blacklisted:
>=20
> # cat /etc/modprobe.d/blacklist.conf
> blacklist ip_tables
> blacklist iptable_nat

Good to have those out of the way.


> I also upgraded kernel to 5.11.14.

Probably not necessary, but think it can't hurt.


> This might have caused the whole line erroring earlier.

Yes, recent nftables / kernels have improved error reporting. But you=20
were already on 5.11.2... so probably not much difference.


> I moved NAT related stuff to ip (IPv4) filter instead of inet:

Two comments:

1) Mea culpa! I didn't read your original ruleset carefully enough. Just=20
looking at it quickly I thought you had a trivial syntax error. But now=20
I see:

a) Your original rule in inet table:
iifname $wanif tcp dport {12345} dnat ip to 192.168.1.11

looks fine to me according to syntax at
https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Addres=
s_Translation_(NAT)#Inet_family_NAT

I don't think it should be necessary to move from inet to ip table to=20
get this to work. You might have encountered a bug which should be reported.

Could you please check the version of your nft command?:
nft -v

b) The other part of the syntax error I mistakenly thought I spotted is=20
whether or not to include the "to" keyword, i.e. "dnat to {ip}" vs. just=20
"dnat {ip}". Looking at nftables source parser_bison.y it appears to me=20
that the "to" is optional in case of nat in ip (IPv4) table but=20
NECESSARY when doing nat in inet table. The nft man page uses "dnat to",=20
whereas the wiki uses bare "nat" in places. 'nft list ruleset' always=20
includes the "to". I will update the wiki to include the "to" in all=20
cases: it seems a good habit since inet table requires it.


> define wanif =3D wan0
> define lanif =3D lan0
> define home_net =3D 192.168.1.0/24
> define home_net_gw =3D 192.168.1.1
>=20
> # Port forwards
> define port_fwd_ip =3D 192.168.1.11
> define port_fwds_udp =3D {12345}
> define port_fwds_tcp =3D {54321}
>=20
> # IPv4 & IPv6
> table inet filter {

Nitpick: just in my personal opinion, better not to use table name that=20
is a nftables keyword ("filter"). I know the wiki does it lots of=20
places. And it's not technically wrong. But:

a) There have been recent bugs (hopefully now all fixed!) from nft=20
confusing a user-named object with a reserved keyword.

b) Again just in my opinion, it makes the ruleset harder to read: *I*=20
have to determine whether a word is a keyword or a label from its context.

>     # ...
>=20
>     chain forward {
>         type filter hook forward priority filter; policy drop;
>         ct state invalid drop
>=20
>         # ...
>=20
>         # Port forward WAN -> LAN
>         iifname $wanif oifname $lanif tcp dport $port_fwds_tcp accept
> comment "Accept forwarded TCP"
>         iifname $wanif oifname $lanif udp dport $port_fwds_udp accept
> comment "Accept forwarded UDP"
>     }
>=20
>     # ...
>=20
> }
>=20
> # IPv4
> table ip filter {
>=20
>     # NAT
>     chain prerouting {
>         type nat hook prerouting priority dstnat; policy accept;
>         ct state invalid drop
>=20
>         # TCP SYN (CT NEW)
>         tcp flags & (fin|syn|rst|ack) !=3D syn ct state {new} drop

You're filtering in a nat chain, generally not a good idea. My=20
understanding is that, since nat is based on connection tracking, this=20
chain will see only the FIRST packet of each connection. You probably=20
want additional rules in a filter chain (maybe you already have them in=20
the #... in your forward chain).

You could add counters (if only temporarily) to your rules in your nat=20
and filter chains and see where packets are getting handled.

Also a nitpick: no need for {} around the state here.

>=20
>         # Port forward WAN -> LAN
>         iifname $wanif tcp dport $port_fwds_tcp dnat to $port_fwd_ip
> comment "Port forwards TCP"
>         iifname $wanif udp dport $port_fwds_udp dnat to $port_fwd_ip
> comment "Port forwards UDP"
>     }
>=20
>     # NAT
>     chain postrouting {
>         type nat hook postrouting priority srcnat; policy accept;
>         ct state invalid drop
>         oifname $wanif masquerade persistent comment "MasqNAT"
>     }
> }
>=20

Best regards,
Frank

