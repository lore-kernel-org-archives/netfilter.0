From: Rolf Offermanns <rolf.offermanns@gmx.net>
Subject: NAT with latest netfilter ipsec patches
Date: Sat, 19 Nov 2005 01:58:18 +0100
Message-ID: <200511190158.18926.rolf.offermanns@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi All!
I have tried to finally get NAT over IPSec working with Patricks last patches 
applied to 2.6.14.2 (+ UFO scatter-gather patch from git > 2.6.14).

Is this supposed to work?

I get as far as this:

172.20.0.0/14 <--> w.x.y.z <-~~~-> a.b.c.d <--> 192.168.0.1/ <--> 192.168.0.2
 REMOTE NET        VPN-GW   I-NET   DSL-        ROADWARRIOR          HOST B
                                   ROUTER     (V-IP:172.24.0.17)     

Host B has the following routing table entry:
route add -net 172.20.0.0 netmask 255.252.0.0 gw 192.168.0.1

ROADWARRIOR runs the kernel described above with strongswan-2.5.2 and the 
following iptables entry:

iptables -I POSTROUTING -t nat -d 172.20.0.0/14 -j SNAT \
	--to-source 172.24.0.17

If I run a ping 172.22.1.1 from HOST B,
tcpdump on the roadwarrior shows the following:

01:46:30.813959 IP 192.168.0.2 > 172.22.1.1: icmp 64: echo request seq 53
01:46:30.816474 IP 192.168.0.1.4500 > w.x.y.z.4500: UDP, length: 116
01:46:30.833995 IP w.x.y.z.4500 > 192.168.0.1.4500: UDP, length: 116
01:46:30.833995 IP 172.22.1.1 > 172.24.0.17: icmp 64: echo reply seq 53


But the reply packet never reaches HOST B.

Am I missing something?

Thanks,
Rolf

