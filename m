From: "Rafael Marangoni" <listas@rafa.eti.br>
Subject: Tool for monitoring, graphs, but more detailed
Date: Thu, 29 Jun 2006 14:47:02 -0300
Message-ID: <001701c69ba4$07144ab0$0a00000a@poseidon>
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

Hello!

Well, I'm looking for a tool that can help me with a question: make
reports/graphics of the traffic passing through some firewalls (Linux
gateways, using iptables and others tools).

Yes, I know about MRTG and some others, but it makes graphs of the
entire traffic, and can't explain more detailed. 

I need to explicit the traffic:
	- smtp traffic;
	- web (http/https) traffic;
	- gree traffic;
	- udp ;
	- icmp;
	- etc....

Ok, it can work in the concept of ports, and don't need to open the
packets passing through to know what type of TCP packet is it (example:
TCP 80 is http, TCP 25 is SMTP).

Searching, googling,...., I encountered a very good site (Stanford
University) that collected many tools for monitoring, and probably
anyone posted it here, but I'll do it again:

http://www.slac.stanford.edu/

But there looks like that doesn't have what I'm looking for.

And tools like iptraf, don't help me, because I need graphs, beauty
graphs ;).

Anyone can help me with this question?!

Thanks for all!

Rafael Marangoni


