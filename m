From: Omar Armas <oarmas@mpsnet.net.mx>
Subject: map internal ip
Date: Fri, 19 Mar 2004 12:56:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079722569.1980.52.camel@kaos.mpsnet.net.mx>
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

I have the following config:

(public ip)
eth0
Firewall
eth1 (150.50.53.4)
|
|
|
148.145.133.1 (vpn router)
|
|
150.50.57.0/24 
(LAN, including a server with 150.50.57.2)

*Class 150.50.57.0/24 is routed to 148.245.164.1

I want that when people(from eth1 lan) goes to 150.50.53.5, be
redirected to 150.50.57.2.

I tried:

iptables -t nat -A PREROUTING 150.50.53.5 -j DNAT --to-destination
150.50.57.2


But doesn't seem to be working. Any idea if it is possible and how to do
it?


Omar


