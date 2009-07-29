From: "Richard C. Hesse" <richard@mochimedia.com>
Subject: ClusterIP logging "no conntrack" messages
Date: Wed, 29 Jul 2009 16:45:34 -0700
Message-ID: <2A8D2BD2-5D76-4AD0-91B4-AB625AA0ACCF@mochimedia.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

Running a 2.6.30.3 kernel, Cluster IP traffic is logging this message  
for every incoming connection per node: "CLUSTERIP: no conntrack!"

conntrack is loaded and it's loaded before ClusterIP :
nf_conntrack version 0.5.0 (32768 buckets, 262144 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=1 kernel paramater, acct=1 nf_conntrack module  
option or
sysctl net.netfilter.nf_conntrack_acct=1 to enable it.
ClusterIP Version 0.8 loaded successfully

lsmod | grep conn
xt_conntrack            4520  0
nf_conntrack_ipv4      15328  5
nf_defrag_ipv4          2440  1 nf_conntrack_ipv4
nf_conntrack           70720  4  
ipt_CLUSTERIP,xt_conntrack,nf_conntrack_ipv4,xt_state
x_tables               22544  7  
ipt_CLUSTERIP 
,xt_conntrack,ipt_LOG,xt_state,xt_tcpudp,xt_iprange,ip_tables

Was ClusterIP updated to use the new connection tracking modules?

TIA,
-richard
