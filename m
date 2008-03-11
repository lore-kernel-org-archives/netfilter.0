From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: Question relating to ESTABLISHED,RELATED rule.
Date: Tue, 11 Mar 2008 21:01:20 +0200
Message-ID: <op.t7u8gib0rtqp7s@hagumi.azt>
References: <alpine.DEB.1.00.0803111442040.19106@p34.internal.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0803111442040.19106@p34.internal.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Justin Piszcz <jpiszcz@lucidpixels.com>, netfilter@vger.kernel.org

Hey.

If your default policy for OUTPUT chain is accept (as it is for many  
people), that rule would be quite useless as the traffic will be passed  
out regardless if it's not dropped by some other rule (of course, it would  
be useful if you wanted to block NEW packets).

As for the general use for it, you could use it on servers where you want  
to allow all related traffic outside, but block rest (or only allow  
certain new packets).

For example, this is my MySQL server's firewall script (other servers have  
similar, generally just changing one port):
*filter
:INPUT DROP [7175:1822706]
:FORWARD DROP [0:0]
:OUTPUT DROP [6:624]
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 3306 -m state --state NEW -j ACCEPT
-A INPUT -s 10.2.0.3 -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW  
-j ACCEPT
-A INPUT -s 10.2.0.3 -i eth0 -p udp -m udp --dport 161 -m state --state  
NEW -j ACCEPT
-A INPUT -s 10.2.0.3 -i eth0 -p udp -m udp --dport 162 -m state --state  
NEW -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -d 10.2.0.0/16 -p tcp -m tcp --sport 3306 -m state --state  
RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -d 10.2.0.3 -p tcp -m tcp --sport 22 -m state --state  
RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -d 10.2.0.3 -p udp -m udp --sport 161 -m state --state  
RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -d 10.2.0.3 -p udp -m udp --sport 162 -m state --state  
RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -d 10.2.0.2 -p udp -m udp --dport 53 -m state --state  
NEW,RELATED,ESTABLISHED -j ACCEPT
COMMIT

In short, I'm accepting inside: related traffic, new connections to ssh &  
snmp from management server. I'm passing out: related mysql sessions to  
LAN, related ssh & snmp to management console and all but invalid packets  
dns queries.

Justin Piszcz <jpiszcz@lucidpixels.com> kirjoitti Tue, 11 Mar 2008  
20:43:35 +0200:

> Hi,
>
> Question relating to ESTABLISHED,RELATED rule.
>
> Obviously at a minimum you need this for the INPUT chain.
> It also seems to help a bit with the FORWARDING chain as well.
>
> Is it necessary for the OUTPUT chain?  Will it help problems with e.g.,
> sometimes I see blocks when I visit a lot of websites (TCP/port 80) from
> banner ads and such, would output help here, or?
>
> This is the rule I am asking about, currently I do not use it and I  
> generally do not see any problems but I am curious how come some people  
> use this and others do not, what are the pros/cons each way?
>
> iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> Thanks,
>
> Justin.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


