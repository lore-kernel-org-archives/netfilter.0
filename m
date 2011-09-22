From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help on outgoing packet (without NAT)
Date: Thu, 22 Sep 2011 18:46:14 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109221845040.17480@frira.zrqbmnf.qr>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800> <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr> <5b10ceef17baa191e62d2d9357257887@decimal.pt>
 <1316641645.9850.225.camel@andybev-desktop> <675a49fcb8ddc3c241fab160c59946d8@decimal.pt> <4E7B64CE.8060107@solutti.com.br> <da2100d26099890bb06e4b87ab5cac93@decimal.pt>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <da2100d26099890bb06e4b87ab5cac93@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: Leonardo Rodrigues <leolistas@solutti.com.br>, ML netfilter <netfilter@vger.kernel.org>

On Thursday 2011-09-22 18:44, Jorge Bastos wrote:

> Hi,
>
>> packet redirections should be done on the NAT table.
>> the '--redirect-to' is not an argument for any of the known targets
>
> Well I was convinced that, since I'm not using NAT on this machine, this
> couldn't be done on the NAT table.
> Thanks, after all, it works.

It can be done without NAT, but if you want to do it without NAT, don't 
use {a NAT target like REDIRECT}, use TPROXY.
