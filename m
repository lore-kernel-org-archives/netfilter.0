From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Mon, 07 Feb 2011 22:11:15 -0400
Message-ID: <1297131075.3956.2.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <1296761916.7587.29.camel@andybev>
	 <1296873898.3644.4.camel@debian-laptop.OptimumWireless>
	 <1296886030.4568.6.camel@debian-laptop.OptimumWireless>
	 <1296908825.1695.8.camel@andybev>
	 <1296958497.3695.18.camel@debian-laptop.OptimumWireless>
	 <1297008953.1613.24.camel@andybev>
	 <1297010113.3928.12.camel@debian-laptop.OptimumWireless>
	 <1297011729.1613.50.camel@andybev>
	 <1297034845.3928.23.camel@debian-laptop.OptimumWireless>
	 <1297126577.1742.34.camel@andybev>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1297126577.1742.34.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Tue, 2011-02-08 at 00:56 +0000, Andrew Beverley wrote:
> On Sun, 2011-02-06 at 19:27 -0400, Optimum Wireless Services wrote:
> > I just added those prioritising rules so, I will be removing them
> > immediately. Is hard to really notice how the ruleset are working since
> > there isn't an utility that can graph or show the actual traffic. I was
> > looking for tc-viewer but, can't find a link where to download it from.
> 
> http://files.andybev.com/web-portal/tc-viewer
> 
> tc-viewer --iface=eth0 --zero --counter=1 --unit=kbit
> 

Great! Thanks.


> > > So you would need separate classes for users and traffic type. They'd
> > > have to be parents/children of each other, but which way round and how
> > > you would do it I do not know.
> > > 
> > 
> > I figured I added the prio rules to the same parent rule I already had.
> > Thought that was the correct way to do it. So, I should create another
> > parent rule for ie; 3, and add the children under that to do traffic
> > prioritizing.
> 
> Something like that, but you'll have problems sharing traffic between
> the different classes (classes for different IP addresses and traffic
> for different priorities). That's why I say that I don't know how to do
> it myself.
> 
> > > So, try the per user stuff on its own first. Maybe try the traffic
> > > prioritisation on its own as well. Check the results and take it from
> > > there.
> > > 
> > > BTW - I don't think the traffic prioritisation scripts you posted will
> > > have much affect anyway: they are only really looking at DNS lookups and
> > > SSH, which isn't going to solve your problems.
> > > 
> > 
> > I wanted to speed up dns lookups, icmps, SYN ACK flags, and ssh, for now
> > and later on add voip since I have an asterisk server on our network as
> > well.
> > 
> > I will remove the prioritising script and leave the last created ruleset
> > and see how things behave.
> 
> If you give me a few days I'll send you through my traffic
> prioritisation script. It won't give you the per-user limit, but I can
> almost guarantee that it will give everyone faster access, so you can at
> least use it for a comparison to see what is possible.
> 
Thanks.

I will defenately test it but, I wouldn't like my users to get used to a
higher speed than they're paying for in case I decide to remove it. If
it works, great. 

How many users do you have on the network you're running the script?

> Andy
> 
> 

