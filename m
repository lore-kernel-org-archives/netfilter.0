From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: nf_conntrack_max
Date: Mon, 5 Sep 2016 08:28:54 -0500
Message-ID: <20160905132854.GY28999@harrier.slackbuilds.org>
References: <000e01d203d5$3e576d00$bb064700$@bluemarble.net>
 <20160831224731.GP28999@harrier.slackbuilds.org>
 <20160901105911.GA2779@salvia>
 <20160901170540.GQ28999@harrier.slackbuilds.org>
 <000201d2052b$78188090$684981b0$@bluemarble.net>
 <000001d20613$933e88e0$b9bb9aa0$@bluemarble.net>
 <20160905093304.GB2469@salvia>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160905093304.GB2469@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, Sep 05, 2016 at 11:33:04AM +0200, Pablo Neira Ayuso wrote:
> On Sat, Sep 03, 2016 at 02:47:08PM -0400, John Ratliff wrote:
> > I have been able to raise the conntrack limits and the hashsize, 
> > but I don't know how to get a udp timeout policy yet. I'm using 
> > Debian 8 Jessie with nfct 1.42.
> > 
> > $ nfct timeout add dns-udp inet udp established 15 close 1 close_wait 1
> > nfct v1.4.2: Wrong state name: `ESTABLISHED' for protocol `udp'
> 
> UDP has two states, replied and unreplied, so this is:
> 
>  # nfct add timeout dns-udp inet udp replied 15 unreplied 1

Perhaps I am not understanding, but I think those numbers should 
possibly be reversed? "... replied 1 unreplied 15"?  The goal being 
to hold the conntrack entry up to 15 seconds if we don't hear back 
from the query, but to clear it out quickly after we did.  Would a
"replied 0" be feasible, to get it out of conntrack right away?

[snip]
> That's it. If anyone gets some spare cycles, I'd appreciate if you
> can contribute a patch to update the manpage so this information
> is available there.

I'm at work on it now, if uninterrupted (hah!) I should have it to 
you very soon.  Thank you.
-- 
  http://rob0.nodns4.us/
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
