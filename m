From: Peter Phaal <peter.phaal@gmail.com>
Subject: Re: per host accounting
Date: Wed, 25 Jul 2012 07:21:48 -0700
Message-ID: <CAB8g2zyTJzGWEWbY0F1phd-nzoq-6cH-gRiW3RFUmoEZVZGv5w@mail.gmail.com>
References: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
	<1343030447.12730.5.camel@tiger.regit.org>
	<CAJygYd2f0P7kJmVtAcPEJ+oSpSfqVtYN4ksWw4qqe7=_ELdg6w@mail.gmail.com>
	<20120725101951.GA22430@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=XGDQZ6Hk32JfLptvnzCKPYSV5jE9ArWvcg5vRiySgg0=;
        b=r3WR/z+ZSyO/Dmhgf2WrYahq1x7uaNwPDz8U1Xfj54yBd9S5OFvPKmpOTsGwCtrW0G
         F4/kbwYVYdmUoSIpnapw18d5q1VQtsl7ZzZ5w7skYnWKsQvAysQeNYIsJPbKnri3ejh9
         T3AYdIWLC6Ms0VlMlQnhtVRJSaNRQlS6eRLfoK9ttY04tTDYtY3byGcociiGkaURYS9v
         YrNvv5AeWT3XYxbnOXOQYuzV30o8gEQEV1M8vHffRa6aTxEf9SvxmFAyGnT+dHNqBZJZ
         CGJ8p04wla5TKqV4P1uXhR8idJyqz2OuN5ozm2gwu7idNquTVzrVWUp9wUL67DQMNuxR
         e2xg==
In-Reply-To: <20120725101951.GA22430@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>, Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

Another alternative would be to install a Host sFlow agent
(http://host-sflow.sourceforge.net/) on your router. Traffic
monitoring is performed using the iptables statistics module and ULOG.

http://blog.sflow.com/2010/12/ulog.html

A few comments about the solution:
1. It is extremely lightweight and the data analysis can be shifted to
a different machine, further reducing the overhead on the router.
2. Sampling works well for identifying the top 5 sources
3. Host sFlow also exports cpu, memory, disk etc. statistics so you
can track router load.
4. You can perform detailed analysis on the top talkers to see what
they are doing.

Peter

On Wed, Jul 25, 2012 at 3:19 AM, Pablo Neira Ayuso <pablo@netfilter.org=
> wrote:
> On Mon, Jul 23, 2012 at 03:27:08PM -0700, Yucong Sun (=E5=8F=B6=E9=9B=
=A8=E9=A3=9E) wrote:
>> Thanks for the reply, Yeah I'm aware all of that you have mentioned,
>> please allow me to elaborate my requirements a little more.
>>
>> I have about 500 IPs behind a router, and I want have something on m=
y
>> router to monitor the ingress bps/pps to each specific IP. And I wou=
ld
>> like to have a cron job  that scans the result and find the top 5  I=
P
>> with most bps/pps and also do some action against it, calling a
>> script, sending a email etc.
>>
>> So, It seems none of the existing stuff allows me to do this.
>
> You can add one nfacct rule per IP and then use the nfacct utility to
> periodically dump the counters and find for top IPs. Some shell scrip=
t
> should allow want you need. You can also develop your own daemon with
> native libnetfilter_acct interfaces to periodically pull the counters
> and perform the processing you need.
>
>> the easiest brain-dead solution I can think of is to just create a c=
hain
>> with 500 rules in it, and have a cron job to cacluate the bytes
>> difference every time it executes.
>
> Instead of this, I'd go nfacct.
>
>> Obviously, this  will introduce a
>> lot of delays, I'm hoping to have something that basically don't
>> affect performance too much and or something to just generates a tab=
le
>> of ip  / accumulative packets / accumulative bytes, and I will be ab=
le
>> to work with that.
>
> Well, how much is "a lot of delay". I think your performance concerns
> need real numbers. I don't think that will be too much as you mention=
=2E
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
