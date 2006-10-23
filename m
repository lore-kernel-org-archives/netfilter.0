From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: mac match and FORWARD chain
Date: Mon, 23 Oct 2006 06:50:43 -0400
Message-ID: <20061023105043.GA1104@animx.eu.org>
References: <361567501.01771@mail.nankai.edu.cn>
	<453C1F0B.4010707@mail.nankai.edu.cn>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <453C1F0B.4010707@mail.nankai.edu.cn>
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
Content-Transfer-Encoding: 7bit
To: Bo Yang <struggle@mail.nankai.edu.cn>
Cc: netfilter@lists.netfilter.org

Bo Yang wrote:
> > I'd like to request that the mac match not be allowed in the FORWARD chain
> > as it does not function the way that some may think.
> >
> > The tests I've performed indicate that the match will match the MAC address
> > of the transmitting interface (not what one would expect if attempting to
> > allow based on the mac address of the sender and blocking all other
> packets)
> >
> > I'd like to hear comments about this.  If it is not fesable to do this, I'd
> > recommend adding text to the man page so that others do not fall into the
> > same problem I did.
> >
> > I have already worked around this problem in my setup.
> MAC address is some concept in the link layer , so how do
> you get the packet sender mac if the packet is routed to your
> box through some other routers ?

I understand.  However, the machine I was using for this was directly
connected to both system.  There were no other routers.

Take this for instance:

Box A -> (eth1)firewall/router(eth0) -> Box B

firewall/router does not trust eth1 and uses MAC addresses to allow access,
so it does this:
-I FORWARD -j ACCEPT -i eth1 -m mac --mac BOXAMAC
-I FORWARD -j DROP -i eth1

firewall/router knows the mac of both box a and b (obviously, box a doesn't
know box b's mac and vice versa).  Consider the above the only rules in the
firewall and box A and B have no rules at all.

Box A pings Box B and fails.  The reason is the mac test above is seeing the
MAC of eth0, not of Box A.

This is what I'm referring to and I had to add a MARK rule in PREROUTING to
mark packets that I want to allow and then allow in the forward chain based
upon the mark.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

