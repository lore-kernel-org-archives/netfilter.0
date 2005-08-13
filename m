From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Transparent proxy where source IP address remains unchanged --
	possible?
Date: Sat, 13 Aug 2005 09:12:24 -0400
Message-ID: <20050813131224.GD25192@bostoncoop.net>
References: <20050809012914.GA23108@bostoncoop.net>
	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>
	<20050811130700.GA15463@bostoncoop.net>
	<Pine.LNX.4.61.0508112117380.23117@yvahk01.tjqt.qr>
	<42FBB957.30003@rosi-kessel.org>
	<42FC2D70.7000701@riverviewtech.net>
	<42FC9F1B.4060204@rosi-kessel.org>
	<42FD95F9.4070504@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42FD95F9.4070504@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

On Sat, Aug 13, 2005 at 01:40:57AM -0500, Grant Taylor wrote:
> Hmm, this complicates things.  I will have to think on how to accomplish 
> this on different subnets.  I would look in to the possibility of 
> tunneling.  I think you would need to establish an IP-in-IP or GRE tunnel 
> between the fake target and the real target so that you could pass traffic 
> back and forth with out worrying about some intermediary router deciding 
> that there is a better route for the traffic to take back to the original 
> source system thus breaking the unDNATing that would be done by the fake 
> target.

Interesting. Are there any pre-packaged ways to do this? This sounds like
perhaps the least complex solution, once it's actually implemented.

> >But is there some way I could tag packets coming in from faketarget, so
> >that realtarget knows that all traffic returning back with that tag goes
> >through faketarget?
> Possibly.  Is the traffic in question traffic that is destined to a 
> particular service or set of services or is the traffic just random port 
> traffic directed at the faketarget?  If it is the former you could do the 
> old ""Up and Over (and down) trick.  I mean you could DNAT the fraffic that 
> was originaly destined to 22 to a different port on the realtarget thus 
> allowing the realtarget to be inteligent in how it handled the traffic.  
> Namely realtarget would have to DNAT the traffic back down to it's original 
> port (known by the fact that we are only DNATing traffic that was destined 
> to the particular port in the first place) and MARK the connections.  This 
> MARK value could then be used by an ip route rule on the real target to 
> decide which routing table to use.

That could work. I'm really only worried about DNS, HTTP, HTTPS, SMTP,
POP3, IMAP, and SSH. So I could redirect all those ports to different
ports on on faketarget (DNAT), then back to the real ports on realtarget
(using REDIRECT target?).

Can you give me an example (or point me to a URL) of what rules I would
need to run on realtarget to MARK the connections and then decide which
routing table to use?  Are we just talking about iptables commands, or is
there something additional that is required?
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

