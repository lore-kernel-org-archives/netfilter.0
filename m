From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: DNAT Problem
Date: Tue, 27 Apr 2004 09:20:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c42c28$16064480$1202a8c0@admin>
References: <1443.80.0.0.23.1083045451.squirrel@80.0.0.175>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I have an email server running behind the firewall serving POP3 &
SMTP.
> Now all requests DNAT from the firewall are logged as if received from
the
> firewall itself and thus considered as trusted ip. I want all the DNAT
> requests to be logged as received real source ip and not from firewall
ip.

...

> # Default Policy Rules
> iptables -P INPUT DROP
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT


Set this one to DROP and use an ACCEPT rule for what you want to accept
(see below).
That way you won't easily make a mistake when forwarding.

> iptables -t nat -P PREROUTING ACCEPT
> iptables -t nat -P POSTROUTING ACCEPT
> iptables -t nat -P OUTPUT ACCEPT
>
> # Allow only incoming connections that we establish first
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> # Rules for lo
> iptables -A INPUT -s 127.0.0.0/255.0.0.0 -i ! lo -j DROP

That should read :
iptables -A INPUT -i lo -s 127.0.0.0/8 -j ACCEPT
iptables -A INPUT -i ! lo -s 127.0.0.0/255.0.0.0 -j DROP
You want to accept traffic from 127.0.0.0/8 on interface lo.

> # Rules for eth0 - LAN
> iptables -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
>
> # Rules for eth1 - Internet
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

You say eth1 is internet. Why eth0 ?
Should this say :
iptables -t nat -A POSTROUTING -o eth1 -s <net_lan> -j SNAT \
  --to-source <ip_inet>

> iptables -A INPUT -i eth1 -p icmp -j DROP

You already do this since you don't have a rule acceping it and policy
is DROP.

> iptables -A INPUT -i eth1 -p tcp -m tcp ! --tcp-flags SYN,RST,ACK
SYN -j
> ACCEPT

Why are you accepting this ?
You have set policy to DROP for the INPUT chain. Nice. Everything will
be dropped that doesn't match a rule.
You accept RELATED and ESTABLISHED traffic. Good.
The nex rule you accept tcp packets, that has not SYN set out of the
SYN, RST and ACK flags. Could it be you're matching related/established
traffic ? You already do that.

> # SSH
> iptables -A INPUT -i eth1 -p tcp --dport 22 -j ACCEPT
>

If you have set policy DROP for the FORWARD chain, you now have to
ACCEPT (and LOG, because that is what you wanted after all) certain
traffic. Below I see you're forwarding to 2 different servers :
192.168.0.6 and 192.168.0.190.
So I think you want this :

iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 25 \
  -j LOG --log-prefix "ipt:SMTP "
iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 25 \
  -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 110 \
  -j LOG --log-prefix "ipt:POP3 "
iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 110 \
  -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 8000 \
  -j LOG --log-prefix "ipt:WEBMAIL "
iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 8000 \
  -j ACCEPT

iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 80 \
  -j LOG --log-prefix "ipt:WEB "
iptables -A FORWARD -i eth1 -o eth0 -d 192.168.0.6 -p tcp --dport 80 \
  -j ACCEPT

> # Email Server Access From Outside
> # SMTP
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 25 -j DNAT --to
> 192.168.0.6:25
> # Web
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to
> 192.168.0.190:80
>
> # POP3
> iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 110 -j DNAT --to
> 192.168.0.6:110
>
> # WebMail
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 8000 -j DNAT --to
> 192.168.0.6:80

> iptables -A INPUT -i eth1 -j DROP

You have set the INPUT policy to DROP so there is no reason to do this.


Gr,
Rob


