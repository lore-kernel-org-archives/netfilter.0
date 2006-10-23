From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: mac match and FORWARD chain
Date: Mon, 23 Oct 2006 12:24:35 -0400
Message-ID: <20061023162435.GA2441@animx.eu.org>
References: <361567501.01771@mail.nankai.edu.cn>
	<453C1F0B.4010707@mail.nankai.edu.cn>
	<361601544.29487@mail.nankai.edu.cn>
	<453CA7DB.5000509@mail.nankai.edu.cn>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <453CA7DB.5000509@mail.nankai.edu.cn>
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
> Wakko Warner :
> > Bo Yang wrote:
> >> MAC address is some concept in the link layer , so how do
> >> you get the packet sender mac if the packet is routed to your
> >> box through some other routers ?
> >
> > I understand.  However, the machine I was using for this was directly
> > connected to both system.  There were no other routers.
> >
> > Take this for instance:
> >
> > Box A -> (eth1)firewall/router(eth0) -> Box B
> >
> > firewall/router does not trust eth1 and uses MAC addresses to allow access,
> > so it does this:
> > -I FORWARD -j ACCEPT -i eth1 -m mac --mac BOXAMAC
> > -I FORWARD -j DROP -i eth1
> >
> > firewall/router knows the mac of both box a and b (obviously, box a doesn't
> > know box b's mac and vice versa).  Consider the above the only rules in the
> > firewall and box A and B have no rules at all.
> >
> > Box A pings Box B and fails.  The reason is the mac test above is
> seeing the
> > MAC of eth0, not of Box A.
> >
> > This is what I'm referring to and I had to add a MARK rule in PREROUTING to
> > mark packets that I want to allow and then allow in the forward chain based
> > upon the mark.
> >
> I think when  the packet is in the FORWARD chain , the routing must
> have been affect the packet , so that
> is the reason why you see the eth0 mac in the rule .

Yes, and the reason I wanted to request that it not be allowed to match in
the FORWARD chain (or have a note in the man page about this)

> You can just add a rule in the PREROUTING chain in the mangle table ,
> and DROP the packat you don't
> want there . Why you must mark it first , and then drop it in another
> chain ?

Actually, I was tinkering and using MARK was the first thing that came to
mind.  After thinking about it, I think the best place would be in
nat/PREROUTING (since nat is already loaded on the firewall machine).  I do
not need mangle at all if I'm not marking.  At the time, I didn't think the
filtering place should be in the mangle or nat tables, afterall, that is
what the filter table is for =)

In the nat/PREROUTING chain, are all incoming packets passed through this or
just the initial packets?  In my current setup, I have br0 (eth0 and some
vpns) that are routed through ppp0 to get to the internet.  eth1 is
connected to a wireless ap and I do not want ANY access from anything on
that network except ICMP, VPN, and the web/snmp port to the WAP (I need a GUI
browser to configure the thing and the firewall has no GUI installed which
is why I am using forwarding).  On eth1, I only allow specific MACs to
be able to connect at all.

I do appreciate the idea to block in the prerouting chain instead of marking
then blocking.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

