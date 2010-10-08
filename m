From: Payam Chychi <pchychi@gmail.com>
Subject: Re: empty filter on FORWARD chain with rp_filter means safe right?
Date: Fri, 08 Oct 2010 09:18:57 -0700
Message-ID: <4CAF4471.8030903@gmail.com>
References: <20101008043129.GA2017@omnius.omnisys.com> <4CAEA0D3.1020207@gmail.com> <alpine.LNX.2.01.1010080700580.15349@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KASaLnU7k6jpZs1maOH9KuOtvhQWkGYmrq8dubyKzM4=;
        b=MkaafZMK5nJlkksoUouxrsPbhJ+IZpH7mq5zoJRZr0AqVQEyTtMDLt2nMK53mEagh5
         xW5PpyQUfXC9eHgkulapxtcEGTPEa5JtF/iOfR3z7c+/32c7iA6/XORxB/2xIurDoIle
         /QKthigqfnWTc23VzaiQel26lRHgAkC9iEjT4=
In-Reply-To: <alpine.LNX.2.01.1010080700580.15349@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Scott Mcdermott <scott@omnisys.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Friday 2010-10-08 06:40, Payam Chychi wrote:
>
>   
>> Thats correct Scott,
>> in order for any systems to abuse your setup they will need to be directly
>> connected to a segment that has knowledge of valid route to the end system...
>> meaning if a computer is 2 hops away and the router in between has no knowledge
>> of how to get to your private rfc1918 then pkts get dropped.
>>
>> Keep in mind that as ipv4 exhaustion gets extreme, some isps will use rcf1918
>> blocks and route them either in their IGP or even EGP (aka internet routes)...
>>     
>
> Internally yes, but externally no. And it's not really RFC1918 routes being
> "used in the Internet" - instead, it is "enlarging our NAT domain". (Mobile
> UMTS/HSDPA providers do this in Germany already.)
>
>   
Perhaps re-look at what rfc1918 is... also as you can read above i 
stated IGP which is internal routing and is not to increase NAT domains 
and with a "even" EGP which would be considered external to your network 
and as you can see the latter was meant for extreme cases... but what do 
i know

