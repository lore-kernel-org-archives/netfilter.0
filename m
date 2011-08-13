From: Benjamin <benjo11111@gmail.com>
Subject: Re: use of socket tag in iptables
Date: Sat, 13 Aug 2011 11:15:00 +0530
Message-ID: <4E460F5C.1080107@gmail.com>
References: <CAARrgqwjUWYRyuKL66ErnmnmnJ=1f1y2ZcmTH25-5yc0Pp9iqw@mail.gmail.com> <alpine.LNX.2.01.1108091849230.19560@frira.zrqbmnf.qr> <4E4210D1.5060007@gmail.com> <alpine.LNX.2.01.1108130047130.27527@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=OxKp9x7pazK6ZO9/sQ8FnVGQ9rOza1IYl17lMt25d5I=;
        b=i+Ztwol+FfN3Vc+F2XPwH71sArDC8Id0CHd/5X5NMUjqtMNY0e/xZ+6bW8OXjVPkxg
         lO4zLpBYJ8azNNA02xAxI51Bl8o+HzT9Uwq1HhADnu7BmfolfnFdJLMOEszZsPDH5bxX
         20Q4P9KD7qns4NDGjVej4kT5oqYy+o31MkMLI=
In-Reply-To: <alpine.LNX.2.01.1108130047130.27527@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

  On 08/13/2011 04:18 AM, Jan Engelhardt wrote:
> On Wednesday 2011-08-10 07:02, Benjamin wrote:
>
>> Hi,
>>
>> Thanks for your kind response.Actually i m looking for proxy with tproxy
>> capability.So from squid wiki i got some iptabales rules that they used for
>> tproxy in that rules they use socket and tproxy tags.So I am wonder that how it
>> is happend means what's the exact role of socket options.
> Tag is not a recognized term in conjunction with socket and tproxy.
> And socket options are something different.
Hi,

Please guide me for that what is the purpose of socket option in 
iptables.Is there any document or examples of that.

Thanks,
