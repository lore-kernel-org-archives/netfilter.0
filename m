From: Ryan Hagelstrom <rhagelstrom@atcorp.com>
Subject: Getting output Mac Address
Date: Thu, 29 Jul 2004 16:47:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01C4758B.C7B30A40.rhagelstrom@atcorp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I'm in the process of writing a netfilter kernel module. I would like to be 
able to see the entire packet including the mac addresses of the source and 
destination in my module.
For incoming packets I can get the incoming mac source and destination 
addresses from (*skb)->mac.ethernet->h_source (*skb)->mac.ethernet->h_dest. 
When I filter on outgoing packets using NF_IP_POST_ROUTING and 
NF_IP_LOCAL_OUT the hardware address fields are not filed in. I dug up a 
post that said those fields are filled in after the packet passes though 
all netfilter hooks, is this correct? If so I'm looking for an alternative 
method so that I can get the source and destination hardware addresses for 
outgoing packets in my netfilter module. Anyone have any suggestions on 
approaches to take?

Thanks

Ryan Hagelstrom

