From: Dave Cinege <dcinege-mlists-dated-1112942287.e58b6f@psychosis.com>
Subject: Captive DNS REDIRECT problems. Need a stateless/fast timeout udp
	connection.
Date: Sun, 3 Apr 2005 01:38:03 -0500
Message-ID: <200504030138.03902.dcinege-mlists@psychosis.com>
Reply-To: dcinege-mlists@psychosis.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I working on a dynamic rules firewall that has the ability to do captive 
portal redirection for login purposes. Right now I've got a problem dealing 
with DNS redirection (udp connection timeout) I'm not sure how to best 
handle.

There are 2 DNS forwarders. One for authorized hosts on port 53 and one for 
unauthorized hosts on 5353. The latter feeds hosts dummy DNS replies in order 
to allow browser redirection back to the portal. 

My default rules look like this:
iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 5353
iptables -t nat -A PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5353
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 80
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 443

When a host is authorized a rule for such host is inserted before these rules, 
thus diverting them from the redirection.

Here in lies the problem. When an unauthorized host first hits port 53 and is 
redirected to 5353 a udp connection track stream is tacked up. Once they 
become authorized their 'ACCEPT' rule in inserted, however the original 
53->5353 REDIRECT stream is still alive, and will continued to be used until 
it times out. During this time the host is dead in the water with no 'real' 
DNS.

It looks like dropping the ip_conntrack_udp_timeout down to 1 second, 
effectively solves this. But that is not ideal for all other udp connections. 
It doesn't appear I have a way set a per connection rule timeout, or force a 
rule to be stateless, so I'm wondering the best way to solve this. 

Dave


