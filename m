From: Ralph Blach <rcblach@gmail.com>
Subject: Re: propper logging and dropping
Date: Fri, 16 Oct 2009 10:36:16 -0400
Message-ID: <4AD884E0.2080507@gmail.com>
References: <4AD7E857.6020100@gmail.com> <4AD821BB.6060205@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=H1DB4FF9mQ8IHFEjvfLkgfo5T+h1G0rkA1ITpXz7gos=;
        b=Wvng/bHyh1mc22HDECAJd308LfammpfD83vjYFf0DJUpXWVB46vFybA5kPmUWkYUn1
         xzCEvqbkHRbeAYbyO1T7YAzC+A9qotpu+9gQYjeI767wzJDIbqHx+Wf7HhPt2enblYNs
         c2YY1qEKdkEC5fHHOZUNw/q/bhvah169baUJc=
In-Reply-To: <4AD821BB.6060205@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mart,

Not Quite, 
                        10.0.0.1          10.0.0.2       ---rest of home 
network 10.0.0.x     
----internet----| firewal | -------Linux server

What I want to do is allow the 10.0.0.x network.
Log packets that are not whose source address are not the  10.0.0.x 
network, with certain exceptions, like the time server and dns server,
Drop and log specifially designated subnets that seem to pound probe 
port 22.

Chip




What I want to do is allow all 10.
Mart Frauenlob wrote:
> netfilter-owner@vger.kernel.org wrote:
>> Good evening,
>>
>> I currently have the following macro.
>>
>> /sbin/iptables -N LOGDROP
>> /sbin/iptables -A LOGDROP    -i wlan0 ! -s 10.0.0.2 -j LOG 
>> --log-level info
>> /sbin/iptables -A LOGDROP -j DROP
>> /sbin/iptables -A INPUT -i wlan0 -s    58.102.198.29/255.255.255.0 -j 
>> LOGDROP
>>
>> What I really wan to do is log address and excluding certain subnets, 
>> and address, but drop others on offending networks.
>> So I want to log addresses to wlan0 whose source address is not 
>> 10.0.0.2, but drop subnets which I exclude.
>>
>> What is the best way to do this
>>
>>  Thanks
>>
>> Chip
>>
>
> If I get your question right:
>
> $IPT -N LOGDROP
> $IPT -A LOGDROP -s 10.0.0.2 -j RETURN
> $IPT -A LOGDROP -j LOG --log-level INFO
> $IPT -A LOGDROP -j DROP
>
> $IPT -A INPUT -i wlan0 -s 10.0.0.0/24 -j LOGDROP
> $IPT -A INPUT -i wlan0 -s 58.102.198.29/24 -j LOGDROP
> ...
>
> Regards
>
> Mart
>

