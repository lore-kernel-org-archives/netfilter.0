From: kay <kay.diam@gmail.com>
Subject: Re: RHEL backported '--queue-bypass'
Date: Mon, 30 Jul 2012 09:07:30 +0400
Message-ID: <CANaOhea_i8JbsHLMC5hv0HXWNVUJEjvqnxFt64H1r_wcFeS-rw@mail.gmail.com>
References: <CANaOheaxLhfPwXf0f7P=8HZn+wj4A94PqVfV2uqcBD5ypAA7hA@mail.gmail.com>
 <CANaOheZZXP1sCTTD4LAJkFPaOX-yfXGdH4jqu-2xC+3vT0weaA@mail.gmail.com>
 <alpine.LNX.2.01.1207291829030.2056@frira.zrqbmnf.qr> <CANaOheYPA0o6n5oyS2vFJ1knFWCBo98XwZ1aG_95HyLcyUz_Jg@mail.gmail.com>
 <alpine.LNX.2.01.1207291937080.14123@frira.zrqbmnf.qr> <CANaOheaDK5znOzq-S5WEH--8N2RMbc5avOfBMJi3mJKcPzMgdA@mail.gmail.com>
 <alpine.LNX.2.01.1207292006350.18302@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=p6mmH88/B7wNqPFzb5UM/S9+0SzMvCUujqNRp1XqSmI=;
        b=GqZfis9Sctp8EogSJlnU+umn65ySgftXR2ifF9tGm873fZbKKNbjyfaoD6zbUm3pfm
         2CNFKOYdKJPJbCA8NvUq/U2Hlu0BHyFOmug1ek4Z7I01u8nBjMHOpFaIXlaL+KbXpYp2
         RNNxwHxu8cBKZjWUO+j4oYBeODSY+7foji6n2CbEfaZ49eo8vlUmJ5zgp+GGBB/tjzaJ
         9KTR/sUPUX+OJ+mygqpIxDlzh1eRT683jYDriK7SAVTZd5JCGRCsDn6AX3v62djcC0G4
         QOAt+XwHxLw1nD9D4MD6aoZIPYsyZTTMrOB2AaAubyjQ8OzI3OaPk4n2ctsCzdAR/Hm1
         QsGA==
In-Reply-To: <alpine.LNX.2.01.1207292006350.18302@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have asked Florian how to backport that functionality and he
provided me with the  origin kernel patches, so I'm not sure that new
iptables rule will work on old kernel. Anyway I got extra skills.

As for the topic theme, that's my poor english, I'm not working on
redhat, just use their kernel. Sorry for confusing.

Regards.

2012/7/29 Jan Engelhardt <jengelh@inai.de>:
> On Sunday 2012-07-29 19:52, kay wrote:
>
>>Do you mean that if I compile latest iptables for 2.6.32 kernel
>>everything will work?
>
> Where does it say that it would not?
> It should even work with linux 2.4 (once you got it compiled), but we
> don't bother testing that old piece of software.
>
> Do you actually work for Redhat or how did it came you came about with
> "RHEL backported --queue-bypass"?
>
> Oh, and in these circles of Internet, we don't top-post like you did.
>
>>
>>2012/7/29 Jan Engelhardt <jengelh@inai.de>:
>>> On Sunday 2012-07-29 18:42, kay wrote:
>>>
>>>>New iptables require new kernels
>>>
>>> No it does not.
>>--
>>To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>the body of a message to majordomo@vger.kernel.org
>>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
