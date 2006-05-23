From: Klaubert Herr da Silveira <klauberts@yahoo.com>
Subject: Wierd black hole
Date: Tue, 23 May 2006 09:06:35 -0700 (PDT)
Message-ID: <20060523160635.32057.qmail@web54610.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, 

I had a wierd situation here, and I'd like to understand why this happen.

I setup a Iptables firewall doing a static NAT for a partner network, and a
Firewall-1 protecting internal network. Like this.

                       eth1    eth2
Partner <-> Router <---> Iptables <---> Fw1 <-> Internal Network
                           Nat          Nat

A build the firewall and nat rule with Firewall Builder, however I forgot to
insert the apropriated route in Iptables machine to Nat in Fw1. What is already
solved. The route to partner network is always there.

The question is. Why, whithout the route, the ip packet don't cross the
firewall (iptables)? They reach eth2 (my side) interface, but dont get routed
out to eth1 (partner side), as tcpdump could show me.No Drop were trigged.
Something like a black hole.

As soon I put the apropriate route, the packet cross both interfaces, reach
destination and come back to iptables box.

Any idea?

Klaubert

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

