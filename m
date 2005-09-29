From: "Rodre Ghorashi-Zadeh" <rodrico7@hotmail.com>
Subject: Redirect Packets From Interface in Promiscuous Mode
Date: Thu, 29 Sep 2005 18:28:43 +0000
Message-ID: <BAY103-F251017FCAC7E12DA438E6C968C0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello List,

I have a problem that I am hoping someone can help me with. I am currently 
conducting some load testing on a test MySQL server that is destined to 
replace our current production MySQL server. What I want to do is send our 
current MySQL traffic, in real time, to the test MySQL server to measure the 
load in comparison with our current production MySQL server.

What I have done so far is setup port mirroring on the switch that is shared 
by the Production MySQL server, the test MySQL server, and my Linux based 
management station, with the Linux based managment station sniffing the 
mirrored port of the Production MySQL server.

I am able to see the MySQL traffic going to the production MySQL server 
using tcpdump. For a next step what I want to be able to do is have iptables 
sniff the port (I set the interface into promiscuous mode using ifconfig), 
grab all packets that are destined for my Production MySQL server from the 
mirrored port, rewrite the source IP address to be my Linux based management 
stations IP address and rewrite the destination address to be my Test MySQL 
Servers IP address. I don't really care about the MySQL results returned to 
tthe Linux based management station, they can go to /dev/null for all I 
care, but I want to see the queries going through the Test MySQL server.

I am pretty familiar with iptables but the two problems that I see/foresee 
are: getting iptables to grap traffic from the interface in promiscuous mode 
that are not destined for the Linux based Management station, and, properly 
setting up the TCP/IP sessions, between the Test MySQL Server and the Linux 
Based Management Station.

If what I am doing is not possible can anyone give me some advice on how to 
achieve what I am trying to do (send queries in realt time from my 
Production MySQL server to my Test MySQL Server)?

~Rodre



