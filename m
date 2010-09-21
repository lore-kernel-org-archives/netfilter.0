From: Eric Paris <eparis@parisplace.org>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 19:10:24 -0400
Message-ID: <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com>
References: <4C9696E5.4030803@googlemail.com>
	<alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>
	<4C973A6A.9010809@googlemail.com>
	<alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>
	<4C9756AB.5040304@googlemail.com>
	<4C97D6D6.9040805@shorewall.net>
	<alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>
	<4C988214.6050600@googlemail.com>
	<4C9911CE.6090209@googlemail.com>
	<AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
	<AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
	<alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org, sds@tycho.nsa.gov

On Tue, Sep 21, 2010 at 6:42 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Tuesday 2010-09-21 23:00, Eric Paris wrote:
>>
>>My current patch looks like so:
>>
>>cat /proc/net/nfs_conntrack
>>
>>ipv4 =A0 =A0 2 udp =A0 =A0 =A017 8 src=3D10.11.231.82 dst=3D10.11.255=
=2E156
>>sport=3D34095 dport=3D53 src=3D10.11.255.156 dst=3D10.11.231.82 sport=
=3D53
>>dport=3D34095 mark=3D0 secmark=3Dsystem_u:object_r:unlabeled_t:s0 use=
=3D2
>
> I think that rather than bloating ancient procfs files with more info=
,
> the respective userspace tool should be augmented by secmark name
> resolution instead. Then we would also not need change anything insid=
e
> the kernel, or its interfaces to userspace.

It is not possible for userspace to resolve these numbers to something
useful.  They are dynamically generated numbers which are just kernel
internal helpers.  This is the only known place that the kernel shows
its underpants to in public and it should be fixed.  My only question
is if fixing like this it is likely to break anything.  Otherwise I'm
going to hard code those to 0 or 1 and export the label in a new
field....

-Eric
