From: Andrew Beverley <andy@andybev.com>
Subject: Re: How to restrict torrent download  ?
Date: Fri, 17 Feb 2012 20:46:09 +0000
Message-ID: <1329511569.30413.40.camel@andrew-desktop>
References: <20120216160904.2ea59e26@shiva.selfip.org>
	 <1329389715.3296.12.camel@ns014530.dcyb.net>
	 <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>
	 <20120216171909.3a3cd4c1@shiva.selfip.org>
	 <1329393715.3296.18.camel@ns014530.dcyb.net>
	 <1329411784.18690.463.camel@andrew-desktop>
	 <op.v9saw7z7x1lyi3@debiandesk2.net>
	 <1329502816.30413.28.camel@andrew-desktop>
	 <op.v9ubapr5x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.v9ubapr5x1lyi3@debiandesk2.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1329511573;
	bh=RciOUs9zNOL+ioMHEe7PhpMgkw/PRsKatnNOk5igOWQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=F+4xG40x9WQwEPRVH+Ok5AKvpXKXDa6yQRQ1eAFLh9nmh99l/JdjxzPWSvgEEZ5cc
	 38Qel9gzwd+1ZBjFr7mcr/X9gKf/uwWZRlzXPSRvR5z00jRigmHk7nuZcENOmoLogB
	 DQa41AL/jwtrr6lYlYNPiYwUKx0gFVwTOJeV20Dc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "Rob Sterenborg (lists)" <lists@sterenborg.info>, "J. Bakshi" <joydeep@infoservices.in>, netfilter@vger.kernel.org

On Fri, 2012-02-17 at 14:31 -0600, Lloyd Standish wrote:
> On Fri, 17 Feb 2012 12:20:16 -0600, Andrew Beverley <andy@andybev.com> wrote:
> 
> > 2. Doing the prioritisation elsewhere to the rate limiting. This doesn't
> > work, as you can only prioritise when you have too much traffic,
> > otherwise all the packets just pass straight through.

> I may be wrong, but I thing prioritization at the load-balancing router
> will work, even though there is rate-limiting at the users' radios. 

[...]

> So the central router establishes lots of simultaneous connections
> balanced over its 5 uplinks.  Each uplink is only 600 kbit, limited to
> maximum 500 kbit by an HTB qdisc on each uplink, to avoid queuing at
> the ISP.  Even though each individual user is rate-limited, the
> combined egress traffic can easily exceed the uplink bandwidth, and
> would start getting queued in the central router.

Yes, that will work, because you've got a queue at the user's radio and
in the main router. My point was that prioritisation will only work if
you're also doing some sort of shaping/policing.

> As far as bittorrent download goes, I understand that bittorent will
> not allow a user to download (much) more than he or she uploads.

That's not something I've seen, but my use of bittorrents is pretty
minimal so I wouldn't like to say for certain.

> In fact I am using only a policing qdisc on ingress.
> Does this plan
> sound reasonable to you, or am I overlooking or misunderstanding
> something?

Sounds reasonable, yes. Personally I've always done both egress and
ingress (as egress on the LAN), but that's not based on any experience
that only doing egress does not work.

Andy


