From: John Ratliff <john@bluemarble.net>
Subject: Re: linux martian packets
Date: Thu, 8 Feb 2018 07:33:58 -0500
Message-ID: <1b128f90-9313-7ab5-eb4d-895d70f90971@bluemarble.net>
References: <62fbf8b2-9536-6bf4-9fb1-825307d29262@bluemarble.net>
 <20180207230211.GA2303@dimstar.local.net>
 <CAC5zRjMcKGLvQDtc63mbYi_JNak=uThjUV9hNgVfOs+jXsoUFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAC5zRjMcKGLvQDtc63mbYi_JNak=uThjUV9hNgVfOs+jXsoUFQ@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rob Thomas <xrobau@gmail.com>, netfilter@vger.kernel.org

On 2/8/2018 1:44 AM, Rob Thomas wrote:
>> Yes indeed - tcpdump gets in before any of the iptables rules so you will see
>> incoming packets that are subsequently dropped.
>>
>> You must have an iptables rule that is dropping them, so I suggest to use watch
>> of iptables -L to see which rule increments its counter when you ping from 10.9.
> 
> It's also possible that the kernel route-path filter is dropping the
> traffic if it's coming in the 'wrong' intreface.
> 
> You can check /proc/sys/net/ipv4/conf/*/rp_filter and set it to 0 and
> see if that fixes it.
> 
> --Rob
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Thanks. This was the problem. I thought I had turned this off, but I 
must have missed an interface when I did it manually. I changed 
sysctl.conf and rebooted and it started working.

