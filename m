From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Purpose of self-referential rule
Date: Wed, 26 Feb 2003 10:33:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302261033.25724.Alistair@nerdnet.ca>
References: <20030224160628.GH4316@placemark.com>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030224160628.GH4316@placemark.com>
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
To: Kelly Setzer <Kelly.Setzer@placemark.com>, netfilter@lists.netfilter.org


	Hi:

	This rule would only really be invoked when in a packet left a system on the
internal network headed for the firewall box itself (presumably the firewall 
has a valid network address on that segment.) -- however that rule is rather 
loose, since it supposes that it is accepting a destination of the entire 
segment, rather than for a specific IP on the firewall.  This might be valid 
if you had wireless lan tunnelling equipment that used the firewall as a 
router, and the rule was in the forward chain.   There was a discussion 
recently about controlling access to MS shares in a public wireless lan, but 
the solution was not in iptables, but in the wireless lan tunnelling 
software.
	
	What is the intent of the rule is perhaps the more appropriate question.
	This would be appropriate for certain envrionments, but not in most.



	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!	


On February 24, 2003 11:06 am, Kelly Setzer wrote:
> I've been experimenting with gShield trying to learn the ins and outs
> of iptables.  One of the rules is generates is:
>
> iptables -A INPUT -s 192.168.6.0/24 -d 192.168.6.0/24 -i eth1 -j ACCEPT
>
> The source and dest are correct for my internal network, and eth1 is
> the internal net.  My question is, when would the firewall ever see a
> packet that could possible match this?  Any packet with a source and
> destination on the same network would send the packet directly (no
> routing, thus no firewall).
>
> What am I missing?
>
> thanks,
> Kelly
> --
> Kelly Setzer, System Administrator/Architect - Placemark Investments
> 14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
> kelly.setzer@placemark.com  http://www.placemark.com
> (972)404-8100x41 (work)       (214) 287-3464 (cell)

-- 

