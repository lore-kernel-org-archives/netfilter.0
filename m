From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 15:36:48 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021223648.2693.qmail@web40204.mail.yahoo.com>
References: <00ea01c39818$162e5c80$0301a8c0@SIMON>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ea01c39818$162e5c80$0301a8c0@SIMON>
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
To: Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org


--- Simon Garner <sgarner@expio.co.nz> wrote:
> On Wednesday, October 22, 2003 7:11 AM [GMT+1200=NZT],
> SBlaze <dagent.geo@yahoo.com> wrote:
> 
> >
> > Wouldn't ntop be considered a "probing" tool?
> >
> 
> I wouldn't consider it a probing tool... something like nmap would be
> probing, ntop just listens. And although it puts your eth into
> promiscuous mode, I wouldn't call it a packet sniffer since it won't
> tell you the contents of any packets, only where they're going and how
> big they are etc. I don't think you have anything to worry about.
> 
> Now I have no experience with cable or cable modems (they're practically
> non-existent over here) but wouldn't running this on your linux box only
> show you whatever data your cable modem is sending to you anyway...
> you'd need to put the *cable modem* into promiscuous mode (or
> equivalent) to actually receive any data you shouldn't.
> 
> >
> > And getting back to my original reason and question for this post. How
> > statistically can you see just how much iptables/netfilter is using
> > of system resources?
> >
> 
> I think we're agreed that the level of data you're seeing wouldn't cause
> any problems CPU-wise. You can see kernel CPU usage as "system CPU%" in
> top and vmstat and they're saying 0, which would be expected.
> 
> -Simon
> 
> 

Ok guys well I think that just about wraps this thread up. Special thanks go
out to Jeffery, Simon, and Daniel for all thier help. Really THANKS ALOT
GUYS!!!




=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

