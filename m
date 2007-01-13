From: "Carlos Rotenberg" <rotenberg@gmail.com>
Subject: how to configure a router/firewall with no nat
Date: Sat, 13 Jan 2007 12:40:24 -0500
Message-ID: <45a9198a.5171c3c7.243e.ffff8458@mx.google.com>
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

I have to create a Firewall/Router with Iptables to protect our clients, but
I can't do NAT, my clients have to have Public IPs on their servers.
I was trying to figure out how to do that, but I couldn't get any clue.
 
The provider assigned me a /24 network and he gave me /30 network for the
external network, if someone can help me, I'll appreciate it.
 
Thank you,
 
Carlos

Example:
Router Network 200.200.199.0/30
Provider Router Ip address: 200.200.199.1
My Firewall/Router IP address: 200.200.199.2
 
Clients Network assigned: 200.200.200.0/24
 
 
      200.200.199.1/30              FIREWALL 200.200.200.1/28
200.200.200.0/27  
INTERNET  -----------------------   ROUTER
------------------------------------------  CLIENT 1 SERVERS
                  200.200.199.2/30  IPTABLES |
Default gateway: 200.200.200.1
                                             |
                                             |
                                             |
                                             | 200.200.200.33/28
200.200.200.32/28
 
------------------------------------------  CLIENT 2 SERVERS
                                             |
Default gateway: 200.200.200.33                                         |
                                             |
                                             |
                                             |
                                             | 200.200.200.65/27
200.200.200.64/27
 
------------------------------------------  CLIENT 3 SERVERS
                                             |
Default gateway: 200.200.200.65
                                             |
                                             |
                                             |
                                             | 200.200.200.129/25
200.200.200.128/25
 
------------------------------------------  CLIENT 4 SERVERS
 
Default gateway: 200.200.200.129
 


