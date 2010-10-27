From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: newbie: forward rule to itself
Date: Wed, 27 Oct 2010 17:03:33 -0400
Message-ID: <4CC893A5.1010808@gmail.com>
References: <4CC8774C.1070908@gmail.com> <alpine.LNX.2.01.1010272116580.19157@obet.zrqbmnf.qr> <4CC881D8.3060408@gmail.com> <alpine.LNX.2.01.1010272157440.23548@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=vSQr4vSRB2VhyprLBQxs4XFUW1clz4M4wj2wGt0EPRg=;
        b=Qa+i7h+ssocP3MidX5/jtgWwvQc2qZxY7ZqsM8raslf6R6j5yzJTO0n5LbOPqNhECQ
         oerF1h0VKwlhMyz7G5KPmd75LPLvz1IlalhexVnlCFQFaothps9puqiuKa3ddEnnqTS0
         +0HdqQQso3bxNdLCZkjF/OcVUY6dqlPTCLCfc=
In-Reply-To: <alpine.LNX.2.01.1010272157440.23548@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On 10/27/2010 04:00 PM, Jan Engelhardt wrote:
>
> On Wednesday 2010-10-27 21:47, Mauricio Tavares wrote:
>>>>
>>>> I have the following rules to forward port 6969 coming on eth0 on server1 to
>>>> port 6969 on server2's eth0:
>>>>
>>>> iptables -A PREROUTING -t nat -p tcp --dport 6969 -j DNAT --to
>>>> 192.168.1.server2:6969
>>>> iptables -A INPUT -d 192.168.4.server1 -p tcp -m tcp -m state --state NEW
>>>> --dport 6969 -j ACCEPT
>>>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>>
>>> That prerouting only applies to packets coming from devices connected to
>>> the machine.
>>
>> 	How would the prerouting that applies to packets coming from the
>> machine itself look like?
>
> Mean to say it without "that". The entire PREROUTING chain won't be considered
> for nat.
> Usually, you just directly connect to the proper address preferably
> ith a DNS name if available. Alternate and rather redundant
> communication ways are rinetd.
>
	I am rather confused. Do you mean the prerouting chain is not 
considered for nat at all or just not for this specific case I had in mind?

Incidentally, I am not in love with those rules I created at all. All I 
want to do is to have any traffic to 192.168.4.server1:6969 will be sent 
to 192.168.1.server2:6969 no matter where it was originated from (be it 
somewhere in 192.168.1.0, 192.168.4.0, or even from withing server1). So 
far I cannot figure out a good way to accomplish that.
