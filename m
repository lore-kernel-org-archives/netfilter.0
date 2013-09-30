From: Shawn Wilson <ag4ve.us@gmail.com>
Subject: Re: Getting iptables not to reply
Date: Mon, 30 Sep 2013 19:56:25 -0400
Message-ID: <ae5f0c76-1cf4-44be-9c9a-a7504c30c9f3@email.android.com>
References: <SNT147-W156511006C6569D034DE84BF140@phx.gbl> <3e46767e-0e68-4512-8d9c-2b8873d536fc@email.android.com> <d258c476-1215-47ba-84cc-9ca16fba3ca7@email.android.com> <5249C793.7010201@saasplaza.com> <5249C9C7.4020400@saasplaza.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=user-agent:in-reply-to:references:mime-version:content-type
         :content-transfer-encoding:subject:from:date:to:message-id;
        bh=UWIbJX1rDiahe7C6bIMdkJrMwqHRKeQH6DYbzlmspx8=;
        b=y6Egp5Rqfi0cm1VGHA8slRalvhcvjxmxXoJwo3Zd6+C9y3Ed+iS5EWpx56B8MFugC5
         UQoWDY8VqhYNopffr2ym8soo9/tjYeKCci/+kU+sucSlrZt53sMWMKZa9ZN+YmxpzNrX
         FB6JVEyiL44xruME9IA/6TsHD+Jd8HmLK72rY7WH46+cOCLL/ow4hMXcH79dSmX+Xzwu
         8CO3xuLl2ZO7/xEeiLxJLEM3hWDs0H6/ZgYNk/lutI0wz706kffkRTqzCQ63Ee+Zyb0r
         ee/AAxAyEYQvOWO9tijcfOkFitbWgTOCm3wlUaozVJDXqs/mWRQBxOJLeJrurKJLee1D
         qCbA==
In-Reply-To: <5249C9C7.4020400@saasplaza.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>, jack seth <bird_112@hotmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

If your output policy is default drop (ie, allow only what you use - you find interresting stuff like the Pandora music service doing weird stuff which is cool anyway), you get that behavior. Since we're dealing with output, you can only allow users or a white list of apps. I'd log the hell out of stuff if you're going to do this either way. 

Tom van Leeuwen <tom.van.leeuwen@saasplaza.com> wrote:
>Just FYI, the RST sending code is normal behaviour (RFC793):
>Quote:
>If the state is CLOSED (i.e., TCB does not exist) then
>all data in the incoming segment is discarded.  An incoming
>segment containing a RST is discarded.  An incoming segment not
>containing a RST causes a RST to be sent in response.
>
>On 09/30/2013 08:48 PM, Tom van Leeuwen wrote:
>> Hi,
>>
>> It seems Jack does not want any response...
>> So what happens when you hit a machine that has a port closed? Well:
>> this happens (telnet 127.0.0.30 443):
>> tcpdump: verbose output suppressed, use -v or -vv for full protocol
>decode
>> listening on lo, link-type EN10MB (Ethernet), capture size 65535
>bytes
>> 20:42:07.706751 IP 127.0.0.1.34056 > 127.0.0.30.443: Flags [S], seq
>> 2590507944, win 43690, options [mss 65495,sackOK,TS val 3717641 ecr
>> 0,nop,wscale 7], length 0
>> 20:42:07.706778 IP 127.0.0.30.443 > 127.0.0.1.34056: Flags [R.], seq
>0,
>> ack 2590507945, win 0, length 0
>>
>> In response to my TCP SYN packet on loopback ip 127.0.0.30:443, which
>> does not have a service running, you see the kernel respond with a
>TCP RST.
>>
>> Jack: You're talking about a router. Is the router being hit here on
>a
>> closed port, or is some machine behind the router being hit on a
>closed
>> port?
>>
>> Only option I see, which really sucks and __I DO_NOT_RECOMMEND_THIS__
>> because it may also DROP legitimate RST packets when the service
>> actually wants to send it:
>> iptables -I OUTPUT -p tcp -s 127.0.0.30 --sport 443 --tcp-flags RST
>RST
>> -j DROP
>>
>> I'm interested in a more clean solution though!
>>
>> Regards,
>> Tom van Leeuwen
>>
>> On 09/30/2013 07:35 PM, Shawn Wilson wrote:
>>> Err should've been FIN, SYN, or RST
>>>
>>> Shawn Wilson <ag4ve.us@gmail.com> wrote:
>>>> Do you want to respond with ACK, FIN, or RST?
>>>>
>>>> jack seth <bird_112@hotmail.com> wrote:
>>>>> Ok, if you have an 'accept' rule for a service that is not
>currently
>>>>> running, is it possible to have iptables to simply not respond
>instead
>>>>> of reporting the port as 'closed'?  During a port scan at grc.com,
>if
>>>>> the router doesn't reply the port will be reported as 'stealth'.
>		 	
>>>>> 		  --
>>>>> To unsubscribe from this list: send the line "unsubscribe
>netfilter"
>>>> in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

