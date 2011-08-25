From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ssh session are hanging when firewall is restarted
Date: Thu, 25 Aug 2011 10:06:31 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108251005190.29624@frira.zrqbmnf.qr>
References: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com> <4E55E602.6040905@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E55E602.6040905@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thursday 2011-08-25 08:04, Grant Taylor wrote:

> On 8/24/2011 08:42, Adishesh M wrote:
>> what is the problem with this above rule. we used this rule to drop
>> bad tcp packets. when firewall is restarted using "service iptables
>> restart", ssh sessions are hanging.
>
> I don't think there is any thing wrong with the rule at all.  I think the
> problem is how you are thinking about the connection.
>
> You are looking for connections that are new to the connection tracking
> sub-system that do not have a SYN flag set.
>
> An already established SSH connection will not need to send a SYN packet, but
> will still appear "new" to the connection tracking sub-system after you
> re-start the firewall.

It depends on _what_ actually is restarted. Changing just the ruleset 
does not affect CT entries.
