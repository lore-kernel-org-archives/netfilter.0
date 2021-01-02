From: Brian Pond <brian@datahenge.com>
Subject: Re: Correction to nftables wiki
Date: Sat, 02 Jan 2021 14:03:07 -0800
Message-ID: <f910012f0671e66d836f49dcd175e6fa921e2404.camel@datahenge.com>
References: <76cb4d39d82626ab3d03df4c112ebaf6bdec17de.camel@datahenge.com>
                 <5be52cd79aed99af1b11cbf1400534aa60c849d8.camel@datahenge.com>
                 <58b7d4f9-f7a7-dc06-01d9-d1bad5e3b8af@plushkava.net>
         <6427cda436b129e110022c59830bb73a5c461543.camel@datahenge.com>
         <alpine.DEB.2.21.2012310910060.20603@piplus.local.jubileegroup.co.uk>
Reply-To: brian@datahenge.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.2012310910060.20603@piplus.local.jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: netfilter@vger.kernel.org

Sure, here are some reasons I prefer nftables over iptables:

* No default tables and chains.  I prefer beginning with a "clean
slate" in nftables, and only defining elements I need.

* Atomic rule activation.  This was a huge improvement.  First, when
loading rules using 'nft -f', I'm now guaranteed my firewall isn't
briefly offline.  Peace of mind.

More importantly, I don't need to worry as much about "rollbacks."
With iptables, I had to implement custom code to snapshot the current
firewall state.  And then "rollback" if any single command failed. 
This is accomplished much-easier with nftables.

* I love the built-in support for configuration files (nftables.conf),
which can chain to other configuration files using the "include"
directive.  Accomplishing the same with iptables required a lot of
custom scripting.

* The ability to "log" and "drop" on the same rule line means fewer
rules.  So easier to read.

* The new "inet" tables mean I don't need to duplicate certain rules
for IPv4 and IPv6.

* Named Sets are fantastic.  I maintain lists of known bad IPs
(Blocklist), noisy neighbors and residents, and also known-good Package
Servers.  Storing these in sets means my filter rules are much, much
easier to read.  It also makes debugging easier, because I can quickly
check if an IP address belongs to one of my sets.

The past year, I've encountered a few nftables headaches.  But I've
resolve most of them.  For example, the Linux kernel that ships with
Debian 10 Buster does not fully support nftables.  So for every host I
work on, I've had to manually upgrade to a newer kernel.  Then verify
the NAT kernel module for nftables is loaded.

There are character limits on things like Table or Chain names.  So I
do some validation in scripts, prior to attempting to apply rules.

Currently I'm battling a 2017 issue reported by Jeff Kletsky, where my
NAT rules will not attached to an inet table.

"Error: NAT is only supported for IPv4/IPv6"
https://www.spinics.net/lists/netfilter/msg57571.html

To resolve this, I'll just split my NAT Prerouting table into IPv4 and
IPv6.

Hope this email was helpful!

~Brian Pond



On Thu, 2020-12-31 at 09:50 +0000, G.W. Haywood wrote:
> Hi there,
> 
> On Wed, 30 Dec 2020, Brian Pond wrote:
> 
> > ... I've been working a lot on firewall tooling this past year.
> > It's been much easier (and better) using nftables versus the legacy
> > iptables system.
> 
> Do you think that you could jot down the main reasons that you've
> found for the improvements?  Mail to the list would be fine for me.
> 
> I ask because I've found the change in syntax quite bewildering, and,
> whenever I want to do more or less anything, most of the time I don't
> even know where to start using nft commands so I find myself
> reverting
> to iptables - because I can do that without really thinking about it,
> and get the job done.  I don't know that I'd ever want to do anything
> that I could do with nft that I couldn't do with iptables.  I don't
> even know if there are such things, nor what those things might be. 
> I
> have no clue if the things I do could be more efficient with nft.
> 
> If it will make any difference to your observations for my purposes,
> typically I use just iptables and ipsets; a couple of dozen iptables
> rules, for example
> 
> # iptables -L BLOCKSET --line-numbers
> Chain BLOCKSET (1 references)
> n  targ prot opt source   dest 
> 1  DROP tcp  --  anywhere anywhere match-set BLOCKSET08 src
> 2  DROP tcp  --  anywhere anywhere match-set BLOCKSET09 src
> 3  DROP tcp  --  anywhere anywhere match-set BLOCKSET10 src
> 4  DROP tcp  --  anywhere anywhere match-set BLOCKSET11 src
> 5  DROP tcp  --  anywhere anywhere match-set BLOCKSET12 src
> 6  DROP tcp  --  anywhere anywhere match-set BLOCKSET13 src
> 7  DROP tcp  --  anywhere anywhere match-set BLOCKSET14 src
> 8  DROP tcp  --  anywhere anywhere match-set BLOCKSET15 src
> 9  DROP tcp  --  anywhere anywhere match-set BLOCKSET16 src
> 10 DROP tcp  --  anywhere anywhere match-set BLOCKSET17 src
> 11 DROP tcp  --  anywhere anywhere match-set BLOCKSET18 src
> 12 DROP tcp  --  anywhere anywhere match-set BLOCKSET19 src
> 13 DROP tcp  --  anywhere anywhere match-set BLOCKSET20 src
> 14 DROP tcp  --  anywhere anywhere match-set BLOCKSET21 src
> 15 DROP tcp  --  anywhere anywhere match-set BLOCKSET22 src
> 16 DROP tcp  --  anywhere anywhere match-set BLOCKSET23 src
> 17 DROP tcp  --  anywhere anywhere match-set BLOCKSET24 src
> 18 DROP tcp  --  anywhere anywhere match-set BLOCKSET25 src
> 19 DROP tcp  --  anywhere anywhere match-set BLOCKSET26 src
> 20 DROP tcp  --  anywhere anywhere match-set BLOCKSET27 src
> 21 DROP tcp  --  anywhere anywhere match-set BLOCKSET28 src
> 22 DROP tcp  --  anywhere anywhere match-set BLOCKSET29 src
> 23 DROP tcp  --  anywhere anywhere match-set BLOCKSET30 src
> 24 DROP tcp  --  anywhere anywhere match-set BLOCKSET31 src
> 25 DROP tcp  --  anywhere anywhere match-set BLOCKSET32 src
> 
> and a few tens of thousands of ipset matches to DROP packets from the
> more troublesome netblocks.  The ipsets are created by a boot script,
> then (most of the time) populated automatically by a Sendmail milter
> as mail is processed; for example when some joker tries to send HTTP
> requests to the mail server his IP will be DROPped for a few days.
> 
> There are timeouts on most of the ipset entries.  The main issue I've
> found is that there's an approximately 25 day limit on the timeout,
> so
> if I want something longer I have to jump through some hoops, but
> it's
> no big deal.
> 
> > Happy New Year!
> 
> The same to you, and all.
> 

