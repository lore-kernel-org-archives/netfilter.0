From: "J.P. Fischer" <pfischer@atmit.com>
Subject: iptables port80 forward and snat
Date: Fri, 13 Jan 2006 14:12:18 -0500
Message-ID: <005701c61875$46484720$6c00a8c0@ATMIT>
Reply-To: pfischer@atmit.com
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

I have a RH ES4 box with 3 eth.ports and safesquid installed.
Safesquid listens on port 8080.
Eth0 = 1.1.1.1  (Internet connection)
Eth1 =  2.2.2.2 
Eth2 = 192.168.1.1 (needs to be sNATted)

How do I setup iptables to:

1- Snat traffic coming in on eth2
2- port forward http traffic coming in on eth1 to port 8080 (so it will hit
the safesquid running on the box)

Thanks for any help.
Peter.



