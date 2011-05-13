From: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Subject: AW: Iptables segfault on ubuntu
Date: Fri, 13 May 2011 16:22:30 +0200
Message-ID: <9F69795E29C890408AC2DAF646C89BB3799EBB38A6@MAILBOX.arc.local>
References: <9F69795E29C890408AC2DAF646C89BB3799EBB3860@MAILBOX.arc.local>
 <alpine.LNX.2.01.1105131610440.4775@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105131610440.4775@obet.zrqbmnf.qr>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> >Please could someone with a trunk iptables installation test the
> >following command.
> >
> >iptables -A OUTPUT --source "" -j ACCEPT
> 
> This is fixed in 4b110b426df7bf486a3e7884c56ebb3487023601.
> Not that calling -s "" in the first place is useful..

Of course, just happens during quick and dirty script tests. I also reported to Ubuntu, so that they can integrate these fixes into current Ubuntu.

Thanks, Roman
