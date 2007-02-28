From: Stephane Couture <muscou@sympatico.ca>
Subject: arp question
Date: Wed, 28 Feb 2007 01:40:49 -0500
Message-ID: <45E523F1.4020809@sympatico.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Not sure if this is the right forum but any help would be appreciated. 

My NIC support up to 16 unicast MAC address which can be assigned to 
different H/W queue.  The cpu is only connected to one ethernet network 
and all packet destined to a specific subnet are routed over PCI (not as 
is, multiple packets manipulations are done beforehand).  I am trying to 
make use of this feature to, hopefully, enable faster routing.

 I would like to assign a different MAC for a specific subnet and 
respond to arp request for that subnet.
- Current proxy-arp implementation is not what I want.  Proxy-arp with 
subneting seem to be what I need but it does not seem to be supported 
anymore (as of 2.2?). 
- Adding arp entry with the publish flags disregard the provided address 
and use the one from the network interface.
- constant gratuitous ARP on the entire subnet could work but I am not 
sure about the reliability of this method.

I'll modify the kernel (2.6.20) if I have to but there has to be a 
simpler way. 

Thanks.

