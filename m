From: Jason Opperisano <opie@817west.com>
Subject: Re: Max Concurrent Session
Date: Fri, 10 Dec 2004 16:45:25 -0500
Message-ID: <1102715125.3135.102.camel@hubcap.ljm.dom>
References: <1102705899.4516.50.camel@JOKER.INFOWORLD.CL>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102705899.4516.50.camel@JOKER.INFOWORLD.CL>
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

On Fri, 2004-12-10 at 14:11, Miguel Angel Amador L wrote:
> Hi All
>  I need implement a firewall that support 2000 concurrent sessions, it
> is posible with Iptables/Netfiler ?? 
>  What need to do?

depending on your architecture and netfilter kernel options--each
conntrack entry will take up somewhere around 300 bytes.  on my specific
machine here--it's 332 bytes per conntrack.  another machine i have
(with more POM patches applied), that value is 360 bytes.  let's be safe
and assume each conntrack entry takes 400 bytes.

400 * 2000 = 800000 bytes = 781 kilobytes

so you would need 781 kb of non-pageable kernel memory available for
iptables connection tracking.

normally, ip_conntrack_max is set to:

$TOTAL_RAM_IN_BYTES / 16384 = ip_conntrack_max

the minimum value this auto-calculation will use 128 and the max is
65536.

so to support 2000 tracked connections--you would need at least:

2000 * 16384 = 32 MB

the point of all this is that the breaking point in your case is not the
number of simultaneous connections--how much bandwidth are those 2000
connections going to be pushing through this firewall?  1.544 Mbps?  100
Mbps?  1 Gbps?

-j

PS -- all these calculations are for i386 architecture only.

--
"I have thought this through. First, I will send Bart the money to
 fly home. Then I will murder him."
	--The Simpsons



