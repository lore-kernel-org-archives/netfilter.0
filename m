From: Abraham van der Merwe <abz@frogfoot.net>
Subject: Re: clearing dont-fragment bit
Date: Thu, 9 Oct 2003 16:52:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009145248.GA26549@oasis.frogfoot.net>
References: <20031009134311.GA25685@oasis.frogfoot.net> <Pine.LNX.4.51.0310091554380.26697@dns.toxicfilms.tv> <20031009140819.GA25984@oasis.frogfoot.net> <20031009144334.GB14078@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031009144334.GB14078@cannon.eng.us.uu.net>
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
Content-Transfer-Encoding: 7bit
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Netfilter Discussions <netfilter@lists.netfilter.org>

Hi Ramin                                         >@2003.10.09_16:43:34_+0200

> > > > Are there any iptables extensions out there that allow you to clear the DF
> > > > (Dont Fragment) bit in ip headers?
> > > AFAIK no. Why would you want to do that?
> > > I think I might write a module that would do that.
> > 
> > I need it for tunnels. In a perfect world that wouldn't be necessary at all,
> > but reality is that there's many brain dead admins that filter icmp, so if
> > you build a tunnel over the big bad internet, you're screwed.
> > 
> > You can use the TCPMSS target which solves it for tcp, but you still have
> > the same problem with udp packets, so imho the only way to solve this
> > properly is to fragment packets even if DF=1.
> 
> The applications that set the DF bit, do so for a reason not just for the
> fun. Sometimes (well, actually most of the time) it's for the performance
> reasons in which case turning it off and having a poor performance is
> preferable than it not working at all. On the other hand, the DF bit would be
> set by the application probes to figure the PMTU. Setting that off on the
> firewall would harm the purpose.

Ideally one would want to leave DF untouched unless a packet with DF=1 is
resent in which case you clear it - that way you solve PMTU probes, but I
suspect this would be overly complicated / resource intensive.

Even better would be if there was a tunnelling protocol that would just take
packets on side A (incl ip headers, galore), chop it up, and reassemble it
on the other side. Unfortunately there is no such thing :P

> Can you come up with a list of the non-TCP-based application protocols that
> would use the PMTU (DF bit)?

Basically any UDP application that sends packets bigger than the maximum
allowed mtu. I would assume TFTP, SNMP, etc. would all get into trouble. I
know that some protocols such as DNS try to stay below 512 bytes payload,
but there is probably a gazillion protocols out there that don't.

-- 

Regards
 Abraham

The meek shall inherit the earth; the rest of us will go to the stars.

___________________________________________________
 Abraham vd Merwe - Frogfoot Networks CC
 9 Kinnaird Court, 33 Main Street, Newlands, 7700
 Phone: +27 21 686 1665 Cell: +27 82 565 4451
 Http: http://www.frogfoot.net/ Email: abz@frogfoot.net


