From: John Madden <jmadden@ivytech.edu>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 15:25:15 -0400
Message-ID: <1191525915.27980.2.camel@localhost.localdomain>
References: <1191424890.25752.27.camel@localhost.localdomain>
	 <47042728.1060508@riverviewtech.net>
	 <1191503642.13379.12.camel@localhost.localdomain>
	 <4704F5F5.7010601@plouf.fr.eu.org>
	 <1191507779.13379.50.camel@localhost.localdomain>
	 <4704FFD6.8050304@plouf.fr.eu.org> <47050570.7010609@riverviewtech.net>
	 <47050C2B.8020607@plouf.fr.eu.org>  <47053B33.6090003@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47053B33.6090003@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gtaylor+reply@riverviewtech.net
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, 2007-10-04 at 14:12 -0500, Grant Taylor wrote:
> On 10/04/07 10:52, Pascal Hambourg wrote:
> > It does matter. Granted, maybe should I say "broadcast domain" instead 
> > of "subnet" but they usually overlap. A router can be used as a gateway 
> > in a route only if it is directly reachable, which implies it is in the 
> > same subnet/broadcast domain. You mentionned bridging, which also 
> > implies the same broadcast domain.
> 
> You are correct.  However I should have been a bit more specific in that 
> I don't think that it will matter either way as I think a solution for 
> either config can be developed.  Thus it does not matter what it is 
> because both can probably be solved.  As far as what the solution is, 
> yes it does matter.

Well thanks all for the tips and pointing out what I was doing wrong
here.  I've decided to throw the whole thing out the window -- I'll be
pulling the separate load balancer box out of the picture, moving the
installation of Pound to the mail server itself, and just changing
$EXTIP's hostname to be an alias for $MAILSERVER.  Things will be much
simpler, but not nearly as sexy.  I suppose it'll do. :)

Thanks again,
  John


-- 
John Madden
Sr. UNIX Systems Engineer
Ivy Tech Community College of Indiana
jmadden@ivytech.edu

