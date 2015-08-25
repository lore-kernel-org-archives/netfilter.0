From: Kevin Holly <root@hallowe.lt>
Subject: Re: ip6tables reject targets
Date: Wed, 26 Aug 2015 00:58:40 +0200
Message-ID: <55DCF320.3040104@hallowe.lt>
References: <1440538307.28787.18.camel@lusan.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1440538307.28787.18.camel@lusan.id.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

On 08/25/2015 11:31 PM, Nikolai Lusan wrote:
> Does anyone know what valid options there are for the ip6tables reject
> target?

You can find the valid options in the ip6tables help. Remember that you can always use -h/--help to show also manual-like help information about modules, for example "iptables -m conntrack -h"

root@mail:~# ip6tables -j REJECT -h
ip6tables v1.4.14
[...]
REJECT target options:
- --reject-with type              drop input packet and send back
                                a reply packet according to type:
Valid reject types:
    icmp6-no-route              ICMPv6 no route
    no-route                    alias
    icmp6-adm-prohibited        ICMPv6 administratively prohibited
    adm-prohibited              alias
    icmp6-addr-unreachable      ICMPv6 address unreachable
    addr-unreach                alias
    icmp6-port-unreachable      ICMPv6 port unreachable
    port-unreach                alias
    tcp-reset                   TCP RST packet
    tcp-reset                   alias



Best regards

Kevin Holly - root@hallowe.lt - http://hallowe.lt/
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJV3PMgAAoJELAaqP3QtzpMrbIIALd6ARJe+FayKBAPPxm5AhZ1
QUJmFT0mvpxg0CkLVACZJXxT9wgS2y9ozF73BTBCyhlibVmCAnEm+HiudrtD9LUd
HFR+YwdIDPUc9aosAv6TSp5fjTzbQAiNi6O/dn8bQJolbEGn4FibwviX4Ew67zIX
IBAvIxN5uzfCDFmnpdh8vZIRyBgvnxK+keGhB8EsSgs1T9AliIc+UNEThulTq+o5
t0SOEcV9HkpQH3D9ayOS5zU68l2Q6FdWtxiGj3HnqquM8y44RoirEuCp6uNlx73b
taAffPHgE0SO8vXvjEpICtKnDkKZhvM6MyFg6jjRx3nTbFPm62bPaalDVUjlSGY=
=hx+C
-----END PGP SIGNATURE-----
