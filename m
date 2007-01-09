From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Natted packets
Date: Mon, 08 Jan 2007 21:06:42 -0600
Message-ID: <45A306C2.7000809@riverviewtech.net>
References: <45A2BB09.90405@eternet.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45A2BB09.90405@eternet.cc>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 01/08/07 15:43, Lucas Diaz wrote:
> Is it possible to know if a packet passing through my router is (s)natted?
> And the original (s)natted IP?
> Thank a lot.

Are you wanting to know if you are doing the NATing, or if some other 
router somewhere else on the net has NATed the traffic?

If you want to know if you have NATed the packet, I believe the answer 
is yes 
(https://lists.netfilter.org/pipermail/netfilter/2007-January/067687.html).

If you want to know if someone else has NATed the packet, possibly, 
however it is MUCH harder to do if you are not the outbound ISP.

Which question are you asking?



Grant. . . .

