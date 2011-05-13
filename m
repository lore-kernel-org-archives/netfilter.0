From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: AW: Iptables segfault on ubuntu
Date: Fri, 13 May 2011 16:36:47 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105131636400.6257@obet.zrqbmnf.qr>
References: <9F69795E29C890408AC2DAF646C89BB3799EBB3860@MAILBOX.arc.local> <alpine.LNX.2.01.1105131610440.4775@obet.zrqbmnf.qr> <9F69795E29C890408AC2DAF646C89BB3799EBB38A6@MAILBOX.arc.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9F69795E29C890408AC2DAF646C89BB3799EBB38A6@MAILBOX.arc.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 2011-05-13 16:22, Fiedler Roman wrote:

>> >Please could someone with a trunk iptables installation test the
>> >following command.
>> >
>> >iptables -A OUTPUT --source "" -j ACCEPT
>> 
>> This is fixed in 4b110b426df7bf486a3e7884c56ebb3487023601.
>> Not that calling -s "" in the first place is useful..
>
>Of course, just happens during quick and dirty script tests. I also 
>reported to Ubuntu, so that they can integrate these fixes into current 
>Ubuntu.

But as I now them, they won't do that.
