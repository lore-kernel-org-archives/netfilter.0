From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: ip conflict with proxy arp
Date: Tue, 29 Oct 2002 12:28:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029122844.6b1e70ca.arc_of_descent@gmx.net>
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


HI,
I've got a proxy arp setup with iptables and tc.
 
on eth0 i have a route to 172.16.2.0/24 network
on eth1 is the LAN of 172.16.1.0/24 network
 
I have enabled proxy arp on both interfaces.
Now accordingly, the interface will respond
to all ARP requests for which it has a route to.
 
Noy my setup is such, that a user on the LAN,
would like to have an ip from the 172.16.2.0/24 network.
 
But unfortunately, when he tries to allocate an
ip like 172.16.2.1 he gets an ip conflict.
 
I also know why he is getting it!
But is there any way out of this??
 
Something like, tell the linux server to respond for
ARP requests for the 172.16.2.0/24 network but at the
same time if a machine is trying to use an ip for itself,
then it should not respond.
 
Help!
 
--
arc_of_descent

