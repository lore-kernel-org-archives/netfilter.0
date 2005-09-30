From: "Brent Wilkinson" <brent@air2data.com>
Subject: Dynamic Natting or Mobile ip
Date: Fri, 30 Sep 2005 10:52:18 -0600
Message-ID: <25236.8535184816$1128099293@news.gmane.org>
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

I am trying to figure out a feature I saw on a dlink router. 

I am creating some routers/servers for a few hotels. There requirements say
I must have a dynamic nat router. What it does is allow anyone with any
static ip to be able to connect to the network and get internet access.

Example:

Router/server
Ip:192.168.100.1/24
Dhcp server range: 192.168.100.50-192.168.100.200

Example client
Static ip: 10.1.2.47
Subnet: 255.255.255.180
Gateway: 10.1.2.1
Dns: 1.1.1.1

What I want to do is allow the client through the network without changing
there ip info. I have heard of something called mobile ip or dynamic
natting. Is anyone familiar with what I am describing and/or has done it? If
you have do you have any web pages that give information on it.

Thanks

Brent Wilkinson

