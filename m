From: Jim Redman <jim@ergotech.com>
Subject: Re: UDP Redirects
Date: Tue, 16 Sep 2003 08:52:05 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916145205.GU1272@charizard.ergotech-usa.com>
References: <20030916000714.GC3213@charizard> <20030916010550.GC1272@charizard.ergotech-usa.com> <20030916142432.GD16559@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030916142432.GD16559@cannon.eng.us.uu.net>; from ramin@cannon.eng.us.uu.net on Tue, Sep 16, 2003 at 08:24:32 -0600
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

Ramin,

On 2003.09.16 08:24, Ramin Dousti wrote:
> Do the packets belong to one UDP session? If not, this number of
> packets
> might overflow your connection-tracking table.

The packets are all individual entities.  Any solution if this is the 
problem?  Any way to test?  (There are no indications in the syslog 
that I've noticed).

Jim

> 
> Ramin
> 
> On Mon, Sep 15, 2003 at 07:05:50PM -0600, Jim Redman wrote:
> 
> > [apologies if this is a duplicate - the list manager has ack'd my
> > request but still bounced the first copy]
> >
> > I have a system that is sending UDP packets to port 995 at about 100
> 
> > packets/second.  I want to redirect these to 1995 so that I can
> listen
> > on an unpriveledged port.  So I:
> >
> > iptables -t nat -A PREROUTING -p udp --dport 995 \
> >     -j REDIRECT --to-port 1995
> >
> > This seems to work some of the time, but most of the time not.  It
> > seems to work better when the connection is across a VPN which
> limits
> > that packets to about 5-10/second.  So I assume that I've hit some
> > limit, however this (and a number of variants) don't seem to help:
> >
> > iptables -t nat -I PREROUTING -m limit --limit 1000/s \
> >     --limit-burst 1000 -j ACCEPT
> >
> > Am I missing something obvious?  Any suggestions?
> >
> > Thanks,
> >
> > Jim
> >
> > --
> >
> > Jim Redman
> > (505) 662 5156 x85
> > http://www.ergotech.com
> 

-- 

Jim Redman
(505) 662 5156 x85
http://www.ergotech.com

