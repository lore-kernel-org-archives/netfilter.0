From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Re: ip_conntrack_pptp and inbound PPTP/GRE
Date: Thu, 5 Aug 2004 08:35:19 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0408050828140.30895-100000@e-smith.charlieb.ott.istop.com>
References: <4111B04A.4090801@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4111B04A.4090801@snapgear.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org


On Thu, 5 Aug 2004, Philip Craig wrote:

> Charlie Brady wrote:
> > I've struck a problem with inbound PPTP with CVS pptp conntrack and a 
> > patched 2.4.18 kernel.
> 
> Which pptp server and client are you using? 

poptop 1.1.3, and XP (I think).

> Is either on the iptables machine?

poptop is on the machine in question.

> Is there any reason you are still using 2.4.18? 

Vendor supplied kernel.

> It is quite likely that this kernel is lacking patches that are required
> for PPTP connection tracking.

The netfilter code is newer than the orig 2.4.18 kernel. It's possible 
that something else is needed, but I'm not prepared to put it down to that 
without further investigation.

> > ...
> > gre      47 170 timeout=30, stream_timeout=180 src=64.230.9.110 \
> >  dst=64.230.132.224 version=1 protocol=0x880b srckey=0x0 dstkey=0x1f21\
> >  src=64.230.132.224 dst=64.230.9.110 version=1 protocol=0x880b srckey=0x1f21 dstkey=0x0 \
> >  [ASSURED] use=1
> 
> The low timeouts on this conntrack indicate it is using only
> the gre connection tracking and not the pptp connection tracking.
> That is, it is not related to the pptp control connection, and
> shouldn't have been created if all was working.

OK. So this was set up by outgoing GRE.

> > gre      47 566 timeout=600, stream_timeout=432000 src=64.230.132.224 \
> >   dst=64.230.9.110 version=1 protocol=0x880b srckey=0x0 dstkey=0x0 \
> >   [UNREPLIED] \
> >   src=64.230.9.110 dst=64.230.132.224 version=1 protocol=0x880b srckey=0x0 dstkey=0x0 \
> >   use=1
> 
> This conntrack is related to the pptp connection tracking, but
> having both a srckey and dstkey of 0 is very unusual.  I expect that
> the keys should be the same as the first conntrack.

OK.

> > tcp      6 431968 ESTABLISHED \
> >   src=64.230.132.224 dst=64.230.9.110 sport=7968 dport=1723 \
> >   src=64.230.9.110 dst=64.230.132.224 sport=1723 dport=7968 \
> >   [ASSURED] use=2
> > ...
> > 
> > The problem is that after establishing the connection, I have two gre 
> > conntrack entries. The first one above sees the tunnel traffic, and the 
> > timeout value is continually reset. The second one always stays UNREPLIED 
> > and times out after 10 minutes. After the timeout, new incoming GRE 
> > packets no longer have state RELATED and are blocked.
> > 
> > Is this a bug, or am I doing something wrong? If nobody is sure, can 
> > someone advise how I can proceed?  I'm in the process of enabling the 
> > debugging code in the conntrack module.
> 
> Enabling debugging would certainly help figure out what is going
> wrong, but it would be preferable to try a later kernel if possible.

Possible, but not trivial.

---
Charlie


