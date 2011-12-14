From: Andrew Beverley <andy@andybev.com>
Subject: Re: prio + policing filter on ingress?
Date: Wed, 14 Dec 2011 20:13:33 +0000
Message-ID: <1323893613.1995.152.camel@andybev-desktop>
References: <op.v6dujdvsx1lyi3@debiandesk2.net>
	 <1323800724.1995.58.camel@andybev-desktop>
	 <op.v6f2p4edx1lyi3@debiandesk2.net>
	 <1323813101.1995.116.camel@andybev-desktop>
	 <1323816812.8451.3.camel@denise.theartistscloset.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1323893615;
	bh=fZGjLZxPR4FYkHc15RO6GvKkO5r35/ekYeEVkfl2jTY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=SaysIiUZvVIgXaXfjXKoFqQNgbhPHDQmRGrP6oRGupd/nKFr25CR4Pl0qnQ+WJ1ki
	 HV7axMaMOj7r0xoAozBpxKEISSE72uJz/M7xDLXAg3c5UVF0vQVdF5F6Z4laSgcc4a
	 4ZFsCaPD66coEFwQpyjNDL+/B2J4sQNs2zNqz7mU=
In-Reply-To: <1323816812.8451.3.camel@denise.theartistscloset.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Lloyd Standish <lloyd@crnatural.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 2011-12-13 at 17:53 -0500, John A. Sullivan III wrote:
> > > Now, my friend wants to be able to make personal use of the UNUSED
> > >  bandwidth without infringing on his customers' paid bandwidth.  So I
> > >  got the idea of putting all traffic to his IP (192.168.0.5 in my
> > >  example) into band 3 of a prio qdisc.
> > 
> > For you to do *exactly* what you describe, I think you'd have to use the
> > prio qdisc. And as you have found, it's quite limited. You could attach
> > a TBF qdisc to each leaf class to rate limit, but as you have already
> > alluded, this would not give an overall rate limit.

Well according to a question just posted to the (new) LARTC mailing
list, you can use HTB with a prio attached to one of the leafs. You
could try that. I.e. have a single HTB leaf, with a prio below it. The
HTB leaf will throttle your traffic, but I guess that the prio will
allow any demand on that throttled link to be prioritised, which will
then draw on the class above it as appropriate. Something like:

tc qdisc add dev ifb0 root handle 1 htb default 5000 r2q 6
tc class add dev ifb0 parent 1: classid 1:3 htb rate 100Mbit
tc qdisc add dev ifb0 parent 1:3 handle 5000 prio

> <snip>
> HFSC might not be a bad idea for you.  I'm still trying to get my head
> around it

Ah yes, I've noticed the questions on the netdev list. Thanks for that -
I just need to spend some time reading through the details now!

Andy


