From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: dhcrelay-*-*-*-*-*-*-*-
Date: Sun, 30 Nov 2003 13:06:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311301306.28203.Alistair@nerdnet.ca>
References: <1070150706.3fc93432d9526@paris-hme1> <200311292304.40538.JALaramie@Loudoun-Fairfax.com> <20031130062848.GA11438@cannon.eng.us.uu.net>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031130062848.GA11438@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On November 30, 2003 01:28 am, Ramin Dousti wrote:
> On Sat, Nov 29, 2003 at 11:04:40PM -0500, Jeffrey Laramie wrote:
> > Hmm, bootstrap=dhcp=tcp/udp 67:68 ? I thought dhcp ran on a lower
> > protocol level than tcp/ip, but if this is true then this should work.
>
> dhcp uses udp 67/68 (server/client). What is low level protocol is the
> implementation of the server which bypasses the regular udp sockets and
> takes the broadcasts off the wire itself. That's why the rules below
> might be irrelevant.
>
> Ramin
>

	Agreed Ramin, but it seems to me that the idea of a 
	relay or dhcp proxy server, you would only need to let the
	initial request in through iptables, the server would be 
	working below iptables to handle the rest of it.
	
	I know that when they capped all protocols and allowed only 
	required (tcp/udp on specific ports) in our corporate network 
	core that it b0rked XDMCP requests, but didn't affect bootp for 
	the *nix dumb terminals in our ops area.......


> > > 	iptables -A INPUT -p tcp  -s ${client ip range} -d 255.255.255.255 -m
> > > multiport --dport 67:68 -j ACCEPT
> > >
> > > 	iptables -A INPUT -p udp  -s ${client ip range} -d 255.255.255.255 -m
> > > multiport --dport 67:68 -j ACCEPT
> > >
> > >         and appropriate equivalient rules on the OUTPUT chain should
> > > make this work shouldn't it?
> >
> > Sounds like a winner to me! synkx: Does it work?
> >
> > Jeff

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

