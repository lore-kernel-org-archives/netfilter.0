From: "per jarevez" <perj8@hotmail.com>
Subject: Problem: NAT table POSTROUTING chain not capturing some packets...
Date: Sat, 14 Jun 2003 06:24:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Sea1-F160USzbAUfKRf000367f2@hotmail.com>
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

I'm using two internet gateways by routing policy:
ip rule from box2 table gateway2.
gateway2 table has default via gateway2.
main table has default via gateway1.
ip route flush cache of course.

Somehow some reply packets from box2 for a host on gateway1 has managed to 
go out gateway2 with the source address of interface on gateway1.

I'm having trouble identifying these packets on nat table POSTROUTING chain. 
  None of those packets have src address of box2 or src address of the 
interface on gateway1.  However in the mangle table POSTROUTING chain, I see 
that these packets have src address of box2.

Somehow the kernel has internally masqueraded the packets after mangle table 
POSTROUTING chain and forced these packets to skip the nat table POSTROUTING 
chain.  How do I keep these packets from going out the wrong gateway?

I'm using kernel-2.4.21-rc6 and Netfilter CVS June 3, 2003 (iptables-1.2.8) 
and iproute-2.4.7-5

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online  
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


