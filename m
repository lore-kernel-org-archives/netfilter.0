From: Madhuri Patwardhan <madhuri@cc.iitb.ac.in>
Subject: rerouting after postrouting in NAT table
Date: Fri, 17 Oct 2003 13:05:01 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8F9BA5.1090502@cc.iitb.ac.in>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


Hi,

I would like to choose the appropriate routing table using the packet 
source address which is altered by the NAT table post-routing chain.
Is it possible? I have given the detailed scenerio below.

This is what I have:

I have a linux box with connections to two WAN links.
We are doing load balancing using Ultra monkey software. The same linux 
box also works as a Linux director and directs the packets to real 
servers. The real servers have private IP's. It is similar to the 
example given on the ultramonkey site: 
http://www.ultramonkey.org/2.0.1/topologies/lb-eg.html

On the Linux Director box (which has two WAN links), masquerading for 
the real server's private IP's happens with the following command.

/sbin/iptables -t nat -A POSTROUTING -j MASQUERADE -s 192.168.6.0/24
(as given in the example on ultramonkey site, which is mentioned above)

So, in the POSTROUTING chain the source address gets changed to one of 
the WAN links public IP.

I would like to route the reply packets on the same WAN link on which 
the query came.

For example:

I have two WAN links whose IP ranges are 203.199.51.0/24(WAN link X) and 
203.197.74.128/25 (WAN link Y).

A packet comes on WAN link X destined to a address 203.199.51.159, which 
is a virtual IP of the Linux Director on the Linux box.

This packet is handed over to the real server which generates reply and 
sends the packet back to Linux Director. The Linux Director changes the 
source IP to 203.199.51.159 as per the iptables masqurade rule mentioned 
above in the NAT tables post-routing chain.

I have created two routing tables one with a default route of WAN link X 
and the other with a default route of WAN link Y. Depending on the 
source address, in this case 203.199.51.159 I would like it to choose 
the appropriate routing table and hence WAN link X.

Is this possible? What I am wondering is since it is in the post routing 
chain that the source address is changed, is it possible that rerouting 
will happen again and the appropriate default route will be chosen after 
postrouting chain is traversed?


If any part needs better explaination please let me know. I would really 
appreciate any pointers/clues.


Thanks in advance.

Madhuri


