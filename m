From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Fwd: The witty worm
Date: Sat, 20 Mar 2004 17:29:49 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040321012949.87106.qmail@web61008.mail.yahoo.com>
References: <20040321011101.GA12491@zion.homelinux.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040321011101.GA12491@zion.homelinux.com>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: nf <netfilter@lists.netfilter.org>


--- Sven Schuster <schuster.sven@gmx.de> wrote:
> 
> Good morning,
> 
> On Sat, Mar 20, 2004 at 04:34:55PM -0800, SBlaze told us:
> > Got this in...thought I would forward it on to the nerfilter list in the
> > interest of security.
> > 
> > According to the link.. "Witty is a network worm that spreads through
> direct
> > network connections, targeting machines that are running BlackIce security
> > software."  
> > 
> > It exploits ICQ apparently... "Witty uses a vulnerability in ICQ instant
> > messaging protocol parsing routines of the ISS Protocol Analysis Module
> (PAM)."
> 
> Just for clarification, it does not exploit ICQ but the ICQ protocol 
> parsing routines of the blackice firewall (seems to be one of those 
> personal firewalls I think).
> 
Alert those web sites to this..as you can see I quoted them.
> > 
> > It might be a good idea to start LOG lines for a source of port 4000 for
> > unusual traffic(for iptable secured gateways). This would be effective in
> Even
> > beter; block or limit these for awhile?
> 
> Well I think on a gateway/firewall you wouldn't have blackice running.
> And in any kind of seriously corporate environment, I think chat systems
> like ICQ should always be filtered and therefore stopped at the
> (netfilter :) firewall. Of course you need to secure your internal LAN,
> too, but have a personal firewall on each & every desktop??
> 
No but internal LAN machines do transmit through the gateway...therefore if you
have machines already infected...you could quarentene it to your internal
LAN..till you get that cleaned up. Places like public libraries, EDUs, and
other various forms of public networks will have Personal Firewalls and almost
definatly various forms of IM software(ie ICQ) and as such could reak havoc.
Just saying this warning is not practical... is just well not practical.

However next time I think I will keep info to myself and trust people to
protect their own networks.



=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
http://taxes.yahoo.com/filing.html

