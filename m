From: "hare ram" <hareram@sol.net.in>
Subject: Re: Bridge with iptables
Date: Fri, 4 Apr 2003 20:41:17 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <094a01c2fabc$720c4e80$13fcc5cb@Housecall>
References: <071f01c2f9ef$86489980$13fcc5cb@Housecall> <200304031024.03315.netfilter@newkirk.us>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org
Cc: Stef Coene <stef.coene@docum.org>


Hi Stef and all Gurus of iptables


thanks for the helping me setting up bridge

i have setup the bridge successfully ( transparent ) and assigned some
Public IP to br0 to monitor

In transparent Bridge, i want to divert the traffic port 80 or http traffic
to my squid Server running on port 3129 ( changed from default from 3128 to
3129)

My seltup like this

Public IP LAN x.x.x.1---eth1(Bridge (br0 x.x.x.2)) eth0--- Router (
x.x.x.3)--Internet

Gateway of the public LAN is x.x.x.3

i have done the following config.

/usr/local/sbin/iptables -t nat -A PREROUTING -i eth1 -s 0/0 -p tcp --dport
80 -j REDIRECT --to-port 3129

when i see the squid log iam not able to see anything, in browser i get
error  "The page cannot be displayed"

when i see the iptables out put look like below

[root@bridge root]# iptables -nL -v -t nat
Chain PREROUTING (policy ACCEPT 98 packets, 12602 bytes)
 pkts bytes target     prot opt in     out     source
destination
    6   288 REDIRECT   tcp  --  eth1   *       0.0.0.0/0
0.0.0.0/0          tcp dpt:80 redir ports 3129

Chain POSTROUTING (policy ACCEPT 98 packets, 12602 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination


iam able to see some packets are travelling in the same rule,

what could be the wrong, can some one guide me for this problem

thanks in advance

hare


