From: Jorge Bastos <mysql.jorge@decimal.pt>
Subject: Re: Help on outgoing packet (without NAT)
Date: Thu, 22 Sep 2011 17:44:50 +0100
Message-ID: <da2100d26099890bb06e4b87ab5cac93@decimal.pt>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800>
 <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr>
 <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800>
 <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
 <5b10ceef17baa191e62d2d9357257887@decimal.pt>
 <1316641645.9850.225.camel@andybev-desktop>
 <675a49fcb8ddc3c241fab160c59946d8@decimal.pt>
 <4E7B64CE.8060107@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E7B64CE.8060107@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Leonardo Rodrigues <leolistas@solutti.com.br>
Cc: ML netfilter <netfilter@vger.kernel.org>

Hi,

> Your rule is absolutely incomplete and nonsense
>
> packet redirections should be done on the NAT table. If no table is
> specified on the command, you'll work on the filter table, which is 
> not
> the one you want here. So '-t nat' is needed.
>
> the '--redirect-to' is not an argument for any of the known targets
> i know .... but as it seems you want to redirect some packet to 
> another
> machine, than you'll probably want the DNAT target. Anyway, you have 
> not
> specified any target, so iptables simply doesnt know what to do.
>
> calling the correct target with correct argument, your rule should
> look something like:
>
> iptables -t nat -I OUTPUT -d 5.5.5.5 -p tcp --dport 80 -j DNAT
> --to-destination 192.168.1.221
>
> no need to specify the :80 port to the destination target. If you
> want to redirect to the same port, you dont need to specify that. You
> would need to specify if you were changing ports.

Well I was convinced that, since I'm not using NAT on this machine, 
this couldn't be done on the NAT table.
Thanks, after all, it works.

Jorge,
