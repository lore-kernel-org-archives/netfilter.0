From: Andrew <ast.000@sympatico.ca>
Subject: using iptables to redirect services to another machine
Date: Wed, 09 Jul 2003 23:23:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <beim5r$vig$1@main.gmane.org>
Reply-To: ast.000@sympatico.ca
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

I would like to know if the following is possible to do with iptables 
and if so, how.

Can I use iptables to set up a machine to act as a proxy? I want any 
incoming traffic on particular ports to be forwarded to another machine 
on different ports. The proxy machine wouldn't be acting as a gateway or 
hiding private IP space or anything like that.

I've been playing with this myself for some time but my knowledge of 
iptables seems to be severely lacking.

Some specific information I would like to know is do I need two 
interfaces on the proxy machine and what the routing table might look like.

Andrew



