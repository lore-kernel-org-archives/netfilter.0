From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 9 Jun 2008 11:06:39 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806091106170.20733@fbirervta.pbzchgretzou.qr>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E13@SONNE.gw.bringe.net> <4847F14D.5000806@trash.net> <484941F6.9080701@bringe.com> <48495174.30909@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48495174.30909@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: =?UTF-8?Q?Thomas_B=C3=A4tzler?= <t.baetzler@bringe.com>, netfilter@vger.kernel.org


On Friday 2008-06-06 17:02, Patrick McHardy wrote:
>> I've tried that for a day, to no avail:
>> ..
>> My nat rules currently look like this:
>> 
>> iptables -t nat -A PREROUTING -m state --state INVALID -j LOG
>> iptables -t nat -A PREROUTING -m state --state INVALID -j DROP
>
> These rules need to go in mangle, that nat table is only
> traversed for the first packet of a connection.

These rules should go into filter, because that's what "filter"
is for... filtering.
