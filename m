From: Simone <mimmo@ats.it>
Subject: Iptables - Bridge - QOS - MPLS
Date: Fri, 17 Mar 2006 10:52:51 +0100
Message-ID: <441A86F3.8030704@ats.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi all..

I'm working on a very interesting project about Iptables .. bridging
server.. qos.. well managing traffic you can see.

The situation is easy.

 lnx server --- router A --- router B  --- lnx bridge box --- router C
--- client

What i need to do is shape the traffic from/to "client" to "lnx server".
On a normal IP situation this is not hard to configure and all is
working good.
I'm able to shape any kind of traffic, working at layer7 with special rules.

The problem is over the second step.
I had the MPLS protocol over the 3 routers.
The traffic from/to server still work naturally but iptables over the
lnx bridge box isen't able anymore to TAG the traffic and shape it.

So what i ask..
Where i can found the right patches and the support for MPLS for linux ?
iptables need to be patched too ?
I'm sure . searching over various newsletter that there are some
experiments out.. anyone could help me to resolve this situation ?

Thanks in advice for any good reply.

Simon


