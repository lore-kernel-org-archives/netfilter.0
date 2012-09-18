From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: LOG target missing
Date: Tue, 18 Sep 2012 19:23:54 +0200
Message-ID: <k3aan9$n75$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
on a newly setup system I can't find iptables LOG target, neither ipt_LOG nor xt_LOG nor nf_LOG is present.
Has the module name changed, or what's the reason it's not found anymore?
REJECT target is present.

(I just wonder: ACCEPT, REJECT, and LOG are basic, IMHO mandatory, targets,
why not make them built-in into iptables core?)


System:

#uname -a
Linux c22 3.5.0-rc5-my1a #1 SMP Tue Jul 3 04:01:33 CEST 2012 x86_64 GNU/Linux

# iptables --version
iptables v1.4.14

root@c22:/sys/module# lsmod | grep -i ipt
ipt_REJECT              2014  45
iptable_mangle          1424  1
iptable_nat             3432  0
nf_nat                 12237  1 iptable_nat
nf_conntrack_ipv4       9816  37 nf_nat,iptable_nat
nf_conntrack           47391  4 nf_nat,xt_state,iptable_nat,nf_conntrack_ipv4
iptable_filter          1312  1
ip_tables              13877  3 iptable_filter,iptable_mangle,iptable_nat
x_tables               14052  9 
ip_tables,xt_tcpudp,xt_string,xt_limit,xt_state,iptable_filter,ipt_REJECT,iptable_mangle,iptable_nat

root@c22:/sys/module# lsmod | grep -i xt
xt_string               1203  1
xt_limit                1726  0
xt_state                1151  34
xt_tcpudp               2258  80
nf_conntrack           47391  4 nf_nat,xt_state,iptable_nat,nf_conntrack_ipv4
x_tables               14052  9 
ip_tables,xt_tcpudp,xt_string,xt_limit,xt_state,iptable_filter,ipt_REJECT,iptable_mangle,iptable_nat

root@c22:/sys/module# lsmod | grep -i nf
nf_nat                 12237  1 iptable_nat
nf_conntrack_ipv4       9816  37 nf_nat,iptable_nat
nf_defrag_ipv4          1179  1 nf_conntrack_ipv4
nf_conntrack           47391  4 nf_nat,xt_state,iptable_nat,nf_conntrack_ipv4

