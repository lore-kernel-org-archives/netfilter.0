From: Unknown <unknown@unknown.invalid>
Subject: Re: Having NAT problems
Date: Thu, 1 Apr 2004 17:41:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <19390.0600578219$1080860496@news.gmane.org>
References: <20040401192505.3100.69461.Mailman@vishnu.netfilter.org> <20040401203013.M36511@niesc.k12.in.us> <200404012145.33403.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <200404012145.33403.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On April 1, 2004 03:45 pm, Antony Stone wrote:
> On Thursday 01 April 2004 9:32 pm, Adam Kennedy wrote:
> > On Thu, 1 Apr 2004 21:19:45 +0100, Antony Stone wrote
> >
> > > Okay, how's this then  - please post all the rules which you think
> > > are needed for this pcAnywhere setup to work (with suitable partial
> > > obscuring of IPs if you wish).   Then we'll tell you if we can see
> > > something missing?
> >
> > That's actually what I wound up doing in the last post. That's all the
> > rules on the box save for a few NAT entries which I just commented out.
> > Commenting them out and re-running the file didn't do anything. I'm at my
> > wits end.
>
> In that case let's see if there's something strange about the protocol
> pcAnywhere uses.   Set up a similar DNAT rule for something we know about,
> like ssh (or http, or any other service you happen to be running on an
> internal server), and see if you can connect to that from the outside
> world.
>
> If you can, then there's obviously something about pcAnywhere which either
> doesn't like NAT, or isn't sufficiently simple to work on a single
> destination port.
>
> If you can't connect to ssh (or whatever) either, then there's something
> weird going on and we really would need to see more about your ruleset to
> help further.
>
> Unless anyone else here can spot something I've missed from what's been
> posted already....?   Maybe someone else has used pcAnywhere through NAT
> with netfilter?
>
> Regards,
>

	I would also suggest some verbose logging on the port, ip address combo.
	I seem to recall PCAnywhere having been discussed on the list last year 
	and someone coming to the conclusion that there were ICMP requirements in 
	the connection ... But don't have the post to hand to put back up... 

	One other point to be raised ...  is the server expecting the connection from 
	the outside world??? I know that we (where I work) use a default config file for 
	PCAnywhere installs that auto denies any address from routeable address 
	spaces.  -- 

	Alistair

