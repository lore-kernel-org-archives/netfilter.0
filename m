From: Markus Feldmann <feldmann_markus@gmx.de>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 22:55:12 +0200
Message-ID: <hshovg$o7e$1@dough.gmane.org>
References: <hshbmv$547$1@dough.gmane.org> <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr> <hsheni$h51$1@dough.gmane.org> <hshf8e$jpn$1@dough.gmane.org> <4BEC5C6C.1010704@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BEC5C6C.1010704@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg schrieb:
> 
> It depends on your needs.

The state NEW doesn't work for my apache server, only the --syn flag. It 
seems that many packets on my server wouldn't catched from the NEW rule, 
because my server thinks they are not NEW. The clients still want to 
establish a connection, but my server only let NEW packets in. If some 
of my frineds want to connect several times, or when the first packet 
doesn't fit up with my rules. Then they fall in my blacklist and i got 
problems. :-(

So it is better to set up a rule with the --syn argument combined with 
the hashlimit extension, to be save against syn flood attacks.

What do you think?

regards markus

