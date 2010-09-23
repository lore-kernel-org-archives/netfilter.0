From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Thu, 23 Sep 2010 20:57:55 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009232054180.16976@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net>
 <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com> <4C9911CE.6090209@googlemail.com> <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com> <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
 <alpine.LNX.2.01.1009220041490.23976@obet.zrqbmnf.qr> <AANLkTim4b06FySMibSw-4sZdUqtPMmfQFtt94kAgAtr=@mail.gmail.com> <alpine.LNX.2.01.1009220130370.25442@obet.zrqbmnf.qr> <AANLkTimgV+ZURC+G_R2NOqUmMYQzuDOub7hB35yJS27u@mail.gmail.com>
 <alpine.LNX.2.01.1009232045150.16976@obet.zrqbmnf.qr> <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin+7TrO3BgsCaWn7MfkMjqPYK+1ipu6WozViyxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Eric Paris <eparis@parisplace.org>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org, sds@tycho.nsa.gov

On Thursday 2010-09-23 20:52, Eric Paris wrote:

>On Thu, Sep 23, 2010 at 2:49 PM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
>> On Thursday 2010-09-23 20:39, Eric Paris wrote:
>>>>>
>>>>> =C2=A0Otherwise I'm
>>>>>going to hard code those to 0 or 1 and export the label in a new
>>>>>field....
>>>>
>>>> The allocated secmark nlattr value should not be reused;
>>>> it's easy to use a new nla id for the secname and omit
>>>> transmission of secmark in nl chatter.
>>>>
>>>> For ye olde /proc/net/nf_conntrack, we can just remove secmark
>>>> altogether because userspace does not depend on it.
>>>
>>>How does one use the secmark netlink socket? =C2=A0How do I test my =
code?
>>>I'm sure this is an obvious question for most of you, but not for me
>>>:)
>>
>> There exists a CTA_SECMARK in nfnetlink_conntrack.h. You leave that
>> as-is, and add a new CTA_SECNAME. Subsequently, in
>> nf_conntrack_netlink.c, you replace NLA_PUT_BE32(skb, CTA_SECMARK, .=
=2E.)
>> with the appropriate NLA_PUT_STRING(skb, CTA_SECNAME, ...) or whatev=
er
>> the nla_put routine was called. Adjust the preallocation size too:
>> - =C2=A0 =C2=A0 =C2=A0+ nla_total_size(sizeof(u_int32_t)) /* CTA_SEC=
MARK */
>> + =C2=A0 =C2=A0 =C2=A0+ nla_total_size(??) /* CTA_SECNAME */
>>
>> and that should do it for the kernel side. Simiarly on the userspace
>> side.
>
>No, the question was more basic.  What is the userspace tool?

git://git.netfilter.org/libnetfilter_conntrack is the library where=20
CTA_SECMARK is parsed (when receiving from kernel) - parse.c - and buil=
t=20
(when sending to the kernel) - build.c, and

git://git.netfilter.org/conntrack-utils makes use of that library and=20
provides the actual conntrack(8) binary that people run.

`./conntrack -L` is then what you use to test the changes.

Hope that helps,
Jan
