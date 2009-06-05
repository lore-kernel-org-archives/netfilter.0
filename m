From: Technical Support <support@bluenorthernsoftware.com>
Subject: Re: "new not syn" packets.. false positive?
Date: Fri, 5 Jun 2009 04:16:59 -0500
Message-ID: <200906050417.00552.support@bluenorthernsoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

  Paul Evans replied:
> 'not syn' packets are any TCP packets that don't contain the SYN flag.
> "NEW" packets are ones for which conntrack cannot find an existing
> entry in the conntrack table.

Thanks, Paul.  I guess with all that said the question I still have is, is it 
safe to assume that there is a problem on the remote end, given that with 
virtually every contact with those sites, at least one packet is always 
dropped per the 'new not syn' rule?  Or is it still possible that, regardless 
of the frequency of the dropped packets from those sites, that there still 
could be a 'legitimate' cause for it to happen?  I'm just trying to get out 
of being the damp middle-man in a whizzing contest between the clients and 
the mighty keepers of the servers. :)  Thanks for the reply and info!

Chuck Logan
