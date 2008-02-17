From: karimas@kfupm.edu.sa
Subject: Re: Ask: Default Policy DROP for INPUT, OUTPUT and FORWARD
Date: Sun, 17 Feb 2008 10:15:47 +0300
Message-ID: <7c9ec6914d6.14d67c9ec69@kfupm.edu.sa>
References: <24410.61709.qm@web55403.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <24410.61709.qm@web55403.mail.re4.yahoo.com>
Content-language: en
Content-disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: duren duren <jusdurian_jr@yahoo.com>
Cc: netfilter@vger.kernel.org

Your following commands will not work as state NEW is not there in the 
INPUT chain, but if you add NEW, every one now can access your router.

>># Allow UDP, DNS and Passive FTP
>>$IPT -A INPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
>>$IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

use the following command so that your client can access the router 
through ssh but add before tha above mentioned command.
iptables -A INPUT -s client_ip -dport 22 --state NEW, ESTABLISHED -j 
ACCEPT

Regards
Karim Asif


----- Original Message -----
From: duren duren <jusdurian_jr@yahoo.com>
Date: Sunday, February 17, 2008 9:20 am
Subject: Ask: Default Policy DROP for INPUT, OUTPUT and FORWARD
To: netfilter@vger.kernel.org

> i want build firewal for router in one machine as a
> squid proxy server,  caching dns server and bandwith
> limiter with HTB.
> 
> i use default policy DROP for forward, input, and
> output
> 
> -------- code ----------------
> # Clean old firewall
> $IPT -F
> $IPT -X
> $IPT -t nat -F
> $IPT -t nat -X
> $IPT -t mangle -F
> $IPT -t mangle -X
> 
> $MPROBE ip_conntrack
> $MPROBE ip_conntrack_ftp
> $MPROBE ip_nat_ftp
> $MPROBE ip_nat_irc
> 
> # Setting default filter policy
> $IPT -P INPUT DROP
> $IPT -P OUTPUT DROP
> $IPT -P FORWARD DROP
> 
> # Unlimited access to loop back
> $IPT -A INPUT -i lo -j ACCEPT
> $IPT -A OUTPUT -o lo -j ACCEPT
> 
> # Allow UDP, DNS and Passive FTP
> $IPT -A INPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> $IPT -A OUTPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> ------------ end of code
> --------------------------------------
> 
> and my problem is, what filter i must write so my
> client can connect into my router.
> first i only define PREROUTING, FORWARD and
> POSTROUTING, but my client can't ping into router.
> 
> so, if i want default policy DROP for forward, input,
> output, prerouting and postrouting, what i want to do?
> must i define all of this for allow my client?
> 
> 
> thanks
> 
> 
>      
> 
________________________________________________________________________
____________Never miss a thing.  Make Yahoo your home page. 
> http://www.yahoo.com/r/hs
> -
> To unsubscribe from this list: send the line "unsubscribe 
> netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
