From: "Mike Olivere" <mikeeo@msn.com>
Subject: netfilter under heavy load.
Date: Sun, 5 Jan 2003 10:40:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007101c2b4d0$be992520$0100a8c0@win98>
Reply-To: "Mike Olivere" <mikeeo@msn.com>
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

Hello, I don't know if this has been brought up before but I am going to be
running netfilter under load on a fractional T-3 (12Mbps). The box will have
3 interfaces eth0 going to the Cisco 7200, eth1 (routable IPs) going to the
webfarm for DMZ zone, and then eth2 will be NATed with a private LAN IP
(192.168.1.x). I will be NATing over 200 clients and I know in the past this
could be a problem with IPCHAINS because it would either run out of memory
or start dropping connections. The webservers get about 7,000 hits a day and
they won't be NATed but will be filtered with a mix of statefule and packet
filtering rules. We have a Cisco PIX 525(which is just a Intel P600/512MB
RAM) in place right now but I would like to move to Netfilter as it will be
running on a dual P1ghz and a gig of memory. Is this possible? can Nefilter
scale to this and beyond? and is there any tweaks I should know about?

Thanks in advance.

Mike


