From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 9 Jun 2008 14:38:58 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806091438140.20733@fbirervta.pbzchgretzou.qr>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E13@SONNE.gw.bringe.net> <4847F14D.5000806@trash.net> <484941F6.9080701@bringe.com> <48495174.30909@trash.net> <alpine.LNX.1.10.0806091106170.20733@fbirervta.pbzchgretzou.qr> <484CF334.3000200@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <484CF334.3000200@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: =?UTF-8?Q?Thomas_B=C3=A4tzler?= <t.baetzler@bringe.com>, netfilter@vger.kernel.org


On Monday 2008-06-09 11:09, Patrick McHardy wrote:
>>   
>> > > I've tried that for a day, to no avail:
>> > > ..
>> > > My nat rules currently look like this:
>> > >
>> > > iptables -t nat -A PREROUTING -m state --state INVALID -j LOG
>> > > iptables -t nat -A PREROUTING -m state --state INVALID -j DROP
>> > >       
>> > These rules need to go in mangle, that nat table is only
>> > traversed for the first packet of a connection.
>>
>> These rules should go into filter, because that's what "filter"
>> is for... filtering.
>
> As you are well aware, there is no PREROUTING chain in filter.
> So I'm guessing you're trying to pull me into a discussion
> about that, in an irritating way.
>
I overlooked that. In that case, it has to be done in INPUT/FORWARD then.
-t filter -A INPUT -m conntrack --ctstate INVALID -j LOG (and DROP)
-t filter -A FORWARD -m conntrack --ctstate INVALID -j LOG (and DROP)
