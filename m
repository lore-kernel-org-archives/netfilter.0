From: Jorge Bastos <mysql.jorge@decimal.pt>
Subject: Help on outgoing packet (without NAT)
Date: Wed, 21 Sep 2011 22:23:56 +0100
Message-ID: <5b10ceef17baa191e62d2d9357257887@decimal.pt>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800>
 <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr>
 <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800>
 <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Howdy,

I'd like some help on how can I redirect the outgoing packets without 
using NAT.

I have a machine, that when requests to IP 5.5.5.5 and port 80 are 
made, the request be redirected to 192.168.1.221:80
I'm trying this but no luck, maybe I'm close to it:

iptables -I FORWARD -d 5.5.5.5 -p tcp --dport 80 --to 192.168.1.221:80

What can I missing or what do I need to add?

Thanks in advanced,
Jorge Bastos,
