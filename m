From: sillysausage <sillysausage@privatedemail.net>
Subject: Re: Routing 192.168.1.0/24 to ISP and 192.168.2.0/24 to VPN using
 fwmark+mangle+iproute
Date: Mon, 10 Aug 2015 00:07:01 +0930
Message-ID: <55C7658D.3030404@privatedemail.net>
References: <55C39CFA.9050308@privatedemail.net>
 <55C4ACB2.7060205@privatedemail.net>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <55C4ACB2.7060205@privatedemail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

So I tried again with some slightly different rules:

I've only included the mangle table, rest is the same just to keep this short:

*mangle
:PREROUTING ACCEPT
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
:POSTROUTING ACCEPT

# Restore CONNMARK to the MARK (If one doesn't exist then no mark is set
-A PREROUTING -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff

# If packet MARK is 2, then it means there is already a connection mark and the original packet came in on VPN
-A PREROUTING -s 192.168.2.0/24 -m mark --mark 0x2 -j ACCEPT

# Else MARK packet as 2
#-A PREROUTING -i tun0 -j MARK --set-xmark 0x2/0xffffffff
-A PREROUTING -i tun0 -m conntrack --ctstate NEW -m mark --mark 0x0 -j MARK --set-xmark 0x2/0xffffffff

# If packet MARK is 1, then it means there is already a connection mark and the original packet came in on ISP
-A PREROUTING -s 192.168.1.0/24 -m mark --mark 0x1 -j ACCEPT

# Else MARK packet as 1
#-A PREROUTING -i ppp0 -j MARK --set-xmark 0x1/0xffffffff
-A PREROUTING -i ppp0 -m conntrack --ctstate NEW -m mark --mark 0x0 -j MARK --set-xmark 0x1/0xffffffff

# Save MARK to CONNMARK
-A PREROUTING -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xffffffff

COMMIT

#########################################################################

I also set a priority on the return connections, you'll notice in
https://marc.info/?l=netfilter&m=143895264901131&w=2 they had a priority
of 0 because they were unset.

gateway:~# ip rule
0: from all lookup local
1: from all fwmark 0x1 lookup ISP
1: from <PPP IP ADDRESS> lookup ISP
2: from all fwmark 0x2 lookup VPN
2: from 172.16.32.1 lookup VPN
32766: from all lookup main
32767: from all lookup default

#########################################################################

Finally I ran this command to show me the mangle table:

gateway:~# iptables -L --line-numbers -n -v -t mangle
Chain PREROUTING (policy ACCEPT 1577 packets, 139K bytes)
num   pkts bytes target     prot opt in     out     source               destination
1     1577  139K CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK restore
2        0     0 ACCEPT     all  --  *      *       192.168.2.0/24       0.0.0.0/0            mark match 0x2
3        0     0 MARK       all  --  tun0   *       0.0.0.0/0            0.0.0.0/0            ctstate NEW mark match 0x0 MARK set 0x2
4        0     0 ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0            mark match 0x1
5      112  6720 MARK       all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0            ctstate NEW mark match 0x0 MARK set 0x1
6     1577  139K CONNMARK   all  --  *      *       0.0.0.0/0            0.0.0.0/0            CONNMARK save

Chain INPUT (policy ACCEPT 758 packets, 68909 bytes)
num   pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 819 packets, 69715 bytes)
num   pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 620 packets, 99208 bytes)
num   pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 1380 packets, 166K bytes)
num   pkts bytes target     prot opt in     out     source               destination

#########################################################################

It seems that the packets from 192.168.1.0/24 got marked and were working.
But the host that had an IP address of 192.168.2.0/24 did not work at all.
