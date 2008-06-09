From: Patrick McHardy <kaber@trash.net>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 09 Jun 2008 11:09:08 +0200
Message-ID: <484CF334.3000200@trash.net>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E13@SONNE.gw.bringe.net> <4847F14D.5000806@trash.net> <484941F6.9080701@bringe.com> <48495174.30909@trash.net> <alpine.LNX.1.10.0806091106170.20733@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806091106170.20733@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: =?ISO-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Friday 2008-06-06 17:02, Patrick McHardy wrote:
>   
>>> I've tried that for a day, to no avail:
>>> ..
>>> My nat rules currently look like this:
>>>
>>> iptables -t nat -A PREROUTING -m state --state INVALID -j LOG
>>> iptables -t nat -A PREROUTING -m state --state INVALID -j DROP
>>>       
>> These rules need to go in mangle, that nat table is only
>> traversed for the first packet of a connection.
>>     
>
> These rules should go into filter, because that's what "filter"
> is for... filtering.

As you are well aware, there is no PREROUTING chain in filter.
So I'm guessing you're trying to pull me into a discussion
about that, in an irritating way.


