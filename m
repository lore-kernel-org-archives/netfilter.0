From: Unknown <unknown@unknown.invalid>
Subject: Re: iptables routing help
Date: Sun, 25 Jan 2004 12:09:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41090.7504767694$1075050745@news.gmane.org>
References: <A9EB4907-4EF7-11D8-A7CD-000A9577164C@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <A9EB4907-4EF7-11D8-A7CD-000A9577164C@hotmail.com>
Content-Disposition: inline
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
To: William Knop <w_knop@hotmail.com>, netfilter@lists.netfilter.org

On January 25, 2004 12:31 am, William Knop wrote:
> Say I want to transfer a file from one computer to another in my house.
> Since they are on different subnets, the data is routed out my modem to
> the gateway at my isp, and then back in my modem and to the other
> computer in my house. Ideally (in any reasonable setup), the data
> should not leave the house and flood my dsl modem with local traffic.
>
> So, I want to grab packets destined for the gateway (via a
> firewall/iptables), check if the packet is destined for one of the
> three local subnets, and make the packet go directly to it's
> destination. I'm not sure if this has to do with ethernet frames,
> tcp/ip, or arp or something like that, but I've tried lots of things
> with minimal success.
>
> > im not shure if i can understand the schema, could be more specific?
> >
> > thanks
> >
> >

	Okay ...you have a LAN inside the DSL modem that has 
	externally routable IPs on different subnets, and you want
	to setup an internal routing table that knows all of these 
	hosts.

	One question ... what is the physical setup involved?

	i.e. are all the boxes involved connected directly to the DSL modem?
	is the Linux/Iptables box the only box connected to the DSL modem, and
	the downstream boxes are connected to a switch/hub off a secondary 
	interface off the firewall box?

	-- I suspect from your description we are looking at  DSLmodem/router to 
	separate boxes ...


	Alistair

