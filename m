From: Jordan Russell <jr-list-2007@quo.to>
Subject: Re: ICMP packets associated with NAT connections sent   out wrong
 interface?
Date: Thu, 28 Jun 2007 11:26:40 -0500
Message-ID: <f60nfv$gje$1@sea.gmane.org>
References: <f513uq$kvi$1@sea.gmane.org>
	<46819191.10808@rtij.nl>	<1182944650.6183.17.camel@ray-linux.internal>
	<46835BA5.3080705@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46835BA5.3080705@rtij.nl>
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

Martijn Lievaart wrote:
> The source of the packet is 123.23.23.23, it comes from the Internet. 
> The destination is local. Why do you think this packet is generated locally?

123.23.23.23 is the address of the machine's eth1 (Internet) interface.

Since this only happens when I boot into certain kernel versions (2.6.20
and 2.6.21), it seems unlikely that someone on the Internet is sending
me ICMP packets with a spoofed source address.

-- 
Jordan Russell


