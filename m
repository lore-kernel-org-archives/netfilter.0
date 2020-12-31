From: Brian Pond <brian@datahenge.com>
Subject: Re: Correction to nftables wiki
Date: Wed, 30 Dec 2020 17:36:46 -0800
Message-ID: <6427cda436b129e110022c59830bb73a5c461543.camel@datahenge.com>
References: <76cb4d39d82626ab3d03df4c112ebaf6bdec17de.camel@datahenge.com>
         <5be52cd79aed99af1b11cbf1400534aa60c849d8.camel@datahenge.com>
         <58b7d4f9-f7a7-dc06-01d9-d1bad5e3b8af@plushkava.net>
Reply-To: brian@datahenge.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <58b7d4f9-f7a7-dc06-01d9-d1bad5e3b8af@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: kfm@plushkava.net, netfilter@vger.kernel.org

Thank you!  I think that edit will be extremely helpful for wiki
readers.

A special thanks for everyone's contributions to Netfilter and
nftables.  I've been working a lot on firewall tooling this past year.
It's been much easier (and better) using nftables versus the legacy
iptables system.

Happy New Year!
Brian Pond


On Wed, 2020-12-30 at 22:37 +0000, kfm@plushkava.net wrote:
> Hi Brian,
> 
> On 30/12/2020 19:17, Brian Pond wrote:
> > Dear Netfilter Team,
> > 
> > I would like to propose a correction to the following Wiki page.
> > https://wiki.nftables.org/wiki-
> > nftables/index.php/Configuring_chains#Base_chain_priority
> > 
> > After the code block, the following sentence reads:
> > 
> > "If priority of the 'input chain' above would be changed to -1, all
> > packets would be dropped. "
> > 
> > This sentence is incorrect.  All packets will be dropped,
> > regardless of
> > the priority.  Because within the same hook, a "drop" action always
> > takes precedence over "accept".  Even if the "drop" is in a chain
> > with
> > a later priority.
> > 
> > * I have attached an example illustrating this.  If you load this
> > ruleset with nft, browsing the web is impossible.  Regardless of
> > whatever priority value you choose.
> > * I have previously submitted a bug report about this behavior.  I
> > don't believe Netfilter was intended to work this way.
> > 
> > Either way, I feel the wiki should be updated for accuracy.  That
> > way
> > readers understand how Netfilter is currently working, with regard
> > to
> > drop and priority.
> > 
> > Please let me know if you have any questions.  I would be happy to
> > discuss further, meet online, etc.
> 
> See the following edit.
> 
> https://wiki.nftables.org/wiki-
> nftables/index.php?title=Configuring_chains&diff=610&oldid=534
> 

