From: "Nestor A. Diaz" <nestor@tiendalinux.com>
Subject: Re: Clarification on the use of the statistic module
Date: Thu, 11 Jul 2013 13:49:08 -0500
Message-ID: <51DEFE24.8030601@tiendalinux.com>
References: <51DD79C7.3080707@tiendalinux.com> <51DE7697.3020204@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51DE7697.3020204@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, thanks for your answer, as i understand the statistic module use a
static counter that change everytime the packet traverse the chains, i
though the counter got altered just one time while the packet traverse
the chains.

According to your suggestion if i remove the line with the "-j ACCEPT"
then the statistic log as I want and in fact it does.

However if i jump to a 'DNAT' directly, the problem persist as (50/25)
it doesn't work as i have read from some websites

# This doesn't work:

/sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
DNAT --to-destination 192.168.2.20:7101
/sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
2 --packet 1 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
DNAT --to-destination 192.168.2.20:7102

As solution if I want to jump to DNAT directly then i have to decrease
the 'every' option as follows which do what i want:

# This works:
/sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
DNAT --to-destination 192.168.2.20:7101
/sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
1 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
DNAT --to-destination 192.168.2.20:7102

I am experimenting with the behavior and if I jump to custom chain which
performs other operations like 'log' statistics keep working as
expected. (50/50) however if i put a 'DNAT' rule things become (50/25),
it seems DNAT affects the behavior but i don't know why,  Any
explanation for this will be appreciated.

# Still don't work:

/sbin/iptables -t nat -N custom_chain_1
/sbin/iptables -t nat -F custom_chain_1
/sbin/iptables -t nat -A custom_chain_1 -j LOG --log-prefix
20130711120831_packet_0
/sbin/iptables -t nat -A custom_chain_1 -i eth0 -s 0.0.0.0/0 -d
192.168.1.1 -p tcp --dport 7100 -j DNAT --to-destination 192.168.2.20:7101

/sbin/iptables -t nat -N custom_chain_2
/sbin/iptables -t nat -F custom_chain_2
/sbin/iptables -t nat -A custom_chain_2 -j LOG --log-prefix
20130711120831_packet_1
/sbin/iptables -t nat -A custom_chain_2 -i eth0 -s 0.0.0.0/0 -d
192.168.1.1 -p tcp --dport 7100 -j DNAT --to-destination 192.168.2.20:7102

/sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
2 --packet 0 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
custom_chain_1
/sbin/iptables -t nat -A prerouting_rule -m statistic --mode nth --every
2 --packet 1 -i eth0 -s 0.0.0.0/0 -d 192.168.1.1 -p tcp --dport 7100 -j
custom_chain_2

Slds.

-- 
Typed on my key64.org keyboard

Nestor A Diaz

