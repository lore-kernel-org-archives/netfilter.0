From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 22:04:09 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A4E340.1090305@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Thursday 2008-08-14 22:00, Grant Taylor wrote:

> On 8/14/2008 8:53 PM, Jan Engelhardt wrote:
>> Nope that would not work because the source and destination addresses are
>> flipped on return packets, and then you even have the .255 thing.
>
> Ah.  I forgot about the fact that recent only dealt with the source IP and that
> you could not specify source or dest in the set / update / check parameters to
> recent.  :(

You can specify --rsrc/--rdest (patch just merged that documents them).
But somehow I am not sure...

-A INPUT -d 192.168.0.255 -p udp --dport 161 -m recent --name snmp
--rsrc --set

-A OUTPUT -p udp --sport 161 -m recent --name snmp
--rdest --rcheck

Try?
