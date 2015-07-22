From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Creating, editing, removing rules from C(++)
Date: Wed, 22 Jul 2015 02:08:48 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1507220202550.10016@aurora.sdinet.de>
References: <55AEBC86.5010604@fundamental-software.net> <20150721191535.5002ff3a@playground>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150721191535.5002ff3a@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: Thomas Delrue <thomas.delrue@fundamental-software.net>, netfilter@vger.kernel.org

On Tue, 21 Jul 2015, Neal P. Murphy wrote:

> On Tue, 21 Jul 2015 17:41:26 -0400
> Thomas Delrue <thomas.delrue@fundamental-software.net> wrote:
> 
> > Is there a way to interact with the firewall rules from a C(++) program?
> > What I'm really trying to do is have a program that only allows a
> > certain set of CIDRs through the firewall through a particular port.
> > However these CIDRs change from time to time and so my application is
> > there to update the firewall rules to make sure that the firewall rules
> > contain the latest and greatest information that says: "drop everything
> > trying to connect to port P EXCEPT for stuff originating from these CIDRs".
> 
> It seems in your case that you don't need high performance or high 
> efficiency, so you should be able to use system() to run 
> iptables-restore.

And in this special case of "set of CIDRs" it even more sounds like a 
job for ipset - setup a static iptables ruleset using iptables-restore, 
and if you need performance modify the list of network ranges in a 
hash-table using libipset.

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
