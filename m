From: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>
Subject: Re: Iptables 1.3.6 outgoing dns issue
Date: Wed, 09 Dec 2009 17:35:02 +0100
Message-ID: <4B1FD1B6.1090205@freemail.hu>
References: <1260360604.2853.35.camel@office-nmg03-v200>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1260360604.2853.35.camel@office-nmg03-v200>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "M. Arts - Rootnet" <marco@rootnet.nl>
Cc: netfilter@vger.kernel.org

Hi!

Could you please tell us in which table - which chain is this rule?

Swifty

M. Arts - Rootnet =C3=ADrta:
> IPTables Version: 1.3.6 running on Debian Etch
> Kernel Version: 2.6.18.8.xs5.5.0.13.442
>
> I'm having some issues capturing outgoing DNS traffic, I've tried
> capturing it by means of both sport and dport, but the rules simply
> don't get triggered, instead they get logged by my logfile trying to
> catch anything i've missed.=20
>
> An example of this:
> pkts bytes target     prot opt in     out     source
> destination        =20
>   0     0 ACCEPT     udp  --  any    eth0    anywhere
> anywhere            udp dpt:domain=20
>
> Logs:
> Dec  9 12:16:48 vps kernel: IN=3D OUT=3Deth0 SRC=3Da.b.c.d DST=3D80.2=
47.205.5
> LEN=3D63 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D61646 DF PROTO=3DUDP SP=
T=3D33702 DPT=3D53
> LEN=3D43=20
> Dec  9 12:16:53 vps kernel: IN=3D OUT=3Deth0 SRC=3Da.b.c.d DST=3D212.=
79.236.165
> LEN=3D63 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D62146 DF PROTO=3DUDP SP=
T=3D33703 DPT=3D53
> LEN=3D43=20
>
>
> Anyone got any idea what might be causing this?=20
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

