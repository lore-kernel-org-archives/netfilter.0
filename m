From: Glenn Terjesen <glenn@webcat.no>
Subject: limiting ssh access to router/firewall
Date: Thu, 8 Sep 2005 08:50:39 +0200
Message-ID: <200509080850.39611.glenn@webcat.no>
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

Hi,
Im having problems with limiting ssh access to my router, it acts like a 
router and a firewall, and i need only my office ip able to connect to the 
router.
All my other rules works just fine(FORWARD).. im probarly just got the INPUT 
command messed up..

This is some of my firewall script.

iptables -F
iptables -X
iptables -Z

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

iptables -A INPUT -i lo -p all -j ACCEPT
iptables -A OUTPUT -o lo -p all -j ACCEPT


# SSH access router
iptables -A INPUT -i eth0 -s ! "my office ip" -d "router ip" -p tcp --dport 22 
-j DROP


...servers...

If I use this script I loose ssh access from my office ip, how can i do this 
right?

If you got any suggestions pls help, thanks

