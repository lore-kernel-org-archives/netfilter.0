From: Scott Hall <halls@aros.net>
Subject: icmp: 10.1.4.50 unreachable - need to frag (mtu 500) [tos 0xc0]
Date: Tue, 06 Jan 2004 00:07:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FFA5EBD.1000701@aros.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am fairly new to iptables and have recently been forced to launch a 
system that wasn't fully tested.  Now my users are having troubles 
getting to a couple of websites.  Everything seems to work fine, so far, 
other then a couple of web sites.   We have 9 phones and 8 computers all 
sharing this pipe without any other complaints so far.

I am using this setup to share a single T1 pipe for both voice (via IP 
telephone) and data.  That is the reason for the 500 MTU across the t1 
link.  The smaller MTU helps with the priority queueing on the voice 
traffic. 

Here is my setup.  

-- Customer network (10.1.4.0)--
                   |
                   |
      |   multihomed - 10.1.4.1/24  -- xxx.xxx.xx7.13/29        |
  -- |Customer side router| -- Fedora core 
1kernel-2.4.22-1.2115.nptl/iptables 1.2.8
      |   10.255.0.14/29    |
                   |
                   |
          (T1/ 500 MTU)
                   |
                   |
     |   10.255.0.13/29  |
<--| My side router -->|  -- Redhat 9 kernel-2.4.20-8smp/iptables 1.2.7a
     |   SNATed xxx.xxx.xx6.21/26   |


The problem happens when users on the customer side public or private 
(PUBLIC_IP or 10.1.4.0) network try to connect to a couple of different 
websites.  Here is the info from the tcpdump on the 'My side router' 
public interface.

 >>>>> Not sure why I don't see the original request <<<<<<<<
 >>>> Request for http connection from customer private network to 
Fasttrack2.machinerytrader.com <<<<<<<

16:48:57.275929 Fasttrack2.machinerytrader.com.http > 
--PUBLIC_IP--.1308: P 1481515766:1481517126(1360) ack 2518922124 win 
65161 (DF)
16:48:57.275953 --PUBLIC_IP-- > Fasttrack2.machinerytrader.com: icmp: 
10.1.4.50 unreachable - need to frag (MTU 500) [tos 0xc0]
16:48:57.276111 --PUBLIC_IP--.32769 > ns1.mydomain.com.domain:  25222+ 
PTR? 17.164.70.63.in-addr.arpa. (43)  (DF)

 >>>>>> still don't see the original request go out. Not sure why <<<<<<<
 >>>>>> Request for connection from customer public network to 
Fasttrack2.machinerytrader.com


16:59:25.962167 Fasttrack2.machinerytrader.com.http > 
--cust-publicIP--.29695: P 308:1668(1360) ack 375 win 65161 (DF)
16:59:25.962189 --PUBLIC_IP-- > Fasttrack2.machinerytrader.com: icmp: 
--cust-publicIP-- unreachable - need to frag (MTU 500) [tos 0xc0]

 >>>> I see this traffic next but the customer side doesn't receive the 
packets <<<<<<

16:59:33.605043 --cust-publicIP--.29695 > 
Fasttrack2.machinerytrader.com.http: R 2681907386:2681907386(0) win 0 (DF)
16:59:38.142184 --cust-publicIP--.29714 > 
Fasttrack2.machinerytrader.com.http: S 2689170753:2689170753(0) win 
65280 <mss 1360,nop,nop,sackOK> (DF)
16:59:38.174050 Fasttrack2.machinerytrader.com.http > 
--cust-publicIP--.29714: S 3983995986:3983995986(0) ack 2689170754 win 
65535 <mss 1380,nop,nop,sackOK> (DF)
16:59:38.178358 --cust-publicIP--.29714 > 
Fasttrack2.machinerytrader.com.http: . ack 1 win 65280 (DF)
16:59:38.181116 --cust-publicIP--.29714 > 
Fasttrack2.machinerytrader.com.http: P 1:430(429) ack 1 win 65280 (DF)
16:59:38.216940 Fasttrack2.machinerytrader.com.http > 
--cust-publicIP--.29714: P 1:241(240) ack 430 win 65106 (DF)
16:59:38.220596 Fasttrack2.machinerytrader.com.http > 
--cust-publicIP--.29714: P 241:1601(1360) ack 430 win 65106 (DF)


I have done a fair amount of searching on this and come up with 
nothing.  Any help will be greatly appreciated.  I have read about 
several people with similar issues that tried changing the MTU to no 
avail.  Based on the QoS stress testing we did do before putting the 
server in production, we need to leave the MTU set to 500 for best service.

Thanks to anyone who can help

--Scott


