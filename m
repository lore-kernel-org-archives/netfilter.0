From: Jorge Bastos <mysql.jorge@decimal.pt>
Subject: Re: Help on outgoing packet (without NAT)
Date: Thu, 22 Sep 2011 16:58:49 +0100
Message-ID: <675a49fcb8ddc3c241fab160c59946d8@decimal.pt>
References: <F5285AA949CB440A96444F060C17749A@poweredge1800>
 <alpine.LNX.2.01.1109191737100.32518@frira.zrqbmnf.qr>
 <9C0FCAA46B9040869B79B468CCA7391C@poweredge1800>
 <alpine.LNX.2.01.1109191755180.6194@frira.zrqbmnf.qr>
 <5b10ceef17baa191e62d2d9357257887@decimal.pt>
 <1316641645.9850.225.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1316641645.9850.225.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Hi Andy,

>> Howdy, I'd like some help on how can I redirect the outgoing packets
>> without using NAT. I have a machine, that when requests to IP 
>> 5.5.5.5
>> and port 80 are made, the request be redirected to 192.168.1.221:80 
>> I'm
>> trying this but no luck, maybe I'm close to it: iptables -I FORWARD 
>> -d
>> 5.5.5.5 -p tcp --dport 80 --to 192.168.1.221:80 What can I missing 
>> or
>> what do I need to add?
>
> Assuming that you are referring to packets generated on the local
> machine (which is what is implied), then you need to use OUTPUT 
> instead
> of FORWARD.
>
> FORWARD is only for packets that arrive from another machine. OUTPUT 
> is
> for locally generated packets.

Correct, local generated packets.
Tried:

iptables -I OUTPUT -d 5.5.5.5 -p tcp --dport 80 --redirect-to 
192.168.1.221:80

I'm missing something but not sure what, but it's on the redirect part.
