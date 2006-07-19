From: Ross Cameron <ross.cameron@linuxpro.co.za>
Subject: Firewalling issue
Date: Wed, 19 Jul 2006 12:25:44 +0200
Message-ID: <44BE08A8.2020507@linuxpro.co.za>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi there list I have the following issue:

I have a IP split setup on one of my Linux boxes (see diagram below), I 
can route and all access is hunky dory,... BUT I want to block access to 
my DMZ'z gateway address from the outside world.
    How do I do this?


+------------+                                       +------------ +
|            |       eth0 +-------------+  eth1      |             |
|  Internet  |============| FW / Router |============| LAN         |
|            |            +-------------+            |             |
+------------+                    || eth2            +------------ +
                                  ||
                                  ||
                                  ||
                                  ||                 +------------ +
                                  |+-----------------|             |
                                  +------------------|    DMZ      |
                                                     |             |
                                                     +------------ +

KEY:
~~~~
eth0   =>   196.x.x.122 / 255.255.255.252
eth1   =>   192.168.x.x / 255.255.255.0
eth2   =>   196.x.x.94  / 255.255.255.240


The Internet needs to be able to see 196.x.x.80 -> 196.x.x.95,... with 
the exception of 196.x.x.94!!!

Everything else is correct and how I need it to be,... I need to know 
how to DROP the packets coming in on eth0 for 196.x.x.94
BUT packets coming in on eth2 for 196.x.x.94 need to be allowed.

Regards,...
Ross Cameron

