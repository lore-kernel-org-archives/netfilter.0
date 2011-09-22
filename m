From: Jorge Bastos <mysql.jorge@decimal.pt>
Subject: Re: Help on outgoing packet (without NAT)
Date: Thu, 22 Sep 2011 17:31:03 +0100
Message-ID: <321b6061b8ccd4cb550069aadf73306b@decimal.pt>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800>
 <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr>
 <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800>
 <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
 <5b10ceef17baa191e62d2d9357257887@decimal.pt>
 <1316641645.9850.225.camel@andybev-desktop>
 <675a49fcb8ddc3c241fab160c59946d8@decimal.pt>
 <alpine.LNX.2.01.1109221828410.11115@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1109221828410.11115@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org

>> Correct, local generated packets.
Tried:
iptables -I OUTPUT -d 5.5.5.5 -p tcp --dport 80 --redirect-to 
192.168.1.221:80

> What makes you think that there is an error in redirect?

iptables -I OUTPUT -d 5.5.5.5 -p tcp --dport 80 --redirect-to 
192.168.1.221:80
iptables v1.4.9.1: unknown option `--redirect-to'
Try `iptables -h' or 'iptables --help' for more information.

