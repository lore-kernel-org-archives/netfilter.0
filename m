From: "Andrew Hakman" <hakmana@hotmail.com>
Subject: Netfilter UDP/H323
Date: Fri, 03 Oct 2003 18:15:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY2-F11zadTMVwVn2000006c02@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi

I'm having a weird problem with iptables. I've got it running on a debian 
(unstable) box with kernel 2.4.22 (from www.kernel.org, not a debian kernel 
source or image package), and regular NAT is working fine. I've tried 
multiple ways to get h323 working, including applying the ip_conntrack_h323 
and ip_nat_h323 patches and compiling them into the kernel, and modconf'ing 
them into the post-patch-recompiled kernel, and prior to that just by 
manually forwarding the tcp port (1720) and UDP ports (5000:5999) to the 
correct internal machine. The problem is that I never get any UDP traffic 
coming back from the remote machine. Running a packet sniffer on that 
machine, it shows that iptables seems to not be changing the source address 
of the UDP traffic to the public address of the debian router, but instead 
is leaving the source address as 192.168.2.1 (the private address of the 
debian box). As I mentioned above, regular nat on everything else seems to 
work fine.

The IP tables version is what you get when you follow the instructions to 
use Patch-O-Matic, and as mentioned, the kernel is 2.4.22. The private nic 
in the debian box is eth0 192.168.2.1/255.255.255.0 and the public one is 
eth1 66.222.177.x/255.255.248.0.

The IP tables command i'm using to start nat is:
iptables -t nat -A POSTROUTING -s 192.168.2.0/255.255.255.0 -o eth1 -j SNAT 
--to-source 66.222.177.x

and to forward tcp port 1720
iptables -t nat -A PREROUTING -p tcp --dport 1720 -j DNAT --to 192.168.2.2
and when I was trying to manually forward udp 5000:5999
iptables -t nat -A PREROUTING -p udp --dport 5000:5999 -j DNAT --to 
192.168.2.2

Anyone have any ideas/pointers?

Thanks
Andrew Hakman

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail


