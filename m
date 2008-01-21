From: Eial Czerwacki <eial@cs.bgu.ac.il>
Subject: iptables block samba or not?
Date: Tue, 22 Jan 2008 00:33:26 +0200 (IST)
Message-ID: <200801212233.m0LMXQqO006594@indigo.cs.bgu.ac.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hello to all.
I have a strange issue with iptables an samba, I've added samba's ports to iptables and tried to connect to my local network but it isnt
working, it seems that iptables is blocking samba. here are my iptables rules:

*filter
:INPUT ACCEPT [5:952]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [1192099:595387635]

# accept all from localhost
-A INPUT -s 127.0.0.1 -j ACCEPT

# accept all previously established connections
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# ssh
-A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT

# ftp / webserver related
-A INPUT -p tcp -m state --state NEW --dport 20 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 21 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 80 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 443 -j ACCEPT

# Windows / Samba
-A INPUT -p tcp -m state --state NEW --dport 135 -s 132.72.144.0/20 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 139 -s 132.72.144.0/20 -j ACCEPT
-A INPUT -p udp -m state --state NEW --dport 137:138 -s 132.72.144.0/20 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 426 -s 132.72.144.0/20 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 445 -s 132.72.144.0/20 -j ACCEPT

-A INPUT -p tcp -m state --state NEW --dport 135 -s 192.168.114.0/24 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 139 -s 192.168.114.0/24 -j ACCEPT
-A INPUT -p udp -m state --state NEW --dport 137:138 -s 192.168.114.0/24 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 426 -s 192.168.114.0/24 -j ACCEPT
-A INPUT -p tcp -m state --state NEW --dport 445 -s 192.168.114.0/24 -j ACCEPT

# up to 5 Bit-torrent connections
-A INPUT -p tcp -m state --state NEW --dport 6881:6886 -j ACCEPT

#else
-A INPUT -j REJECT --reject-with icmp-port-unreachable

COMMIT

here is the output of iptables -nvL -t filter:

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    2   162 ACCEPT     all  --  *      *       127.0.0.1            0.0.0.0/0
 4163 3400K ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:22
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:20
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:21
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:80
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpt:443
    0     0 ACCEPT     tcp  --  *      *       132.72.144.0/20      0.0.0.0/0           state NEW tcp dpt:135
    0     0 ACCEPT     tcp  --  *      *       132.72.144.0/20      0.0.0.0/0           state NEW tcp dpt:139
19303 2144K ACCEPT     udp  --  *      *       132.72.144.0/20      0.0.0.0/0           state NEW udp dpts:137:138
    0     0 ACCEPT     tcp  --  *      *       132.72.144.0/20      0.0.0.0/0           state NEW tcp dpt:426
    0     0 ACCEPT     tcp  --  *      *       132.72.144.0/20      0.0.0.0/0           state NEW tcp dpt:445
    0     0 ACCEPT     tcp  --  *      *       192.168.114.0/24     0.0.0.0/0           state NEW tcp dpt:135
    0     0 ACCEPT     tcp  --  *      *       192.168.114.0/24     0.0.0.0/0           state NEW tcp dpt:139
    0     0 ACCEPT     udp  --  *      *       192.168.114.0/24     0.0.0.0/0           state NEW udp dpts:137:138
    0     0 ACCEPT     tcp  --  *      *       192.168.114.0/24     0.0.0.0/0           state NEW tcp dpt:426
    0     0 ACCEPT     tcp  --  *      *       192.168.114.0/24     0.0.0.0/0           state NEW tcp dpt:445
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW tcp dpts:6881:6886
 1347  540K REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-port-unreachable

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 5079 packets, 777K bytes)
 pkts bytes target     prot opt in     out     source               destination

the ports are open and they receiving packages but the policy accept total is showing 0.
how can I open them? what port or rule did I missed?
one more thing, is there a way to sent multiple source addresses to one rule?

thanks in advance



