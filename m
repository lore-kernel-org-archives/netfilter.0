From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: Re: get byte count per rule and ip address
Date: Sat, 15 Jan 2011 16:41:59 +0000
Message-ID: <AANLkTi=2RQhbjMp8+57XWzZR2=xxXvXozxFP1UOKbjZx@mail.gmail.com>
References: <alpine.LNX.2.01.1101151541160.27274@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=K4VyEeZwXR+oVfgDyvV/S5k/jk342zaXJI4xlu0ltf0=;
        b=hwLbUmZ3DCU8GbXtTXubPU0CgBlaQ/Z+THW8Bz6NSBhyIYH7wvbFQhfrp8wlUMzHDU
         C8fQ6xOM5wIICmzZteb4F65HvffnOvKL1pydprMnYjMfYEUfNPRF/FFpHouTsEMZ6DKq
         mf6+Tj0i0OpPCse1t6wkgDYXfYWckmKQgch0M=
In-Reply-To: <alpine.LNX.2.01.1101151541160.27274@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Thank you for your reply could you give me more detail about xt_ACCOUNT=
=2E
regards.

2011/1/15 Jan Engelhardt <jengelh@medozas.de>:
> Don't strip the Cc list.
>
> On Saturday 2011-01-15 15:20, Mamadou Tour=C3=A9 wrote:
>>
>>>> On 16/01/11 01:09, Mamadou Tour=C3=A9 wrote:
>>>>> Hi, all
>>>>> i've these rule :
>>>>> r1 : iptables =C2=A0-t mangle =C2=A0-A POSTROUTING =C2=A0 =C2=A0 =
-m layer7 --l7proto =C2=A0bgp
>>>>> -j MARK --set-mark 1
>>>>> r2 : iptables =C2=A0-t mangle =C2=A0-A POSTROUTING =C2=A0 =C2=A0 =
-m layer7 --l7proto =C2=A0biff
>>>>> =C2=A0-j MARK --set-mark 2
>>>>>
>>>>> for both r1 and r2 I'd like to get the byte count of packets that=
 have
>>>>> match rules.
>>>>> also i'd like to get byte count of packets according to the IP ad=
dress.
>>>>> I need your help plz.
>>>>
>>>> -v shows the packet counters and extra details.
>>>> =C2=A0iptables -v -L POSTROUTING
>>>
>>> Better use iptables-save -c for that.
>>
>>OK.
>>but how do I get packet count for an IP address.
>>thet problem is that I don't know exactly the IP that passthrough the=
 box.
>>regards.
>
> Use something like xt_ACCOUNT.
>
