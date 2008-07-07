From: "Charles Romestant" <cromestant@gmail.com>
Subject: Re: Port Forwarding .
Date: Tue, 8 Jul 2008 18:03:32 +1930
Message-ID: <5078d3df0807071533k47a5dd16i254b3ae3592d7a77@mail.gmail.com>
References: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>
	 <4872943B.2060309@riverviewtech.net>
	 <5078d3df0807071532w4ab76fe4vcf4e60a8980525ba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=F3/0LN0w5WwxkuKpGW3JJIj1lERM0yhGPq+zrcpHIHU=;
        b=KyMP76n6UeHdf/83rHWeUaEMYHaOHtCRT8QfVmbM6KhSj60mGC40SqXtYDIHQwp7aT
         JeBsrfXrhZqI/SY7KdJO5lKfpLN23TqO/LUeczA5/dX0XiLKpppbVjceE/xfABqI2Yn2
         GmLDjrxRcuS7VkYwOBiGeCoeE3sVxi/LvYEBI=
In-Reply-To: <5078d3df0807071532w4ab76fe4vcf4e60a8980525ba@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

by the way, from B i can see the server on C, so it is not a NIC problem.

thanks again.

charles

On Tue, Jul 8, 2008 at 6:02 PM, Charles Romestant <cromestant@gmail.com> wrote:
> thanks for answer
>
> hmm tried it and still does not work...
>
> any ideas, at least to get some debug info... still can t see the
> server from a browser on A.
>
>
> On Tue, Jul 8, 2008 at 5:40 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
>> On 07/07/08 16:49, Charles Romestant wrote:
>>>
>>> on C there is a web server, running on port 80, I want to be able to
>>> access it through B from A.
>>>
>>> So basically the ruleset should be on B if its port 80, forward to port 80
>>> on C.
>>
>> These two rules should do the trick to get the traffic forwarded on through
>> B to C.
>>
>> iptables -t nat -A PREROUTING -i eth0 -d 10.0.1.192 -p tcp --dport 80 -j
>> DNAT --to-destination 10.0.10.1
>> iptables -t filter -A FORWARD -i eth0 -o eth1 -d 10.0.10.1 -p tcp --dport 80
>> -j ACCEPT
>>
>> You will need to make sure that the reply traffic back from C is allowed and
>> appears to be from B.
>>
>> iptables -t filter -A FORWARD -i eth1 -o eth0 -s 10.0.10.1 -p tcp --sport 80
>> -j ACCEPT
>> iptables -t nat -A POSTROUTING -o eth0 -s 10.0.10.1 -p tcp --sport 80 -j
>> SNAT --to-source 10.0.1.192
>>
>>> Any help would be appreciated, thank you in advance,
>>
>> You are welcome.
>>
>>
>>
>> Grant. . . .
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
>
>
> --
> Charz
>



-- 
Charz
