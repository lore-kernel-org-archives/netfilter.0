From: John Lister <john.lister@kickstone.co.uk>
Subject: Re: Help with packet marking
Date: Tue, 03 Apr 2012 14:41:12 +0100
Message-ID: <4F7AFDF8.5070800@kickstone.co.uk>
References: <4F74194E.9030608@kickstone.co.uk> <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kickstone.com; s=mail;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:Message-ID; bh=Vj4rYDjYr3mkZw2eIOymA3RhvYHfTadf2je6RG3tPug=;
	b=CUCQQI6RPQbdmk9vbJSpAvB0pSqx8JQtMXzxDpNdIZNVJNazx5jndn/7rCeXx4eoRSA5G/tvx6Zx0ddpbDECl+o1ww7/nGEVpqK7j1BIxnOkN6UJ0uR9AbWOXTJ/6pOp;
In-Reply-To: <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks to all those who offered help. I have everything working now. No=
t=20
entirely sure what happened. 2 things of note:

- I upgraded the kernel version  from 2.6.31-23 to 2.6.32-40
- I was setting /proc/sys/net/ipv4/conf/all/rp_filter to 0 which worked=
=20
previously, however it would seem that in the newer kernels I have to=20
also set all the interface values as well. I'm using multiple IPs per=20
nic and not setting this causes the return packets to get lost in some=20
instances.

The kernel change seemed to fix the packets going out of the wrong=20
interface problem although I can't test this any more unfortunately -=20
which does seem very odd. But maybe the 2 in combination caused it?

Thanks again

John


On 29/03/2012 15:55, Humberto Juc=E1 wrote:
> 2012/3/29 John Lister<john.lister@kickstone.co.uk>:
>> It seems to be selecting the correct route using the marks as iptabl=
es
>> reports the correct interface in the log files.
>> However the packet then goes out of a different interface.
> Show us all firewall and routing rules (at least the main)...
>     iptables -t mangle -nL -v
>     ip rule ls
>
>> This has always worked before, the default route is in the main tabl=
e (maybe
>> not clear before) and is used so that
>> the box can route local packets out. Your example (below) would do t=
he same
>> except skip the fwmark rules
> Not exactly. In my example, to skip the fwmark process the destinatio=
n
> address must be known by the main table. And you dont need to treat
> your essential routes in alternative tables (only default gw). For
> this reason,  you couldnt use a default gw in main table (*my
> example*).
>
> But, i still not sure why your setup has stopped working.
>
>> Yes, sorry when doing the example missed off the -m state --state NE=
W bit...
>> I still find it strange that recently packets I'd expect to be in th=
e NEW
>> state are ESTABLISHED. eg doing
>> ping blah
>> ping blah
>> results in the first outgoing packet being NEW, but the second ping =
is
>> ESTABLISHED, surely this is a bug?
> Why you need to work with connection STATEs in firewall MARKs?
>
> Tell me more about your configuration.
> I can check your firewall confs if you open your ssh access for me
> (send me account in pvt - if you like).


--=20
Get the PriceGoblin Browser Addon
www.pricegoblin.co.uk

