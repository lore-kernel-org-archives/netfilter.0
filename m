From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Speed Issues through NAT Firewall
Date: Tue, 9 Jul 2002 14:49:42 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709184942.GA25368@cannon.eng.us.uu.net>
References: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com> <20020709194926.A17608@oknodo.bof.de> <005501c22772$1ef01240$6702a8c0@mindtrip.com> <200207091808.g69I8R810149@vulcan.rissington.net> <1026239145.804.56.camel@tux>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1026239145.804.56.camel@tux>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, Netfilter <netfilter@lists.samba.org>

On Tue, Jul 09, 2002 at 08:25:45PM +0200, Martin Josefsson wrote:

> > > The firewall on the DSL is an Athlon XP 1500+.  The firewall on the ISP
> > > line is a PII 333.  I will check on the full/half duplex issue.
> > 
> > That's a hell of a difference, and could conceivably account for the 
> > bandwidth.   I'd say it depends on how much RAM you have in the PII/333 and 
> > how many connections you're trying to support.
> 
> No way a pII 333 is to slow to handle 2Mbit/s, my old 486 can handle
> that easily. You would have to trash the conntrack hashtable with
> multiple attacks to even have a chance of getting it that slow.
> 
> I also believe there's a duplex-mismatch somewhere, probably between the
> firewall and the internal network.

In that case a simple ping flood across the suspicious link can help...

Ramin

> 
> -- 
> /Martin
> 
> Never argue with an idiot. They drag you down to their level, then beat
> you with experience.

