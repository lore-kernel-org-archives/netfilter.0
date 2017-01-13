From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Filtering content inside packets , specifically RELATED data in
 the various ICMP TYPE 3 packets
Date: Fri, 13 Jan 2017 12:19:24 +0100
Message-ID: <7a697d77-84f1-2403-37ad-74d53f6ce41a@plouf.fr.eu.org>
References: <d60d0ad0fe82496a86f052993fe2cb9b@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d60d0ad0fe82496a86f052993fe2cb9b@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Le 13/01/2017 =E0 11:52, Andr=E9 Paulsberg-Csibi (IBM Consultant) a =E9crit=
 :
>
> I have detected in my iptables that someone(s) are sending spoofed DNS re=
quest to various targets ( I assume DNS servers ),
> from this I have also counted that this accounts for approximately 25% of=
 all log entries so it would helpful to just DROP
> these prior to the log rule for OUT-OF-STATE / INVALID packets sent to my=
 FIREWALL .
(...)
> Since this system runs named ( a linux based DNS resolver ) , filtering I=
CMP for all DNS could impact valid packets also ...
> ... but my conclusion is that making any filter after the RELATED rules a=
nd also limiting it to the very specific combo
> of only those with source port SPT=3D24116 ( and UDP 53 ) should virtuall=
y make it impossible to go wrong ( at least in theory ).
(...)
> Now the problem is to create a rule that would perform this task , but lo=
oking at the module for string match
> and searching google has left me a bit unsure if I am going in the right =
direction ...

The u32 match may be more precise as it allows to match a pattern at a=20
specific offset.

> Since the IPTABLES normally can find this data in its RELATED function in=
 the STATE-MODULE ,

Conntrack is independent of iptables.
Conntrack sets the state, and iptables just checks it.

But I'd like to ask why do you bother to log such packets ?
