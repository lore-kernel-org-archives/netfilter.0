From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: split route and kernel panic
Date: Tue, 13 Apr 2004 11:14:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010b01c42105$71f262c0$0100a8c0@newlife>
References: <20040325112139.05d42d01@localhost>
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
To: netfilter@lists.netfilter.org


OK I have sufficient evidence now that my split route
( multipath routing ) is inducing kernel panic and also
frequent connection lost. The split route itself may not be 
the culprit but I can safely say that without using the
split route, my system is perfectly stable.
 
I have set up the split route according to 

http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.rpdb.multiple-links.html
 
I could use the multipath routing to access the internet ( NAT ).
I could also do multipath in-bound port forwarding using 
netfilter CONNMARK etc etc. It is also not the fault of CONNMARK,
because without using it I experience the same problem. 

The problem I have is that I get frequent connection lost ( like very 
20 minutes or so for my connections ) and eventually I will get 
a kernel panic. Short connectionless session such as web surfing 
won't see anything unusual. I suspect the iptables interaction with 
multiple path routing is giving me this problem.

Anyone experience the same thing before ?







