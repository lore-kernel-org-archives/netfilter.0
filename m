From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall + tcpdump
Date: Tue, 30 Mar 2004 16:50:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403301650.31936.Antony@Soft-Solutions.co.uk>
References: <40698161.1020502@n-dsi.com> <200403301537.54461.Antony@Soft-Solutions.co.uk> <40698F5B.8060204@n-dsi.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40698F5B.8060204@n-dsi.com>
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

On Tuesday 30 March 2004 4:16 pm, Peggy Kam wrote:

> > Not sure quite what you by "in front or behind", however I can tell you
> > that tcpdump works "closer to the wire" than netfilter, so it will see
> > all traffic hitting the interface, whether netfilter allows it or not.
>
> As you have said that all traffic hitting the interface is seen whether
> netfilter allows it or not, my question was how do I know whether the
> packets being sent get blocked?

1. If it's a routing firewall, see if the packets come out the other side 
(tcpdump on both interfaces).

2. If it's not a routing firewall, see if any response packets come back again 
(for TCP).

3. Put a LOG rule in your ruleset just before DROPping the packets, so you 
know what got DROPped.

4. If you're really interested in this sort of thing, you might want to 
investigate http://www.snort.org

Regards,

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


