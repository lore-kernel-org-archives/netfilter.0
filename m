From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset/iptables does not check flags related to a set
Date: Thu, 19 Apr 2012 09:50:11 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204190933100.30547@blackhole.kfki.hu>
References: <20120417144116.GJ29947@sweethome.fritz.box> <alpine.DEB.2.00.1204172016410.25638@blackhole.kfki.hu> <20120418070535.GL29947@sweethome.fritz.box>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120418070535.GL29947@sweethome.fritz.box>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Wed, 18 Apr 2012, Andreas Herz wrote:

> On 17/04/12 at 20:26, Jozsef Kadlecsik wrote:
> > On Tue, 17 Apr 2012, Andreas Herz wrote:
> > 
> > > > iptables -A INPUT -m set --match-set foobar src -j LOG --log-prefix
> > > > "foobar set matched: "
> > > 
> > > Iptables doesn't complain about "src" although "src,src" would be right.
> > > 
> > > Can anyone confirm this?
> > 
> > Yes, that's also required: we have list of sets which can contain 
> > (sub)sets of different dimensions.
> 
> That's right, but isn't it possible to check if it's a single set or a
> list of sets? So the flags could be checked when it's a single set? It's
> no big deal, i just recognized this.

It'd be possible: swapping different type of sets is disallowed, so that 
way the dimension of the set cannot be changed "behind" the iptables rule.
 
> > > I could work on this, if the bug/issue is confirmed. Although the
> > > priority is on the addition and compare-set feature, which is working
> > > quite well here :)
> > 
> > It'd be really great if you'd justify why such a comparison is a good 
> > thing.
> 
> Well i also requested the "addition" or "increase" feature for a
> timeout and you said you would put it on the feature request list :)
> And i guess this feature could make sense as you could set a new timeout
> already.

I can't recall, nor can find my reply stating that it'd be put on a 
feature list... Anyway, if such a feature is considered, then "addition" 
is not a complete solution, "substraction" should be supported as well. 

I wrote you that because timeout is a generic feature of all set types, 
adding this feature would mean a new protocol version. The ipset protocol 
can negotiate the highest protocol version supported by both sides, but 
the ipset tool hasn't got the internal hooks yet to support multiple 
protocol versions.

Just adding the feature is not enough.

> For the second feature i will give you an example:
> 
> I have a "goodset" and a "badset" and they contain ip address with
> timeouts. If a module like psd or hashlimit recognizes a Portscan or DoS
> iptables puts the source into the "badset" with a timeout, this timeout
> increases with every "attack". The "goodset" is filled the other way. So
> i have two sets and now the compare-set match comes in place.
> This match checks if the src ip is in both sets and reads the timeout
> for this src ip in those sets, if the difference between the "badset"
> timeout for this ip and the "goodset" timeout for this ip is greater
> then the threshold (parameter) than it returns true and i could block
> this ip completely.

Hm, a node is either "bad" (i.e. banning has got higher priority), or 
"good" (i.e. whitelisting is preferred). This timeout comparison between 
the two lists seems to be over-complicated. Why couldn't be the whole 
scheme be simplified to the decision tree "if it's on the blacklist, 
block", "if it's on the whitelist allow", "otherwise fall back to another 
method".

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
