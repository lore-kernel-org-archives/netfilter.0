From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables rules for cups printer discovery
Date: Thu, 14 Aug 2008 21:53:39 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48A4DD48.3080004@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Thursday 2008-08-14 21:35, Grant Taylor wrote:

> On 8/14/2008 1:51 PM, Stephen Isard wrote:
>
>> I'm wondering whether there are iptables rules that will permit
>> cups snmp printer discovery to operate without creating a serious
>> security risk.
>
> I wonder if you could not use the "recent" match extension to
> ""remember when a cups broadcast has gone through.

Nope that would not work because the source and destination
addresses are flipped on return packets, and then you even
have the .255 thing.

That smells like a feature request - me to the rescue!
(I think that would be much preferable over having a ton of
connection helpers)
