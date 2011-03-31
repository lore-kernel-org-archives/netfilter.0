From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [1.3.6] "Couldn't find match `string'"?
Date: Thu, 31 Mar 2011 14:28:58 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1103311426250.3599@obet.zrqbmnf.qr>
References: <qbr8p69r6r6favuori53ct8bepfg8mefeo@4ax.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <qbr8p69r6r6favuori53ct8bepfg8mefeo@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilles <gilles.ganault@free.fr>
Cc: netfilter@vger.kernel.org

On Thursday 2011-03-31 14:06, Gilles wrote:

>Hello
>
>	I don't have much experience with iptables, and need to use it on an
>appliance running uClinux so I can filter packets.
>
>The appliance provides iptables 1.3.6, and I get this error when
>trying to add a rule:
>=========
>> iptables -A INPUT -p udp -m udp --dport 5060 -m string --string "test" --algo bm -j DROP
>iptables v1.3.6: Couldn't find match `string'
>=========
>
>Does someone know if it's a bug in that old release, or is the default
>settings wrong to use the "-m string" option (in which case: What
>should I change in the Makefile)?

Your kernel is either tooooooo old, or was not compiled with the module 
enabled.
iptables 1.3.6 is also obsolete by now.

