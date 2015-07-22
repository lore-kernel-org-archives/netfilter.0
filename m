From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Creating, editing, removing rules from C(++)
Date: Tue, 21 Jul 2015 20:31:51 -0400
Message-ID: <20150721203151.1013534d@playground>
References: <55AEBC86.5010604@fundamental-software.net>
	<20150721191535.5002ff3a@playground>
	<alpine.DEB.2.20.1507220202550.10016@aurora.sdinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.20.1507220202550.10016@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: Thomas Delrue <thomas.delrue@fundamental-software.net>, netfilter@vger.kernel.org

On Wed, 22 Jul 2015 02:08:48 +0200 (CEST)
Sven-Haegar Koch <haegar@sdinet.de> wrote:

> On Tue, 21 Jul 2015, Neal P. Murphy wrote:
> 
> > On Tue, 21 Jul 2015 17:41:26 -0400
> > Thomas Delrue <thomas.delrue@fundamental-software.net> wrote:
> > 
> > > Is there a way to interact with the firewall rules from a C(++) program?
> > > What I'm really trying to do is have a program that only allows a
> > > certain set of CIDRs through the firewall through a particular port.
> > > However these CIDRs change from time to time and so my application is
> > > there to update the firewall rules to make sure that the firewall rules
> > > contain the latest and greatest information that says: "drop everything
> > > trying to connect to port P EXCEPT for stuff originating from these CIDRs".
> > 
> > It seems in your case that you don't need high performance or high 
> > efficiency, so you should be able to use system() to run 
> > iptables-restore.
> 
> And in this special case of "set of CIDRs" it even more sounds like a 
> job for ipset - setup a static iptables ruleset using iptables-restore, 
> and if you need performance modify the list of network ranges in a 
> hash-table using libipset.

Agreed, if the set of CIDRs is large enough.
