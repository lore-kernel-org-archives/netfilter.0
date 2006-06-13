From: Henning Wangerin <post+050629@henning.wangerin.dk>
Subject: NAT problems forwarding from a routed subnet.
Date: Tue, 13 Jun 2006 15:20:09 +0200
Message-ID: <1150204810.16144.39.camel@server.ltsp>
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

Hi!

I'm in control of a larger WLAN network, where we are connected via
a /30 network, and have a routed /28 network that we are going to
forward ip by by to some of our users.

Each location have an 10.128.x.1/24 network where eg 10.128.x.250 is
natted to 10.10.x.250 on my LAN.

That works fine. I can ssh from the WLAN-network to 10.128.x.250 and get
access to the desired server.

I need to get access the same way from the internet, so eg a.b.c.50 is
forwarded to 10.128.x.250.

I'tried multiple solutions, but nothing works.

Any tips/links on how to get it to work?

BTW the network is described here:
	http://www.olsr-net.dk

-- 
Henning Wangerin <post+050629@henning.wangerin.dk>

