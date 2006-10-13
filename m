From: "Brendan S (Scratch User)" <gobnat@optusnet.com.au>
Subject: Iptables and rate limiting per ip address
Date: Fri, 13 Oct 2006 16:59:21 +1000
Message-ID: <452F3949.2050502@optusnet.com.au>
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

Hi  

I am an iptables beginner. I want to set up my firewall to rate limit incoming packets based on a particular source IP address (but not any other IP).

I understand that there are dstlimit and hashlimit options for iptables.  It is not clear to me whether these apply the same limit (x packets/sec) to each ip address (ie all IP addresses limited at x packets/sec) or whether their action can be applied to a single address (I suspect the former).

If it is the latter, can the hashlimit switch be limited by (eg) -s?   Alternatively can I jump past the rule for other ip addresses?

Would either of these work?
...
-A src_limit -s !<limit_ip> -j ACCEPT
-A src_limit -m hashlimit --hashlimit 2/min --hashlimit-burst 10 --hashlimit-mode srcip,dstport --hashlimit-name per_src --hashlimit-htable-gcinterval 60000 --hashlimit-htable-expire 300000 -j ACCEPT

...
or

-A src_limit -s <limit_ip> -m hashlimit --hashlimit 2/min --hashlimit-burst 10 --hashlimit-mode srcip,dstport --hashlimit-name per_src --hashlimit-htable-gcinterval 60000 --hashlimit-htable-expire 300000 -j ACCEPT

Thanks


Brendan



