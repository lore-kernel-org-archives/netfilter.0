From: "Kevin Hilscher" <KHilscher@Hatsize.com>
Subject: Duplicate IP scenario. Doable with iptables?
Date: Tue, 23 Nov 2004 12:28:03 -0700
Message-ID: <s1a32cf6.059@mail2.hatsize.com>
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

I have a somewhat odd scenario that requires the same pools of 192.168
IPs to be bound to eth1 and eth2 on the same machine. I need to NAT
another pool of 10.x.x.x IPs bound to eth0 to these two pools of 192.168
IPs. The setup is as follows:
 
eth0:10.115.0.1/16 -> eth1:192.168.0.1/24
eth0:10.115.0.2/16 -> eth1:192.168.0.2/24
eth0:10.115.0.3/16 -> eth1:192.168.0.3/24
eth0:10.115.0.4/16 -> eth1:192.168.0.4/24
eth0:10.115.0.5/16 -> eth1:192.168.0.5/24
eth0:10.115.0.6/16 -> eth1:192.168.0.6/24
   
eth0:10.116.0.1/16 -> eth2:192.168.0.1/24
eth0:10.116.0.2/16 -> eth2:192.168.0.2/24
eth0:10.116.0.3/16 -> eth2:192.168.0.3/24
eth0:10.116.0.4/16 -> eth2:192.168.0.4/24
eth0:10.116.0.5/16 -> eth2:192.168.0.5/24
eth0:10.116.0.6/16 -> eth2:192.168.0.6/24
 
Suse 8.1 has no problem letting me bind the same IPs to eth1 and eth2,
since eth1 and eth2 are not on the same physical network. However, I am
having problems writing my NAT rules for this scenario.
 
Is this scenario doable under iptables?
 
TIA,
 
Kevin
 
 
