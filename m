From: Eric Paris <eparis@parisplace.org>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 14:58:53 -0400
Message-ID: <AANLkTinU9q63SxdTKKUnmSPvEASeC0EZy_apx8TZO+f2@mail.gmail.com>
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
	<AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com>
	<alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr>
	<AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com>
	<alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr>
	<AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com>
	<alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org, sds@tycho.nsa.gov

On Thu, Sep 23, 2010 at 2:57 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Thursday 2010-09-23 20:52, Eric Paris wrote:

>>No, the question was more basic. =A0What is the userspace tool?
>
> git://git.netfilter.org/libnetfilter_conntrack is the library where
> CTA_SECMARK is parsed (when receiving from kernel) - parse.c - and bu=
ilt
> (when sending to the kernel) - build.c, and
>
> git://git.netfilter.org/conntrack-utils makes use of that library and
> provides the actual conntrack(8) binary that people run.
>
> `./conntrack -L` is then what you use to test the changes.

That's perfect thanks!

-Eric
