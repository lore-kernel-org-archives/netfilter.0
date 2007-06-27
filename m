From: Jordan Russell <jr-list-2007@quo.to>
Subject: Re: ICMP packets associated with NAT connections sent out   wrong
 interface?
Date: Wed, 27 Jun 2007 13:16:00 -0500
Message-ID: <f5u9h1$o3p$1@sea.gmane.org>
References: <f513uq$kvi$1@sea.gmane.org> <46819191.10808@rtij.nl>
	<1182944650.6183.17.camel@ray-linux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1182944650.6183.17.camel@ray-linux.internal>
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

Ray Leach wrote:
> The port unreachable ICMP replay is coming from your machine in response
> to a packet coming in eth1 trying to get to 192.168.0.x ...

I don't think that's correct. Take a look at the square-bracketed part
of the log entry, which is (as I understand it) the packet that caused
the ICMP response to be generated. 192.168.0.4 was trying to send a TCP
packet *out*. The kernel then (for reasons unclear) tried to send an
ICMP message back to 192.168.0.4, but sent it out the wrong interface,
eth1, thus tripping my rule.

-- 
Jordan Russell


