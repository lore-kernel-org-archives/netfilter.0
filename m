From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: Order of iptables vs. ip6tables chains
Date: Fri, 23 Jan 2015 23:38:28 +0100
Message-ID: <54C2CD64.5000104@familie-kuntze.de>
References: <20150123223116.GA3522@blackhole.tracing.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150123223116.GA3522@blackhole.tracing.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Preissler <thomas@preissler.co.uk>, netfilter@vger.kernel.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Thomas,

Inside chains it's top to bottom.
This [1] picture shows where the chains are used.
Also, IPv4 traffic is only handled by iptables rules and IPv6 traffic
obviously only by ip6tables rules. iptables only handles ip traffic, no=
t decnet or any
other fancy layer three protocol.

Mit freundlichen Gr=C3=BC=C3=9Fen/Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
=46ingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658

Am 23.01.2015 um 23:31 schrieb Thomas Preissler:
> Hello folks,
>
> I am wondering in which order are iptables/ip6tables rules executed?
> So for example I have the same rules on v4 and v6 on INPUT and FORWAR=
D
> matching MAC addresses, interestingly only ipv4's counters are <> 0.
> (I know about ebtables.)
>
> So I guess the order is v4 INPUT then v6, after that v4 FORWARD then =
v6
> - for example?
>
> And yes, I can't wait for nftables to go live...
>
>
> Kind Regards
>
> Thomas
>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUws1iAAoJEDg5KY9j7GZYJqoP/iXHk1uLvEiTVmVpQWQ+bTTC
nc5Yca6cpmRXvBgg5F7k8XK1v4dIbWv2TYPtPA5Sd+UvYIsqq/bFOSwj2nsoqd7k
0p/x6QIpZ2C48uieBJ0mBc8T7aQLSq3jdMnHwxXcKr6iw87xDHKeuvipKNLuLJ0b
c63oh6DgDb+i5z4bVQkTnW1/QAvAohJW4tKmYpMIAB44TN5Ow7cDKH7ZcEdsVrf9
j4RZDovNDMquGH7BjycQhRaBHRUZnB+jfObJ1BkfQn3YbzuqUnnyamU9OjO1bE6k
=46RrQ6qnd9/eQww62ADKiBNYTDuVOpfPcLFsdFepP0IhzOuqYlkss7CkrCZMVoPkp
x59sQZTR3Y4/PEwUPB/iNdZn4dd2+kYzW4r4LdEpWDL0vQngARcZw4Ze44FBO9D0
ZEwu/L5sRqtIaInaC++QhoTVCHsjuDs75L0PehC48CKHLN+8HU8R+rNswky0dA/s
iNHU9RxtEsXRLReq0WtmVweMha9ZKooOD7FP/R1BfxZzAhRKp86ZxhA1ycL6fzNd
=46zsRz+xt2hsmzcIPHNrJuYaDFP0N7hsISsSa8+B6MvcaXUGxgyCkAfXW6TPzvge6
gOgW8/Cp+tpIjHwSAQLhOxWGTDeNMUlxw5UVzv2/o6BK8lBInICEhd8oE4Egw1Iv
zMjNjY3a8MIVhC26vNJO
=3DzGrw
-----END PGP SIGNATURE-----

