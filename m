From: Aidas Kasparas <a.kasparas@gmc.lt>
Subject: ipset: stops working after a while
Date: Thu, 07 Jun 2012 08:23:49 +0300
Message-ID: <4FD03AE5.9000509@gmc.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a strange problem with iptables/ipset. I'm under 80Mbps+ SYN
flood (if to believe hoster's monitoring). Attack is not sofisticated --
SYN packet's source address is [pseudo]random, spread more or less
evenly over all available IPv4 address space (even block E). Idea was to
drop first SYN packet from every IP address I haven't seen in past 10
secs. So, I set up the following setup:


iptables -N firstdrop

iptables -N fd_0; iptables -A firstdrop -s 0.0.0.0/5 -j fd_0
iptables -N fd_8; iptables -A firstdrop -s 8.0.0.0/5 -j fd_8
...
iptables -N fd_216; iptables -A firstdrop -s 216.0.0.0/5 -j fd_216

ipset create fd_1 hash:ip timeout 10
ipset create fd_2 hash:ip timeout 10
...
ipset create fd_223 hash:ip timeout 10

iptables -A fd_0 -s 1.0.0.0/8 -m set --match-set fd_1 src -j RETURN;
iptables -A fd_0 -s 1.0.0.0/8 -j SET --add-set fd_1 src;
iptables -A fd_0 -s 2.0.0.0/8 -m set --match-set fd_2 src -j RETURN;
iptables -A fd_0 -s 2.0.0.0/8 -j SET --add-set fd_2 src;
...
iptables -A fd_0 -s 7.0.0.0/8 -m set --match-set fd_7 src -j RETURN;
iptables -A fd_0 -s 7.0.0.0/8 -j SET --add-set fd_7 src;
iptables -A fd_8 -s 8.0.0.0/8 -m set --match-set fd_8 src -j RETURN;
iptables -A fd_8 -s 8.0.0.0/8 -j SET --add-set fd_8 src;
...
iptables -A fd_216 -s 223.0.0.0/8 -m set --match-set fd_223 src -j RETURN;
iptables -A fd_216 -s 223.0.0.0/8 -j SET --add-set fd_223 src;

iptables -A fd_0 -j DROP
iptables -A fd_8 -j DROP
...
iptables -A fd_216 -j DROP

iptables -A INPUT -s admin's_IP -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -j firstdrop


That works. Legitimate connections goes through. Outgoing traffic drops
to few megabits, as required for normal operations.


But, after a while (sometimes day, sometimes few hours) no IP addresses
are added to fd_$i's by these iptables rules. And all the packets become
DROP'ed. But if I try to add address by ipset command, or by different
iptables rule -- then these addresses are added to ipsets (not sure, if
that would work for any and all of them).

Where should I search for the problem?

kernel 3.2.0-24.39 from Ubuntu 12.04, x86_64
ipset 6.11-2 (Ubuntu)
when not working sets looks like this:

# ipset list fd_88
Name: fd_88
Type: hash:ip
Header: family inet hashsize 1024 maxelem 65536 timeout 10
Size in memory: 82040
References: 3
Members:
#

Third reference is for testing iptables rules, which adds test ip
address to every fd_i, to be checked if adding works.

-- 
Aidas Kasparas
IT administrator
GM Consult Group, UAB

+370 686 08473
http://www.gmc.lt
