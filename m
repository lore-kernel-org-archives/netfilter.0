From: Javier Almillategui <jalmillategui@mac.com>
Subject: Re: kernel panic when adding QUEUE to OUTGOING
Date: Wed, 04 Nov 2009 09:45:39 -0500
Message-ID: <EA91EDDC-4606-40CA-8244-D8DE576FFBA9@mac.com>
References: <1257332494.1254.218.camel@francois.tc.commsmundi.com>
 <4AF163EE.7060306@trash.net>
 <1257337891.1254.220.camel@francois.tc.commsmundi.com>
 <4AF183A7.5060005@trash.net>
 <1257342875.1254.224.camel@francois.tc.commsmundi.com>
 <4AF18937.5010901@trash.net>
 <1257345155.1254.245.camel@francois.tc.commsmundi.com>
 <4AF19253.5050107@trash.net>
 <1257345852.1254.254.camel@francois.tc.commsmundi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <1257345852.1254.254.camel@francois.tc.commsmundi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: fdelawarde@wirelessmundi.com
Cc: Patrick McHardy <kaber@trash.net>, netfilter@vger.kernel.org

or putting imq in the module blacklist so it is not loaded by default.

On Nov 4, 2009, at 9:44 AM, Fran=E7ois Delawarde wrote:

> On Wed, 2009-11-04 at 15:40 +0100, Patrick McHardy wrote:
>>> It might be worth noting that the kernel is patched with IMQ, lates=
t
>>> version from linux-imq.net, but the IMQ device is not used.
>>
>> This is most likely the cause.
>
> Does it affect even if the devices are not used at all? I can still
> reproduce doing an "rmmod imq" before anything.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
=20
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

