From: "Daniel J. Brennan" <djbrennan@comcast.net>
Subject: Re: Network number getting mangled
Date: Tue, 1 Mar 2005 20:21:37 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0503012016300.11531@spm.home.djb.net>
References: <Pine.LNX.4.58.0503011618080.11531@spm.home.djb.net>
	<20050301220459.GA31857@bender.817west.com>
	<Pine.LNX.4.58.0503011711120.11531@spm.home.djb.net>
	<20050301222355.GA31991@bender.817west.com>
Mime-Version: 1.0
In-Reply-To: <20050301222355.GA31991@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Ah yes, I did the math on the way home. I hastily typed my last post before
catching my train and put a 2 where I meant 8. I realize my mistake and
am rather embarrassed for posting before thinking. I am sorry to waste
your time, but I appreciative of all your help. I'll be more careful in
the future.

Thanks,
Dan

> 
> which would be:  x.x.168.0/21
> 
> > of 255.255.242.
> 
> ahh...no...  255.255.248.0 maybe?
> 
> > As I said the private space mirrors this IP space.
> > This is a legitimate public IP subnet. How do I define it to iptables,
> > since the public IP space is not as I would expect in iptables either.
> 
> as a /21...
> 
> this message on IP Subnetting has been brought to you by the letter 'S.'
> 
> -j
> 
> --
> "Weaseling out of things is important to learn. It's what separates
>  us from the animals...except the weasel."
>         --The Simpsons
> 

