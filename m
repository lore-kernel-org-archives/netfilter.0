From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Static mapping of private subnet to different private subnet
Date: Tue, 04 Nov 2014 18:23:27 +0100
Message-ID: <54590B8F.2060703@familie-kuntze.de>
References: <F1992426-119C-4B69-ACE5-44772A062125@tannador.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F1992426-119C-4B69-ACE5-44772A062125@tannador.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Tannador <mail@tannador.com>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Tannador,

Did you look at the NETMAP iptables target?

Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 04.11.2014 um 15:47 schrieb Tannador:
> Hello list,
>
> I am currently tinkering with a system that has two network interface=
s which are both configured by the remote peer (DHCP and PPP). Now, I a=
m facing the scenario that I might be assigned the same private network=
 on both interfaces.
>
> I would like to transparently map the ip adresses of incoming packets=
 on one interface to a different private network. That is, for applicat=
ions, it should look like the interface has been assigned to this diffe=
rent private network.
>
> Example
> nif0 (nif =3D network interface)
> IP 192.168.1.145
> Gateway 192.168.1.1
> DNS1 192.168.1.2
> DNS2 192.168.1.3
>
> nif1 (before mapping)
> IP 192.168.1.203
> Gateway 192.168.1.3
> DNS1 192.168.1.3
> DNS2 192.168.1.54
>
> nif1 (after mapping to 10.0.0.0/8)
> IP 10.168.1.203
> Gateway 10.168.1.3
> DNS1 10.168.1.3
> DNS2 10.168.1.54
>
> In essence, I would like to provide a network address and a subnet ma=
sk and have the corresponding parts of all ip addresses on a certain in=
terface mapped. Such that 192.168.1.3 is mapped to 10.168.1.3 iff the p=
acket is received via nif1. Since this is a purely static operation, I =
guess it cannot be that difficult.
>
> My first approach was to use NAT but that does not seem to do the tri=
ck. After a lot more googling, I give up. Am I looking at the wrong pla=
ces? Do I have to use MANGLE or RAW on PREROUTING and POSTROUTING?
>
> I would write a script that is called whenever on link is configured =
by the remote peer. So I am able to change rules whenever there is a co=
llision.
>
> I can hardly believe to be the first to ask this question but I am un=
able to find a solution anyway :/
>
> Kind regards,
> tannador

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUWQuOAAoJEDg5KY9j7GZYTGkP/AjnmpZX74mqiYeJonWVUa23
qboYAssLW1XiSPGSdJT+DzG3axSELslWPf4ek7Rj5uJCe8XJTeWpUnTDmGd+lu2W
r7vtCVr3aUpxe8HcdYugvfOptBzhteQCz3I7F6iNg/mGBUp6siCnBbutBYyfIEFg
e1myXEooEQa9IN6JhnIEpa27Bj9gWEEW3rjBD78hytrJLw+wQXwHznl1dpGGYqlB
J82HEOcIWRb1aNcmeC/SxABI/cm3HxRmwSBGfK5lQkDbCSOwgMZ45u8OnYspLb6a
/cjkUbbS4q/yIHHNThcTTKstaH8AJRlZu5qvog0Kn3BN2guDJ7/BxI+/twekL3EY
gHr1Hf5Z1rTkpiADmHE/6SME8fHxEjNWKD+Ec6viYudAWUehGs47vF8OdmW/J9pn
MEVpqN+Y1lOnT4R3nqGd/W0BtK/EilWSxfcLURcBTeKKbcxTyubT9gkGqLn2doGa
kJe6xd2Xo1rm/L8xJF4LK/ka7ZetMzfbHuNs+S/LdOXPrxeQzeF33dmFbx+66U26
RhwojgxtltySaCO/zeRC7rtmyMK0S5dHOgBpyJZvvfrmSTHBokNcnLWRR2AViMiw
8vQx58VGjx83APahynTb5L+p4GgsYfvSv9RiXo0o9cuZh8Kr61UM5vo4Zt/1jqhA
CPm4MUB4n/qIXPSyNEks
=3D3qMw
-----END PGP SIGNATURE-----

