From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] MSS clamping rule possible in
 the inet family table?
Date: Wed, 5 Feb 2020 12:46:33 +0000
Message-ID: <801ea275-a5b0-4c49-f772-eb7632431ff3@gmx.net>
References: <3716a5fa-e7e7-5220-06c1-a651ee6b576f@gmx.net>
 <20200205112612.GB26952@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580906794;
        bh=1V8H2ptjhbsJoq776c7llniDzrDmuNn1FMINkvtti0U=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=SWwGaiGV9k+0qftVhX6I39V7PE+reHAqdLeToJyTAMc2OIrttQ8uqqt7RQOOflzms
         GztvFxqc6kuc8VLU11G00hE/OEACt53LHeGG9UD/fy8TRNaFLOUhUmvUvNKeWAZant
         2JcjhAR1hDnZRxq9V1ODpF0F1iAuRnUmsz2sa5cs=
In-Reply-To: <20200205112612.GB26952@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 05/02/2020 11:26, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> WIKI [1] stipulates the rule in the ip family table, perhaps logical s=
ince
>> it applies to IPv4 only, It is however possible to include the rule in=
 the
>> inet family table?
>>
>> Having it implemented in
>>
>> table inet filter {
>>  =C2=A0chain input =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 =C2=A0 { oif pppoe-wan tcp flags syn tcp option maxseg
>> size set 1400; }
>> }
>>
>> does not throw an error but it does not work either.
> That chain isn't hooked up, its missing the 'type filter hook input
> priority 0;' part.

It is hooked, in the spirit of brevity skipped that code portion having=20
composed the initial message to the mailing list.

>
>> Then tried instead (inet family)
>>
>> { oif pppoe-wan ip protocol tcp flags syn tcp option maxseg size set 1=
400; }
>> { oif pppoe-wan ip protocol tcp flags syn ip protocol tcp option maxse=
g size
>> set 1400; }
>>
>> But either throwing
>>
>> Error: syntax error, unexpected flags, expecting newline or semicolon.=

>> { oif pppoe-wan ip protocol tcp flags syn tcp option maxseg size set 1=
400; }
> This is: oif =3D=3D pppoe-wan
>           ip protocol =3D=3D tcp
> 	 flags syn # invalid, should be "tcp flags syn"
>
>> What am I missing to get this to work in the inet family table?
> Did not try it but it should work, there is nothing ip/ipv6 specific
> in the tcp option code.

It does not work in the inet family table but does in the ip family table=
;

* rule when deployed with the _ip family_ -> packet capture shows the=20
packet size as set/stipulated in the rule
* rule when deployed with the _inet family_ -> packet capture does not=20
show the packet size as set/stipulated in the rule

As far as I can comprehend IPv6 does not require MSS clamping due to its =

build-in Path MTU Discovery which is not mandatory for IPv4. It would=20
thus probably not make sense to apply MSS clamping to IPv6.


