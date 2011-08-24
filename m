From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re:
Date: Wed, 24 Aug 2011 09:35:21 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108240935020.4749@frira.zrqbmnf.qr>
References: <4E536427.2040503@ngs.ru> <4E5385EB.9040808@tolaris.com> <4E538A10.3030508@runoguy.ru> <4E539076.1070609@tolaris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E539076.1070609@tolaris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tyler J. Wagner" <tyler@tolaris.com>
Cc: Ellad Yatsko <eyatsko@runoguy.ru>, netfilter@vger.kernel.org

On Tuesday 2011-08-23 13:35, Tyler J. Wagner wrote:

>On 2011-08-23 12:08, Ellad Yatsko wrote:
>> Main problem is DNAT does not work as I wait. It seems to me there is an
>> implicit additional
>> DNAT rule for SNAT, and because *my* DNAT rule does not work. May you show
>> me how it
>> could be "switched off"? :-)
>
>It's not an implicit rule. If either rule matches the FIRST time the
>traffic is seen, it will become an established connection. NAT will be
>applied to it in both directions. See the current list of tracked
>connections with:
>
>cat /proc/net/ip_conntrack
>
>Don't run that on a system with a lot of traffic. You'll get one line for
>each session. For 1000 sessions, that's manageable. For 500,000, it will
>block the terminal for a long time.

That's why one normally uses conntrack -L | less so that that does not 
happen.
