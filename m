From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: To developers: What rules set would process packets faster?
Date: Mon, 16 May 2011 09:46:34 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105160923260.4397@frira.zrqbmnf.qr>
References: <1653180415.20110516102942@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1653180415.20110516102942@yandex.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gapsf@yandex.ru
Cc: netfilter@vger.kernel.org

On Monday 2011-05-16 05:29, gapsf@yandex.ru wrote:
>
>What rules set would process packets faster?

See http://jengelh.medozas.de/documents/Perfect_Ruleset.pdf ("TPR")

>I'm writing yet another NETFILTER/iptables HOWTO and I have the 
>following question. Consider two equivalent sets of rules (for gateway 
>with 4 interfaces, 6 networks, about 350 rules total).

I would not be surprised if measuring these 4 rules/4 chains yield
immeasurable an difference, i.e. only noise. The result is highly
dependent on what the majority of packets will be.

In your case, prefix aggregation is probably the first thing you
should do before even establishing whether to use variant 1
or 2.

>=== variant#1: linear list ===
>iptables -t filter -P FORWARD DROP
># INET->LAN
>iptables -t filter -A FORWARD -i eth1 -o eth0 -s ! 192.168.0.0/24 -d 192.168.0.1 -j ACCEPT
>iptables -t filter -A FORWARD -i eth1 -o eth0 -s ! 192.168.0.0/24 -d 192.168.0.2 -j ACCEPT
>...
># LAN->INET
>iptables -t filter -A FORWARD -i eth0 -o eth1 -s 192.168.0.1 -d ! 192.168.0.0/24 -j ACCEPT
>iptables -t filter -A FORWARD -i eth0 -o eth1 -s 192.168.0.2 -d ! 192.168.0.0/24 -j ACCEPT
>....
># INET->DMZ
>iptables -t filter -A FORWARD -i eth1 -o eth2 -p tcp -s ! 192.168.0.0/24 -d xxx.x.x.1 --dport yy -j ACCEPT
>iptables -t filter -A FORWARD -i eth1 -o eth2 -p tcp -s ! 192.168.0.0/24 -d xxx.x.x.2 --dport zz -j ACCEPT
>...
># INET->DMZ
>iptables -t filter -A FORWARD -i eth2 -o eth1 -p tcp -s xxx.xxx.x.1 -d ! 192.168.0.0/24 --dport ww -j ACCEPT
>iptables -t filter -A FORWARD -i eth2 -o eth1 -p tcp -s xxx.xxx.x.2 -d ! 192.168.0.0/24 --dport vv -j ACCEPT
>...
>...
>=================
>
>And equivalent rules, grouped into dedicated chains by interfaces and networks
>(about 11 chanis with 5-40 rules per chain):
>
>=== variant#2: chunked list ===
>iptables -t filter -P FORWARD DROP
>
>iptables -t filter -N INET_LAN
>iptables -t filter -N LAN_INET
>iptables -t filter -N INET_DMZ
>iptables -t filter -N DMZ_INET
>...
>iptables -t filter -A FORWARD -i eth1 -o eth0 -s ! 192.168.0.0/24 -d   192.168.0.0/24 -j INET_LAN
>iptables -t filter -A FORWARD -i eth0 -o eth1 -s   192.168.0.0/24 -d ! 192.168.0.0/24 -j LAN_INET
>iptables -t filter -A FORWARD -i eth1 -o eth2 -s ! 192.168.0.0/24 -d   xxx.xxx.x.x/29 -j INET_DMZ
>iptables -t filter -A FORWARD -i eth2 -o eth1 -s   xxx.xxx.x.x/29 -d ! 192.168.0.0/24 -j DMZ_INET
>...
>iptables -t filter -A INET_LAN -d 192.168.0.1 -j ACCEPT # interfaces and networks are no longer checked here
>iptables -t filter -A INET_LAN -d 192.168.0.2 -j ACCEPT
>...
>iptables -t filter -A LAN_INET -s 192.168.0.1 -j ACCEPT
>iptables -t filter -A LAN_INET -s 192.168.0.2 -j ACCEPT
>...
>iptables -t filter -A INET_DMZ -p tcp -d xxx.xxx.x.1 --dport yy -j ACCEPT
>iptables -t filter -A INET_DMZ -p tcp -d xxx.xxx.x.2 --dport zz -j ACCEPT
>...
>iptables -t filter -A DMZ_INET -p tcp -s xxx.xxx.x.1 --dport ww -j ACCEPT
>iptables -t filter -A DMZ_INET -p tcp -s xxx.xxx.x.2 --dport vv -j ACCEPT 
>...
>=================
>
>What rules set of these two would process packets faster and/or eat less CPU
>if for variant #1 a given packet traverse about 50-80% of rules to match?
