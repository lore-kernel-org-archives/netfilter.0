From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Question on PREROUTING and INPUT chains
Date: Mon, 11 Nov 2002 23:53:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111235308.RPCD9836.mta01-svc.ntlworld.com@there>
References: <3DCD21FC.6010402@offlineprovider.de> <1037058069.3178.14.camel@trent.nin>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037058069.3178.14.camel@trent.nin>
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
To: netfilter@lists.netfilter.org

On Monday 11 November 2002 11:41 pm, alex wrote:

> On Sat, 2002-11-09 at 14:55, Simon Kowallik wrote:
> > Perhaps this helps to better understand the "flow":
> > http://offlineprovider.de/site/netfilter/netfilter.php
> >
> > Regards,
> > Simon
>
> If I'm understanding the diagram correctly that might explain my
> problems. Am I to understand that all packets on a NAT'ed connection
> never go through the FORWARD chain of filter?

No, that is not correct.

ALL packets which get routed through a netfilter box go through the FORWARD 
filter chain.

Packets coming in to a netfilter box (and either terminating there, or going 
through it to some other destination) go through the PREROUTING nat table.

Packets leaving a netfilter box (whether they came through it from somewhere 
else, or originated on the box) go through the POSTROUTING nat table.

The only thing which normally catches people out is that reply packets which 
are part of a NATted connection do not go through the rules in the nat tables 
- they get "automagically reverse NATted" in the correct way to match the NAT 
of the original packets (to which these are replies), which *was* done by a 
rule in the tables.

Basically what I'm saying is that you only need to specify nat rules for the 
first packet in a connection - you don't need to worry about writing your own 
rule to nat the reply.

Hope this helps.

Antony.

-- 

I vote "no" to this proposal to form a committee to investigate whether we 
should or should not hold a ballot on whether to vote yet.

