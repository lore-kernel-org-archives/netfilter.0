From: Chris Schanzle <nospam@nist.gov>
Subject: How to drop arps when protocol addrs of sender = target
Date: Wed, 10 Sep 2003 13:04:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5F598A.3080609@nist.gov>
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
Cc: schanzle@nist.gov

I have a need to not respond to arps where the protocol address of the 
sender is the same as the target, which is the case when Windows clients 
try to ARP for the manually-configured address it is about to use.  If 
it gets a response, it disables the interface.  I currently respond 
because of a global arp entry ("arp ... -s ... netmask 0.0.0.0 pub"), 
which is required for my application.

I want to receive and respond to all other ARPs (e.g., for routers).

I cannot change the Windows clients.

It does not appear to me this can be done with iptables or arptables 
(comparisons between two fields in the packet).  Any suggestions before 
I start hacking on kernel code?

Thanks,

Chris Schanzle
[yes, the nospam *does* go to me.  :-]



