From: Jason Opperisano <opie@817west.com>
Subject: Re: [Fwd: Re: Can't interpret this log entry]
Date: Fri, 24 Sep 2004 17:42:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096062132.16814.4.camel@wolfpack.ljm.dom>
References: <4154900E.5000607@mail.co.gilchrist.fl.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4154900E.5000607@mail.co.gilchrist.fl.us>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-24 at 17:22, Eric Ellis wrote:
> See, the problem is that ICMP doesn't talk on the box *any* direction. 
> It all gets dropped.  I'm not seeing how my Firewall or anything on the 
> private side is sending an ICMP request.  A dump of my IPTable rules is 
> attached.

it's sending a TCP packet.  the ICMP packet is a reply to the TCP
packet.

-j

-- 
Jason Opperisano <opie@817west.com>


