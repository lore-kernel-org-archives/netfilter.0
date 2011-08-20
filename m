From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Please help me with a doubt about options '-i' and '-o'
Date: Sat, 20 Aug 2011 19:47:32 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108201946330.28507@frira.zrqbmnf.qr>
References: <6DEA16417ACA45DF9BB7F9BD28454269@poweredge1800> <CAPjvz2mC8oHsC9tRKV_6yUxSuaMadtmJw7VTa9=TA96b-C1r2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPjvz2mC8oHsC9tRKV_6yUxSuaMadtmJw7VTa9=TA96b-C1r2A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Carlos A. Carnero Delgado" <carloscarnero@gmail.com>
Cc: "Julio A. Romero" <julioarr@fisica.uh.cu>, netfilter@vger.kernel.org

On Saturday 2011-08-20 19:01, Carlos A. Carnero Delgado wrote:

>> iptables -A OUTPUT -p icmp -m icmp --icmp-type echo-reply -o eth? -s
>> 192.168.1.1 -d 192.168.2.200 -j ACCEPT
>
>IIRC when selecting (matching) ICMP the further match options are
>implicit.

Only when there is an option that cannot be associated with any 
currently loaded module. -m icmp won't be instantiated if you only use 
-p icmp.

>When building iptables rulesets from scratch I always use the LOG
>target, which sends to the syslog what's going on Netfilter at the
>point of the rule. Excellent troubleshooting hook. Also, iptables -L
>-v is your friend.

Better is iptables-save.
