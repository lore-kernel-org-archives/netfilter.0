From: James MacLean <macleajb@ednet.ns.ca>
Subject: Re: Private traffic seen on public NATed interface - Linux 2.6.10-11
 tested
Date: Tue, 15 Mar 2005 19:20:48 -0400
Message-ID: <42376DD0.706@ednet.ns.ca>
References: <423737E2.4050201@ednet.ns.ca> <42374547.7030204@fastwebnet.it>
	<42374C4B.8070801@ednet.ns.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42374C4B.8070801@ednet.ns.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: NetFilter <netfilter@lists.netfilter.org>

James MacLean wrote:

>
> Could not give an iptables dump from this site as it is huge and
> revealing, but will see if the table from the second site is available.
>
Here is the table from the second site:

[#] iptables -L -nv -t nat
Chain PREROUTING (policy ACCEPT 825K packets, 67M bytes)
 pkts bytes target     prot opt in     out     source destination
 1156 55754 REDIRECT   tcp  --  eth1   *       0.0.0.0/0 
0.0.0.0/0           multiport dports 21,2222,3210 redir ports 2370
20841 1015K ACCEPT     tcp  --  eth1   *       0.0.0.0/0 
142.177.0.0/16      tcp dpt:80
 193K 9354K REDIRECT   tcp  --  eth1   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:80 redir ports 3128

Chain POSTROUTING (policy ACCEPT 882K packets, 54M bytes)
 pkts bytes target     prot opt in     out     source destination
80991 3767K ACCEPT     all  --  *      *       142.177.178.40 0.0.0.0/0
   24  3796 ACCEPT     all  --  *      *       142.177.178.15 0.0.0.0/0
 428K   26M SNAT       all  --  *      eth0   !142.177.178.60 
0.0.0.0/0           to:142.227.188.60

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source destination

JES

