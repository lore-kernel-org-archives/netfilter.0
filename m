From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: RHEL backported '--queue-bypass'
Date: Sun, 29 Jul 2012 20:11:01 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207292006350.18302@frira.zrqbmnf.qr>
References: <CANaOheaxLhfPwXf0f7P=8HZn+wj4A94PqVfV2uqcBD5ypAA7hA@mail.gmail.com> <CANaOheZZXP1sCTTD4LAJkFPaOX-yfXGdH4jqu-2xC+3vT0weaA@mail.gmail.com> <alpine.LNX.2.01.1207291829030.2056@frira.zrqbmnf.qr> <CANaOheYPA0o6n5oyS2vFJ1knFWCBo98XwZ1aG_95HyLcyUz_Jg@mail.gmail.com>
 <alpine.LNX.2.01.1207291937080.14123@frira.zrqbmnf.qr> <CANaOheaDK5znOzq-S5WEH--8N2RMbc5avOfBMJi3mJKcPzMgdA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANaOheaDK5znOzq-S5WEH--8N2RMbc5avOfBMJi3mJKcPzMgdA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kay <kay.diam@gmail.com>
Cc: netfilter@vger.kernel.org

On Sunday 2012-07-29 19:52, kay wrote:

>Do you mean that if I compile latest iptables for 2.6.32 kernel
>everything will work?

Where does it say that it would not?
It should even work with linux 2.4 (once you got it compiled), but we 
don't bother testing that old piece of software.

Do you actually work for Redhat or how did it came you came about with 
"RHEL backported --queue-bypass"?

Oh, and in these circles of Internet, we don't top-post like you did.

>
>2012/7/29 Jan Engelhardt <jengelh@inai.de>:
>> On Sunday 2012-07-29 18:42, kay wrote:
>>
>>>New iptables require new kernels
>>
>> No it does not.
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
