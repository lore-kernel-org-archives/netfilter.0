From: dan+dated+1058668604.792ecd@shortcircuit.dyndns.org
Subject: iptables 1.2.8, patch-o-matic's string, custom table, & DNAT
Date: Thu, 19 Jun 2003 20:38:41 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E19TBmY-0000RR-MH@shortcircuit.dyndns.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ok folks. I'm hopefull someone here can help me out. Here's my situation:
I have a single IP from my internet provider (any more and they want to charge
me $5/mo/IP!!), but I have multiple domain names that need servicing. Now if
it was just HTTP then fine. I could use the name based virtual hosting. But,
I need to be able to make forwarding decisions based on the domain name in
the packet. I.e. if the packet is destined for mydomain1.com port 25, pass it
through to the SMTP server running here. But if it's destined for mydomain2.com, then forward it to 192.168.0.10:8025. Now I had the idea of using a custom chain for things that would match the string, but you cann't do DNAT on a custom chain. I also tried using the string matching on the PREROUTING chain, but the -string module doesn't recognise --dport :<

I'm open to suggestions. I'm going to keep hacking at it also, but in the mean time.... Help!?

Thanks!
--- Dan

