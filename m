From: clister <clister@uah.es>
Subject: local connections getting natted
Date: Tue, 3 Feb 2004 11:07:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402031107.16864.clister@uah.es>
References: <1075694310.401dcae6b3b8b@smwp01.maa.sify.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075694310.401dcae6b3b8b@smwp01.maa.sify.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello, 
i have a this setup on nat table.

Chain PREROUTING (policy ACCEPT 1456K packets, 384M bytes)
 pkts bytes target     prot opt in     out     source               
destination

Chain POSTROUTING (policy ACCEPT 20 packets, 1192 bytes)
 pkts bytes target     prot opt in     out     source               
destination
 185K 8942K SNAT       all  --  *      eth0    0.0.0.0/0            0.0.0.0/0          
to:1.2.3.4

Chain OUTPUT (policy ACCEPT 74 packets, 4622 bytes)
 pkts bytes target     prot opt in     out     source               
destination

Connections coming from eth1 (internal network 10.10.10.x) to eth0 (external) 
get natted to to 1.2.3.4 , it's correct for me but whenever i try to connect 
from this box to inet i get natted also to 1.2.3.4. 

I thought this happened only if you create such rule on NAT::ouput so local 
connections get natted prior to go out of the box.

Should i change this to:
-t nat -A POSTROUTING -i eth1 -o eth0 -j SNAT --to-destination:1.2.3.4 to 
avoid local packets getting natted?

and last question:
All packets leaving routing code (local, forwarded) pass througth POSTROUTING 
chain at nat table or only forwarded packets?

Thanks



