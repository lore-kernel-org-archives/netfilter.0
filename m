From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help on outgoing packet (without NAT)
Date: Thu, 22 Sep 2011 00:42:18 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1109220042070.8493@frira.zrqbmnf.qr>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800> <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr> <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800> <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
 <5b10ceef17baa191e62d2d9357257887@decimal.pt>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5b10ceef17baa191e62d2d9357257887@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-09-21 23:23, Jorge Bastos wrote:
>
> I have a machine, that when requests to IP 5.5.5.5 and port 80 are made, the
> request be redirected to 192.168.1.221:80
> I'm trying this but no luck, maybe I'm close to it:
>
> iptables -I FORWARD -d 5.5.5.5 -p tcp --dport 80 --to 192.168.1.221:80
>
> What can I missing or what do I need to add?

The error message you get, at least.
