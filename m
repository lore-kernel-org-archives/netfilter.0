From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Special firewall for wannabee dmz machine
Date: Tue, 25 Dec 2007 16:47:43 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0712251639470.21533@mail3.jubileegroup.co.uk>
References: <87abnyubhl.fsf@newsguy.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87abnyubhl.fsf@newsguy.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

On Tue, 25 Dec 2007 reader@newsguy.com wrote:

> I'm setting up a gentoo linux machine who's sole purpose is to get
> traffic coming to a NETGEAR router upstream [snip]

Why not install a purpose-made firewall distro, and maybe some addons?
You'll get logs, a GUI, graphs, all kinds of fun stuff.

> I just want to poke around in the logs of what is coming my way.

You must be _really_ desperate for entertainment.  :)

> It will only need to communicate to the internet rarely if at all
> and then from lynx, or over ssh.  It has no X installed, no services
> like apache, samba, cups, etc etc.  Only ssh.  And I'd like that to
> only be open to the lan.

If you don't run any services then anything you record in your logs
will be of doubtful value.  Obviously if an attacker probes your IP
and finds no services running which he can attack, then he'll go away
and look somewhere else.  Maybe you should Google for 'honeypot'.

> I'm confused about which things need to be allowed in and how to
> handle the rejected stuff, far as

There are plenty of tutorials on the Web, for example see

http://www.google.co.uk/search?hl=en&q=iptables+tutorial&btnG=Search&meta=

> logging only possible nasty stuff and not normal dns or other normal
> traffic.

What makes you think that traffic sent to your DNS server can't be nasty? :)

--

73,
Ged.
