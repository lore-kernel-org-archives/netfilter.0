From: Juergen Schmidt <abcdmail@freenet.de>
Subject: sip helper doesn't match on calls to myself
Date: Wed, 9 Nov 2016 17:01:38 +0100
Message-ID: <a3cf2e4b-1345-1efc-b211-5fea64438baf@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!

I've got the following problem: If I'm calling myself, the incoming call
isn't matched by the sip helper rules, but the rules w/o sip helper. I
would have expected, that both calls are matched by the sip helper rules.


In detail:

Given is an asterisk server, one extension (C610 IP with 3 phones, which
can handle 2 lines at the same time) and a trunk to the provider.

The extension calls the own number, which provides the following scenario:

outgoing call: extension -> asterisk -> provider

   and

incoming call: provider -> asterisk -> extension


*Important*: the provider uses independent media servers. This means:
the signaling server and the media servers have different IP addresses.


The calls from asterisk to the extensions are not described here,
because there is no problem.


This means:
At the outgoing interface (ppp0) to the provider can be seen 4 legs, 2
of the outgoing call and 2 of the incoming call. The 2 legs of the
incoming call are not matched by the sip helper rules!

kernel is 	4.4.26
iptables is 	v1.4.21



iptables is configured like this:


modprobe nf_conntrack_sip sip_direct_media=0
echo 0 > /proc/sys/net/netfilter/nf_conntrack_helper


# register sip helper
iptables -I OUTPUT -t raw -p udp -m udp -o ppp0  -d 217.0.22.0/23 -s
$IPLOCAL --dport 5060 -j CT --helper sip

iptables -I PREROUTING -t raw -p udp -m udp -i ppp0 s 217.0.22.0/23 -d
$IPLOCAL --sport 5060 -j CT --helper sip


# match packages in OUTPUT:
---------------------------
iptables -I OUTPUT -p udp -s $IPLOCAL -d 217.0.22.0/23 --sport 5060
--dport 5060 -j ACCEPT

# rtp (matched by the outgoing call)
iptables -A OUTPUT -p udp -s $IPLOCAL -d 217.0.0.0/13 --sport
30000:40000 -m conntrack --ctstate RELATED,ESTABLISHED -m helper
--helper sip -j ACCEPT

# why is this rule necessary for the incoming call when calling to self?
# matched by the incoming call
iptables -A internet-out -p udp -o ppp0 -s $IPLOCAL -d 217.0.0.0/13
--sport 30000:40000 -m conntrack --ctstate ESTABLISHED -j ACCEPT


match packages in INPUT:
------------------------
iptables -I INPUT -i ppp0 -p udp -s 217.0.22.0/23 -d $IPLOCAL --sport
5060 --dport 5060 -m conntrack --ctstate RELATED,ESTABLISHED  -j ACCEPT

# rtp (matched by the outgoing call)
iptables -A internet-in -i ppp0 -p udp -s 217.0.0.0/13 -d $IPLOCAL
--dport 30000:40000 -m conntrack --ctstate RELATED,ESTABLISHED -m helper
--helper sip -j ACCEPT

# why is this rule necessary for the incoming call?
# matched by the incoming call
iptables -A internet-in -i ppp0 -p udp -s 217.0.0.0/13 -d $IPLOCAL
--dport 30000:40000 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT




conntrack -L gives:

# Outgoing call (is matched as expected):
# rtp
udp      17 179 src=$IPLOCAL dst=217.0.4.103 sport=17188 dport=2016
src=217.0.4.103 dst=$IPLOCAL sport=2016 dport=17188 [ASSURED] mark=0 use=1
# rtcp
udp      17 175 src=$IPLOCAL dst=217.0.4.103 sport=17189 dport=2017
src=217.0.4.103 dst=$IPLOCAL sport=2017 dport=17189 [ASSURED] mark=0 use=1


# Incoming call - which is *not* matched by sip helper rules, but by the
conntrack rule without sip helper:
# rtp
udp      17 179 src=217.0.4.135 dst=$IPLOCAL sport=53254 dport=18900
src=$IPLOCAL dst=217.0.4.135 sport=18900 dport=53254 [ASSURED] mark=0 use=2
# rtcp
udp      17 175 src=217.0.4.135 dst=$IPLOCAL sport=53255 dport=18901
src=$IPLOCAL dst=217.0.4.135 sport=18901 dport=53255 [ASSURED] mark=0 use=1



I would be glad to get some hint why it behaves like this.



Thanks,
Juergen
