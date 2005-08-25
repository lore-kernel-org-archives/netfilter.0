From: Todd Landfried <tlandfried@viatornetworks.com>
Subject: restricting connections from a single connection to a single
	destination
Date: Thu, 25 Aug 2005 07:11:36 -0700
Message-ID: <7D746B3B-FA28-451A-BCBA-FE725C91C33D@viatornetworks.com>
Mime-Version: 1.0 (Apple Message framework v734)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

I'm trying to protect some people from themselves and I want to set  
up a rule that allows a single IP on the network to connect only to  
the gateway's internal IP, thereby restricting as much as possible  
user's ability to connect to other PCs on the network. Yes, I know  
about VLANs and I know about port isolation on the hardware side, and  
I've tried explaining how to do it these folks, but they're just not  
getting it.

 From what I have read, this should work, but it doesn't. I'm not  
sure which loopback this refers to, the host or the source. Any  
suggestions?

-A PREROUTING -i lo -p icmp -d gateway-internal-private-ip -j ACCEPT
-A PREROUTING -i lo -p tcp -d gateway-internal-private-ip -j ACCEPT
-A PREROUTING -i lo -p udp -d gateway-internal-private-ip -j ACCEPT

Thanks

