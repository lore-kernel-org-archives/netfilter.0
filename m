From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: firewall cause  [ping: sendmsg: Operation not permitted]
Date: Wed, 26 Sep 2012 15:26:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1209261525030.6984@nerf07.vanv.qr>
References: <20120926123918.18003d60@shiva.selfip.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120926123918.18003d60@shiva.selfip.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joydeep@infoservices.in
Cc: netfilter@vger.kernel.org


On Wednesday 2012-09-26 09:09, joydeep@infoservices.in wrote:
>
>    iptables -P OUTPUT DROP
>    iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
>    iptables -A OUTPUT -d 127.0.0.0/255.0.0.0 -j ACCEPT
>    iptables -N lan
>    iptables -A lan -p TCP --dport domain -j REJECT
>    iptables -A lan -p UDP --dport domain -j REJECT
>    iptables -A lan -j ACCEPT
>    iptables -A OUTPUT -d 192.168.0.0/255.255.0.0 -j lan
>    iptables -A OUTPUT -d 10.0.0.0/255.0.0.0 -j lan
>    iptables -A OUTPUT -d 172.16.0.0/255.240.0.0 -j lan
>iptables -t filter -A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
>	iptables -t filter -A OUTPUT ! -o lan -j DROP
>`````````````````````````````````````````````````````````````
>
>And when try to ping gmail.com   it reports  
>
>ping: sendmsg: Operation not permitted
>
>I don't understand what is causing the issue. Any clue / fix please  ?

You're blocking all of ICMP, so what did you expect?
