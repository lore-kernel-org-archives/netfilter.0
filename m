From: spdesai@gnvfc.net
Subject: Re: Allow particular website/port
Date: Mon, 14 Feb 2005 10:31:52 +0530
Message-ID: <1108357312.421030c0a4a2e@mail.gnvfc.net>
References: <1108064090.420bb75ac0009@mail.gnvfc.net>
	<1108065714.8043.0.camel@porky>
	<1108081685.420bfc1516440@mail.gnvfc.net>
	<a0f69e5050210211124a0269@mail.gmail.com>
	<1108277638.420ef986ae964@mail.gnvfc.net>
	<1108307899.4604.71.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <1108307899.4604.71.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Thank u so much for yr detail explanation..


Quoting Jason Opperisano <opie@817west.com>:

> On Sun, 2005-02-13 at 01:53, spdesai@gnvfc.net wrote:
> > Hi all...particularly Askar,Eric Leblond,Jason Opperisano (which help me)
> > 
> > I have tried to restrict particular website through IPTABLE and its working
> 
> > file .i have use below rules for that..
> > 
> > Suppose we want to open only www.ndtv.com,www.cnn.com ....then i gave rules
> as 
> > per below order only...
> > 
> > iptables -A FORWARD -s 192.168.1.2 -d www.ndtv.com -p tcp --dport 80 -j
> ACCEPT
> > iptables -A FORWARD -s 192.168.1.2 -d www.cnn.com -p tcp --dport 80 -j
> ACCEPT
> > iptables -A FORWARD -p tcp --dport 80 -j DROP
> 
> ok--this is exactly why *i* personally don't think this is a good way to
> do this.  i'm not trying to say i'm right, but let me at least explain
> why i feel the way i do.  let's go to http://www.cnn.com/ shall we?
> 
> first off; at this moment in time, www.cnn.com resolves to:
> 
>   64.236.16.20
>   64.236.16.52
>   64.236.16.84
>   64.236.16.116
>   64.236.24.4
>   64.236.24.12
>   64.236.24.20
>   64.236.24.28
> 
> your rule that specifies "-d www.cnn.com" will resolve that name to IP
> address(es) at the time the rule is loaded.  if cnn decides to
> add/change the IP's for that FQDN--you will need to reload your rules to
> pick up the change.  IMHO:  strike one.
> 
> k--now we have our 8 filter rules in place for those IP's--let's
> actually fire up our trusty web browser (mosaic...natch).  when i browse
> to http://www.cnn.com/ i make requests to:
> 
>   www.cnn.com
>   i.a.cnn.net
>   i.cnn.net
>   cnn.dyn.cnn.com
> 
> we already have the first one accounted for in our filter rules
> (obviously)--so now, i.a.cnn.net (at this moment in time) resolves to:
> 
>   64.236.40.64
>   64.236.40.5
>   64.236.40.8
>   64.236.40.21
>   64.236.40.32
>   64.236.40.46
>   64.236.40.53
>   64.236.40.63
> 
> note that these are akamai addresses and they *will* change frequently.
> 
> next up is i.cnn.net, which currently resolves to:
> 
>   64.236.16.138
>   64.236.16.139
>   64.236.24.136
>   64.236.24.137
>   64.236.24.138
>   64.236.24.139
>   64.236.16.136
>   64.236.16.137
> 
> and lastly, we have cnn.dyn.cnn.com (which judging from its name is
> probably a dynamic; i.e. changing, address):
> 
>   64.236.22.20
>   64.236.22.21
>   64.236.29.20
>   64.236.29.21
> 
> alright--so to allow access to cnn.com requires 28 rules to allow access
> to 28 IP addresses (generated from the 4 -d $FQDN rules) that can change
> whenever they gosh darn feel like and it's up to me to figure all this
> out...i s'pose we could just allow access to the entire 64.236.0.0/16
> net and be done, right?  one rule, *should* cover whatever IP changes
> they decide, right?  it *is* kind of a shame that we would be allowing
> web browsing into a network owned by AOL though, huh?  sorta defeats the
> purpose.  IMHO:  strike two
> 
> let's also keep in mind--i have not clicked through anything on the site
> yet (and i don't plan to, as this is getting a bit ridiculous), but i'm
> guessing i'd need to analyze more traffic, and add more hosts if i
> wanted to watch one of their videos, or listen to their radio etc...
> 
> but there no easier way to do this, right?  when all you have is a
> hammer, every problem starts to look like a nail, or something like
> that.
> 
> i personally am not willing to go through that much effort for my users
> (or myself, actually).  i also prefer not not implement solutions that
> require constant care and feeding like the above.  not when i can add:
> 
>   acl cnn dstdomain .cnn.com .cnn.net
>   http_access allow cnn
> 
> to my squid.conf and move on with my life.
> 
> -j
> 
> ps - i'm aware there was never a strike three.  if you want to put in
> the effort to do this, more power to you.  in my experience people that
> start down this path either (a) give up on it and decide to use a
> app-level filter (b) give up on it and just allow everything or (c) let
> it rot away to the point where users lose faith that the admin has any
> clue as to what he/she is doing.
> 
> --
> "It takes two to lie. One to lie and one to listen."
> 	--The Simpsons
> 
> 
> 




-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/


