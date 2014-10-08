From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: dyn. SNAT based on different source addresses?
Date: Thu, 09 Oct 2014 00:56:01 +1300
Message-ID: <54352651.4050101@treenet.co.nz>
References: <CAFNHiA83zPCE9KW7U5q7WdPdoJkvkeh0zwF+q6OWD96yWrE8pA@mail.gmail.com>	<5434458A.2030701@ngtech.co.il>	<CAFNHiA_qb-Y8YyvMXKotRfybGSCBA1-v5-B0Jw5sHF9T9XVcGQ@mail.gmail.com>	<201410071827.44706.neal.p.murphy@alum.wpi.edu>	<5434771F.6010301@ngtech.co.il> <CAFNHiA9-omeMK+2P+oadxRMmp1mYXVWSuZAH-XqZnA5Qrdf+NA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFNHiA9-omeMK+2P+oadxRMmp1mYXVWSuZAH-XqZnA5Qrdf+NA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Meike Stone <meike.stone@googlemail.com>, netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 8/10/2014 8:01 p.m., Meike Stone wrote:
>> Except a gre tunnel is not that easy on a Windows TS or at all on
>> a windows machine. The main issue is that he has 200+ machines in
>> one subnet that needs access to the other one...
> 
> Not exactly, the terminal servers are located in different subnets
> in one company, so NETMAP here is suboptimal  ....
> 
>> 
>> The options I now that works in windows are pptp(with internal
>> GRE), l2tp, openvpn and maybe couple others.
> 
> Thanks for the ideas. But tunnels are not an option. Admins on TS
> are running the strategy "never change a running system", because
> the TS are fragile ...
> 
> Routing betwenn the two companies is not possible (overlapping ip 
> networks, different security policies, ..) Thats is the reason for
> the DNAT rules ... The TSs access to the fileserver over a IP in
> the own network.
> 
> Thought, I can solve the porblem with iptables ... iptables is so
> mighty ...

Have you considered implementing IPv6 on both of the networks? It is
designed to resolve just this type of problem set.

AYJ

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (MingW32)

iQEcBAEBAgAGBQJUNSZRAAoJELJo5wb/XPRjxF4H/j/bpGoiYZQ3q0H94qjuE+Rq
bJrAwXgHqDoSTSs8h0FzunFlVnDVh1ylDHNMmHhhVAI9RjZ18VdorwXrGieZqQuG
i3B0JNFyFj/AZUaNu6GlhPdkGNdAWFokFkcq2BGEOZ3E1XV3JoQ7+vrrZXBKY6vC
5bV8WRLnNa3fvWPP+wPcy32xDNAly6Jbo1uBYWIlROUcfXMfpsahXCxEQ/vTThMk
c86gtQ+KtEya2v/vr+HGetMwPxUdzCXUPmKk74gLwgNfK1aU+cN7NbvAxSBTh2BG
UqhnSmM5b7JlXDW6dZA09dmadl4gDQgLpVjFLobU7+kgM2ViSW6MUuEFd5aWKSc=
=Ntme
-----END PGP SIGNATURE-----
