From: marcfun@free.fr
Subject: Is "--ctstate RELATED" deprecated ?
Date: Tue, 24 Oct 2017 11:42:54 +0200 (CEST)
Message-ID: <236899556.60177991.1508838174605.JavaMail.root@zimbra65-e11.priv.proxad.net>
References: <518706823.59969905.1508834982526.JavaMail.root@zimbra65-e11.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <518706823.59969905.1508834982526.JavaMail.root@zimbra65-e11.priv.proxad.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

Upgrading my gateway rig, my iptables rules broke for some protocols.

I tracked the issue down to the conntrack rules regarding RELATED packets.
On a clean archlinux install (that is a 4.13.8 kernel with iptables v1.6.1, conntrack-tools  v1.4.4), I do this :

[root@archlinux ~]# iptables -t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp
[root@archlinux ~]# iptables -A INPUT -m conntrack --ctstate RELATED -m helper --helper ftp -j ACCEPT
[root@archlinux ~]# iptables -A INPUT -m conntrack --ctstate RELATED -j ACCEPT

=> That gives : 

[root@archlinux ~]# iptables -nvL
Chain INPUT (policy ACCEPT 333 packets, 32326 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED helper match "ftp"
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 235 packets, 30284 bytes)
 pkts bytes target     prot opt in     out     source               destination
[root@archlinux ~]# iptables -nvL -t raw
Chain PREROUTING (policy ACCEPT 6 packets, 470 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 4 packets, 464 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 CT         tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:21 CT helper ftp

and lsmod shows :
Module                  Size  Used by
nf_conntrack_netlink    36864  0
nfnetlink              16384  1 nf_conntrack_netlink
xt_helper              16384  1
iptable_filter         16384  1
xt_conntrack           16384  2
nf_conntrack_ftp       20480  1
nf_conntrack_ipv4      16384  4
nf_defrag_ipv4         16384  1 nf_conntrack_ipv4
xt_tcpudp              16384  1
iptable_raw            16384  1
xt_CT                  16384  1
nf_conntrack          110592  6 nf_conntrack_ftp,nf_conntrack_ipv4,xt_helper,nf_conntrack_netlink,xt_CT,xt_conntrack
libcrc32c              16384  1 nf_conntrack
[...]
ip_tables              24576  2 iptable_filter,iptable_raw
x_tables               32768  7 ip_tables,iptable_filter,xt_tcpudp,iptable_raw,xt_helper,xt_CT,xt_conntrack
[...]


I follow the conntrack events for expect with "conntrack -E expect", and i another shell I initiate a PASSIVE FTP session.
Here's what I get :

[root@archlinux ~]# conntrack -E expect
    [NEW] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=45647 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp
[DESTROY] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=45647 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp
    [NEW] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=27314 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp
[DESTROY] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=27314 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp

...so far, so good.
In the raw tables, we see that the packets are correctly assigned the ftp helper :

[root@archlinux ~]# iptables -nvL -t raw
Chain PREROUTING (policy ACCEPT 175 packets, 16587 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 112 packets, 13182 bytes)
 pkts bytes target     prot opt in     out     source               destination
   19   853 CT         tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:21 CT helper ftp

BUT in the filter table, the RELATED ctstate is not matched...
[root@archlinux ~]# iptables -nvL
Chain INPUT (policy ACCEPT 227 packets, 20645 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED helper match "ftp"
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 140 packets, 17006 bytes)
 pkts bytes target     prot opt in     out     source               destination


This is on a VM freshly built for the occasion, but I have the same behavior on real hardware (plain intel x64 PC).
Obviously I'm missing something. Can anyone point me in the right direction ?


King regards,
Marc Fundenberger.







