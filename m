From: Aleksej <aleksej05@googlemail.com>
Subject: Re: monitoring with iptables question
Date: Tue, 23 Sep 2008 08:34:48 +0200
Message-ID: <16d377d70809222334i2c5c506aj4c41e31339095efa@mail.gmail.com>
References: <16d377d70809221125l5e3195cage4035a92352577d8@mail.gmail.com>
	 <1222109240.3502.50.camel@pauloric.contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=T8VMr8zJSaDJFimlvdYYPRAPZh2Zga69YPWw1s+06c4=;
        b=stRjTw7Q04ipvpsHpv15O8uh4EIvuBso8nqEUs/V8uCpxwRAvDWOQ/IoSKFavMu3sy
         eUNNBg9qKLyR677jdwFM1LEv5wrCzgF3Q4oCwnYeqfEb6L0OhS7yqH9iTEoZBb5E3xC1
         a1agwA3big3VjZMKvx1b4vNbnIA98J/GC7Kus=
In-Reply-To: <1222109240.3502.50.camel@pauloric.contatogs.com.br>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thanks for the links, I'm reading it now, but there is a lot of informa=
tion...
My problem is that I don't know how much available bandwidth I have
(this is about wireless networks). Otherwise I could just calculate
the total throughput on the interface and see if there is some free
bandwidth left. Can one with linux traffic control tools or iptables
derive the load of interface/queue? The only thing I need to know is
whether the output transmission queue can cope with all the traffic
waiting for transmission, in other words, is the queue full loaded or
not.

Thanks,
Aleksej.

2008/9/22 paulobruck1 <paulobruck1@gmail.com>:
> Em Seg, 2008-09-22 =E0s 20:25 +0200, Aleksej escreveu:
>> Hi,
>>
>
> Hi
>
>> I know that iptables can be used for some monitoring tasks. Is it
>> possible to solve the following task with iptables?
>>
>> Let's say I have an application that generates 20 Mbps data for
>> transmission, but due to high network load only 10Mbps is actually
>> transmitted. So, the output transmission queue is always loaded with
>> packets waiting for transmission. Is it possible to see somehow with
>> iptables that the output transmission queue is always busy? Or maybe
>> it is possible to count how many packets were generated for
>> transmission and how many packets have been actually transmitted?
>>
>> I need this for monitoring the queue load. The main task is to monit=
or
>> what portion of time the output transmission queue is empty/busy.
>>
> Instead of only monitor what about shape/priorize?? see :
>
>
> http://lartc.org/howto
>
> http://www.linuxfoundation.org/en/Net:IFB
>
> best regards
>
>
>> Thanks for any hints!!
>>
>> Aleksej.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
