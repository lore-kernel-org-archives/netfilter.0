From: Andreas Herz <andi@geekosphere.org>
Subject: Re: ipset/iptables does not check flags related to a set
Date: Thu, 19 Apr 2012 10:11:10 +0200
Message-ID: <20120419081110.GV29947@sweethome.fritz.box>
References: <20120417144116.GJ29947@sweethome.fritz.box>
 <alpine.DEB.2.00.1204172016410.25638@blackhole.kfki.hu>
 <20120418070535.GL29947@sweethome.fritz.box>
 <alpine.DEB.2.00.1204190933100.30547@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1204190933100.30547@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On 19/04/12 at 09:50, Jozsef Kadlecsik wrote:
> On Wed, 18 Apr 2012, Andreas Herz wrote:
> 
> > On 17/04/12 at 20:26, Jozsef Kadlecsik wrote:
> > > On Tue, 17 Apr 2012, Andreas Herz wrote:
> > > 
> > > > > iptables -A INPUT -m set --match-set foobar src -j LOG --log-prefix
> > > > > "foobar set matched: "
> > > > 
> > > > Iptables doesn't complain about "src" although "src,src" would be right.
> > > > 
> > > > Can anyone confirm this?
> > > 
> > > Yes, that's also required: we have list of sets which can contain 
> > > (sub)sets of different dimensions.
> > 
> > That's right, but isn't it possible to check if it's a single set or a
> > list of sets? So the flags could be checked when it's a single set? It's
> > no big deal, i just recognized this.
> 
> It'd be possible: swapping different type of sets is disallowed, so that 
> way the dimension of the set cannot be changed "behind" the iptables rule.

Thanks for that reply.

> > > > I could work on this, if the bug/issue is confirmed. Although the
> > > > priority is on the addition and compare-set feature, which is working
> > > > quite well here :)
> > > 
> > > It'd be really great if you'd justify why such a comparison is a good 
> > > thing.
> > 
> > Well i also requested the "addition" or "increase" feature for a
> > timeout and you said you would put it on the feature request list :)
> > And i guess this feature could make sense as you could set a new timeout
> > already.
> 
> I can't recall, nor can find my reply stating that it'd be put on a 
> feature list... Anyway, if such a feature is considered, then "addition" 
> is not a complete solution, "substraction" should be supported as well. 

It was the mail from 1.August 2011 between us two.
And yes substraction would make it complete.

> I wrote you that because timeout is a generic feature of all set types, 
> adding this feature would mean a new protocol version. The ipset protocol 
> can negotiate the highest protocol version supported by both sides, but 
> the ipset tool hasn't got the internal hooks yet to support multiple 
> protocol versions.
> 
> Just adding the feature is not enough.
> 

I agree, although i got it working for now except the fact that i can't
use addition (substraction) with the ipset tool, it's just working with
iptables. But that fits to your reply here,

> > For the second feature i will give you an example:
> > 
> > I have a "goodset" and a "badset" and they contain ip address with
> > timeouts. If a module like psd or hashlimit recognizes a Portscan or DoS
> > iptables puts the source into the "badset" with a timeout, this timeout
> > increases with every "attack". The "goodset" is filled the other way. So
> > i have two sets and now the compare-set match comes in place.
> > This match checks if the src ip is in both sets and reads the timeout
> > for this src ip in those sets, if the difference between the "badset"
> > timeout for this ip and the "goodset" timeout for this ip is greater
> > then the threshold (parameter) than it returns true and i could block
> > this ip completely.
> 
> Hm, a node is either "bad" (i.e. banning has got higher priority), or 
> "good" (i.e. whitelisting is preferred). This timeout comparison between 
> the two lists seems to be over-complicated. Why couldn't be the whole 
> scheme be simplified to the decision tree "if it's on the blacklist, 
> block", "if it's on the whitelist allow", "otherwise fall back to another 
> method".
> 

It's not that simple, in the scenario you describe i totally agree.
But the decision is not based on a simple black- and whitelist it's more
a dynamic way. I collect bad and good behaviour and if the bad behaviour
exceeds the good behaviour (depending on a threshold) the src will be
blocked completely for a specified amount of time. Until this point the
src can still access the network and just the bad behaviour itself is
blocked.

For example:

The IP 1.2.3.4 is an external IP from the internet that represents an
outpost of a company that connects via VPN/IPsec to the company
headcenter. It also tries to reach the website hosted at the headcenter
and the mailserver. So you have valid traffic for VPN, HTTP, IMAP, SMTP
etc. this could go to the good list. Then one of the users starts a
Portscan and DoS from the external IP, so the firewall at the headcenter
detects the Portscan and the DoS and blocks those packets/connections.
But it also saves the attacking attempts to the bad list. So you "good"
and "bad" traffic coming from that IP. If the "bad" exceeds the "good"
traffic the IP will be blocked for 1 day, if it's still going on after 1
day, it will be blocked for 1 week and so on. It's like a dynamic
firewall.

The first thing is to block just the "bad" traffic itself by using
hashlimit/recent for DoS for example, psd/lscan/snort for Portscan so
they won't hurt. But valid traffic should still go on. But if the
attacks get more and more the IP should be blocked completely.
I hope i could make it clear why i'm doing this.

thanks so far.

-- 
Andreas Herz
