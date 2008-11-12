From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: monitoring network question
Date: Wed, 12 Nov 2008 16:36:07 -0600
Message-ID: <491B5A57.7000604@riverviewtech.net>
References: <491AE0C8.1080705@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491AE0C8.1080705@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/12/08 07:57, Leonardo Rodrigues Magalh=E3es wrote:
> i cannot use normal iptables -j ULOG rules, because there's no IP=20
> traffic flowing on the box. Traffic flowing are ethernet frames on th=
e=20
> bridge.
>=20
> i have tried ebtables with ulog as well:
>=20
> ebtables -A FORWARD --ulog -j CONTINUE
>=20
> and then fprobe-ulog to export packets, configuration with works just=
=20
> fine with iptables ULOG, but didnt worked with ebtables ulog. Maybe i=
'm=20
> missing some ebtables rule or different target than ulog ..... this i=
s=20
> the first time i've used ebtables anyway.

Have you considered enabling "Bridged NetFilter" (a.k.a. bridge-nf and=20
brnf)?  That should allow IPTables to see the bridged ethernet frames.=20
If IPTables can see the frames, you should be able to do what you are=20
accustom to doing.  At least I think.

> but .... i got a third idea on how to accomplish that. My idea, with=20
> this box, is to put it right in front the firewall (yes, with proper=20
> authorization, nothing illegal here), so i would have the whole netwo=
rk=20
> in one side of the bridge and the firewall on the other side of the=20
> bridge. In other words ..... several MACs which i dont know which wou=
ld=20
> be on one side, and just a single MAC, known one, on the other side o=
f=20
> the bridge.
>=20
> based on this, i tought on doing some arpspoof thing, having this box=
=20
> to fake arp replies to the firewall MAC address and sending it's own =
and=20
> then forwarding the frames to the real firewall.

Yuck.

IMHO this is in effect a poor mans form of Proxy ARP(ing), which is a=20
very poor substitute for bridging.

> i dont know how to do this and dont know neither if this setup would=20
> help me acchieving what i need.

I don't think it would.

Either you will be passing ethernet frames with out them passing throug=
h=20
the higher IP stack, or you will be doing routing which will require=20
modifying your network structure or some (IMHO very nasty) hacks with=20
policy based routing.

> well .... i would like to hear some ideas on how to acchieve my=20
> goals. Can anyone help me on this scenario ?

Take a look at bridged netfilter and see if it will do what you are=20
wanting to do.



Grant. . . .
