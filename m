From: Davide Giunchi <davidegiunchi@libero.it>
Subject: forwarding proxy traffic to another gateway
Date: Mon, 31 Mar 2003 13:59:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303311359.52463.davidegiunchi@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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


   LAN 192.168.1.x
 ____|___
| LNX        |              _________  192.168.10.x
|________|----------| ROUTER  |
     |                        |_________|  FLAT
 __|______
|                  |  PUBLIC IP
| ROUTER |  
|_________|

I've a Linux server that act as a firewall/proxy from an internal lan to 
internet. It runs a Squid proxy in the port 3128.

I want the server to listen to it's pubblic address and reply to the 
"question" from this ip via the public router, so i've set the default 
gateway to the "public ip router".
But i want that all the traffic from the internal lan that pass throught the 
PROXY to use another gateway, say 192.168.10.254, how can i do this?

I've tryied various combination of route and iptables but i haven't found the 
solution.

Regards.

-- 
Davide Giunchi

