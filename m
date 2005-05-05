From: varun_saa@vsnl.net
Subject: IP + MAC filter -  wireless client
Date: Thu, 05 May 2005 10:58:53 +0500
Message-ID: <cae754caa373.caa373cae754@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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

Hello,
     My server is on Mandriva 10.1
eth0 is WAN with static IP connected to 512K DSL
eth1 is LAN - 192.168.0.0/24 and 192.168.21.0/24

I want to use IP + MAC filtering to allow/deny
clients acces to net as follows.

A FORWARD -i eth1 -o eth0 -s 192.168.0.5 \
-m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT

How do you handle a client connected to the LAN
via wireless. In such a case there will be more
than one MAC address in the route.

Can you have multiple MAC in one rule or it is better
to have multiple rule for the same IP for each MAC.

Thanks in advance

Varun


