From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: Dropped packets logged which should be accepted by Conntrack
Date: Wed, 16 Nov 2011 09:20:37 -0600
Message-ID: <CAG61UF9oV32+XpAPSJznBWqwyFyQDmGyAmspxwTqE40cj6u0LA@mail.gmail.com>
References: <1321326448.2936.43.camel@denise.theartistscloset.com>
	<4EC23515.8020808@freemail.hu>
	<1321361861.2936.68.camel@denise.theartistscloset.com>
	<CAG61UF-BmX38MbC=5MUsBkWD3Fixx7-=AENxHKtbRi9TX7NzmA@mail.gmail.com>
	<1321445273.2936.83.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=6qgqvasVAKYgHwfTYOGVjD+clixhXQ08z6Ly9Jem45o=;
        b=CNiJk8+SYtjut3F+wkC7sK2FdkBWFpqolXIju5YQrNNFMRM7ZcNE4v4/G5YbfWdWaE
         2xENXheiRbeb/E8z3dugArta38YHftqhAg6TapA2ngcc7L5ZokVGAcDUlDsH8oYOh93Y
         nlv3MJ4PKfs9rYH3FxkMd/klFAAfe61Evxt4Y=
In-Reply-To: <1321445273.2936.83.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: netfilter@vger.kernel.org

The logs are consistent with the problem of manipulating the MSS and th=
e PMTU.

The packets are the out-of-band transmission of segments of data that
can not fit in a single tcp packet.

The TCP_NODELAY option is available beginning the Linux kernel 2.5.71.
That option forces the transmition of packet with small amount of
data.

Jorge D=E1vila.

El d=EDa 16 de noviembre de 2011 06:07, John A. Sullivan III
<jsullivan@opensourcedevel.com> escribi=F3:
> On Tue, 2011-11-15 at 10:20 -0600, Jorge D=E1vila wrote:
>> John,
>>
>> The particular thing I see in the logs is they shows the flag DF
>> (Don't Fragment).
>>
>> My first guess is the TCPMSS rule is the responsible for generating =
the logs.
>>
>> Maybe adjusting the mtu for the interfaces will solve the problem.
>>
>> Jorge.
> <snip>
> Thanks, Jorge. =A0However, the packets are quite small and should not=
 be
> having a problem with DF. =A0I thought, perhaps, they were RSTs and m=
aybe
> those were not considered RELATED but that is not always the case:
>
> No Match: IN=3Dbond4 OUT=3Dbond3 SRC=3D172.x.y.34 DST=3D187.15.198.12=
7 LEN=3D117
> TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D20811 DF PROTO=3DTCP SPT=3D25 DP=
T=3D2307
> WINDOW=3D5840 RES=3D0x00 ACK PSH URGP=3D0
>
> No Match: IN=3Dbond4 OUT=3Dbond3 SRC=3D172.x.y.34 DST=3D180.252.147.1=
49 LEN=3D55
> TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D60912 DF PROTO=3DTCP SPT=3D25 DP=
T=3D19445
> WINDOW=3D5840 RES=3D0x00 ACK PSH URGP=3D0
>
> Here are two examples of packets being logged from our public SMTP
> gateway with tiny packet sizes and no unusual flags.
>
> Any other ideas, anyone, of why we would be seeing these logs when we
> would suspect these packets should be ACCEPTed at the very beginning =
of
> the FORWARD chain with a -m state --state RELATED,ESTABLISHED -j ACCE=
PT
> rule? Thanks - John
>
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
