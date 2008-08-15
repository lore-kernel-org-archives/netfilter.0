From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 22:26:37 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808142224480.25617@fbirervta.pbzchgretzou.qr>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
 <48A4E683.80206@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A4E683.80206@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Thursday 2008-08-14 22:14, Grant Taylor wrote:

> On 8/14/2008 9:04 PM, Jan Engelhardt wrote:
>> You can specify --rsrc/--rdest (patch just merged that documents them).
>
> So the options did exist, but they were undocumented?

Correct. Blame it on ... 

commit f33c46140f0e0a230aba5d739ce40cb14e066b13
Author: Jonas Berlin <xkr47@outerspace.dyndns.org>
Date:   Fri Apr 1 06:54:23 2005 +0000


>> -A INPUT -d 192.168.0.255 -p udp --dport 161 -m recent --name snmp --rsrc
>> --set
>> 
>> -A OUTPUT -p udp --sport 161 -m recent --name snmp --rdest --rcheck
>
> *nod*  That is the general idea.
>
> So I take it that the default is --rsrc but you can specify --rdest
> and act on the destination IP for all options of recent, i.e.
> --update and --remove too?

Right. It seems that when done cleverly, you can mix --rsrc and
--rdest for a given --name even.
