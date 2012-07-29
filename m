From: kay <kay.diam@gmail.com>
Subject: Re: RHEL backported '--queue-bypass'
Date: Sun, 29 Jul 2012 21:52:35 +0400
Message-ID: <CANaOheaDK5znOzq-S5WEH--8N2RMbc5avOfBMJi3mJKcPzMgdA@mail.gmail.com>
References: <CANaOheaxLhfPwXf0f7P=8HZn+wj4A94PqVfV2uqcBD5ypAA7hA@mail.gmail.com>
 <CANaOheZZXP1sCTTD4LAJkFPaOX-yfXGdH4jqu-2xC+3vT0weaA@mail.gmail.com>
 <alpine.LNX.2.01.1207291829030.2056@frira.zrqbmnf.qr> <CANaOheYPA0o6n5oyS2vFJ1knFWCBo98XwZ1aG_95HyLcyUz_Jg@mail.gmail.com>
 <alpine.LNX.2.01.1207291937080.14123@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type;
        bh=9dscoM2KY0oEnhnNz425oAbee7qt7QVxkCu1awd5FWg=;
        b=aUj0G+amkA2raYR2agdVr0AQCApkG5+NC+2N0CAxuRh/CmFm/0+0/Gy4zKuE2FumUw
         gmU7dxj4ay0RTh6ndBAFatigthxBjpqQSjGj886In++rY7wrj7ORI144rHv/zySSUuBq
         daI24zgWiUBW/V7rCtKNKKFak1XQ7JL7D4R2iULC8oSheFJLN4wPo5k3aWY37VSAJD/S
         kWzxcm4A1hGiPXZxuBMW/iRCwqETsB4K2fMfdlFR+Gghc6mBMWFSUBqcQUvtdC37RgNf
         4BYfGu+o7WvsXXOY1bSft8tJPgp+68mpOlL+K40A/GjzufxaB2U04vLOkQOmHatEbnbC
         NYpw==
In-Reply-To: <alpine.LNX.2.01.1207291937080.14123@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Do you mean that if I compile latest iptables for 2.6.32 kernel
everything will work?

2012/7/29 Jan Engelhardt <jengelh@inai.de>:
> On Sunday 2012-07-29 18:42, kay wrote:
>
>>New iptables require new kernels
>
> No it does not.
