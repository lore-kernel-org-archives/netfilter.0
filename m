From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Leaking ICMP and UDP packets
Date: Mon, 19 Apr 2004 18:45:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404191845.21225.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0404190914120.2276-100000@dudester.spoontail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0404190914120.2276-100000@dudester.spoontail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Monday 19 April 2004 5:17 pm, Daniel David Benson wrote:

> I essentially have everything go out as a global nat, but every now and
> then a tcpdump on the frontside interface is showing some ICMP and UDP
> packets not getting natted.

"Some"?   I agree with Frank - let's see an example, please.

> Anyone ever seen this before?

No.   As far as I'm concerned, if you tell netfilter to NAT, then it NATs.

> It's not a major deal as we are are having our front edge router handle
> these ugly packets, but I'd like to tighten it up.

Are you sure they are un-NATted packets "leaking" through netfilter, and not 
ICMP packets being sent back to some remote system by the firewall itself, 
saying "host unreachable" etc?

Other information which may be useful to diagnose this problem:

1. What's your Internet bandwidth?
2. How many conntrack table entries do you typically have (wc -l 
/proc/net/ip_conntrack)?
3. Do you have any DNAT rules for incoming packets, as well as the SNAT rule 
you've already posted?
4. Are you doing anything in the mangle table?
5. Do you run any services on the firewall, or is it just a filtering router?

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


