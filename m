From: "Manikandan" <manikandan@manikandan.org>
Subject: LAN Proxy - iptables gateway
Date: Fri, 10 Sep 2004 11:06:04 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C5e54-0002P5-00@deer.gmane.org>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

 

I have a local LAN (10.35.50.0/24) which is connected to my linux
firewall/gateway running iptables for internet access using an internet
link. My LAN is connected to other subnets using a leased line. 

 

I had to add a few routes in my linux gateway (running iptables) to enable
my LAN clients to access servers in other subnets and networks which are in
the range of 10.0.0.0/8 and 97.0.0.0/8. 

            

Everything seems to be working fine. But recently I found that one of my LAN
clients is running an Analog proxy. Few users sitting in other networks are
using this proxy and able to access internet. 

 

My firewall is configured to allow traffic to internet from LAN only
(10.35.50.0/24). As the proxy is inside this network, firewall allows the
traffic.

 

How do I stop this? I don't want users in other network to access internet
through my iptables. Please help me. Thanks in advance. 

 

Regards,

Manikandan

 

 

