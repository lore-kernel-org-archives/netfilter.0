From: Andreas Herz <andi@geekosphere.org>
Subject: Re: ipset/iptables does not check flags related to a set
Date: Wed, 18 Apr 2012 09:05:35 +0200
Message-ID: <20120418070535.GL29947@sweethome.fritz.box>
References: <20120417144116.GJ29947@sweethome.fritz.box>
 <alpine.DEB.2.00.1204172016410.25638@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1204172016410.25638@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On 17/04/12 at 20:26, Jozsef Kadlecsik wrote:
> On Tue, 17 Apr 2012, Andreas Herz wrote:
> 
> > While i'm adding the functionality i would like for ipset/iptables i
> > stumbled upon the following issues:
> > 
> > For example you create a bitmap:ip,mac set "foobar" with range
> > 192.168.0.0/24 timeout 3600.
> > The first issue is, when you want to add a ip like this:
> > 
> > > ipset add foobar 192.168.0.1 timeout 7200
> > 
> > The timeout and the ip is set in the "foobar" set but the timeout stays
> > on 7200 and won't go down. The correct way would be:
> 
> Please read the ipset manpage.
>  

You're right, i missed this hint in the manpage. Although it's confusing
in the firstplace.

> > > ipset add foobar 192.168.0.1,12:34:56:78:90:AB timeout 7200
> > 
> > then it's working. So the first suggestion is, that ipset the userspace
> > program parses the arguments and won't accept just an ip when ip,mac is
> > needed.
> > 
> > So with this in mind, the issue also occurs in iptables:
> > 
> > > iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SET
> > > --add-set foobar src --exist --timeout 600
> > 
> > or
> > 
> > > iptables -A INPUT -m set --match-set foobar src -j LOG --log-prefix
> > > "foobar set matched: "
> > 
> > Iptables doesn't complain about "src" although "src,src" would be right.
> > 
> > Can anyone confirm this?
> 
> Yes, that's also required: we have list of sets which can contain 
> (sub)sets of different dimensions.
> 

That's right, but isn't it possible to check if it's a single set or a
list of sets? So the flags could be checked when it's a single set? It's
no big deal, i just recognized this.

> > I could work on this, if the bug/issue is confirmed. Although the
> > priority is on the addition and compare-set feature, which is working
> > quite well here :)
> 
> It'd be really great if you'd justify why such a comparison is a good 
> thing.

Well i also requested the "addition" or "increase" feature for a
timeout and you said you would put it on the feature request list :)
And i guess this feature could make sense as you could set a new timeout
already.

For the second feature i will give you an example:

I have a "goodset" and a "badset" and they contain ip address with
timeouts. If a module like psd or hashlimit recognizes a Portscan or DoS
iptables puts the source into the "badset" with a timeout, this timeout
increases with every "attack". The "goodset" is filled the other way. So
i have two sets and now the compare-set match comes in place.
This match checks if the src ip is in both sets and reads the timeout
for this src ip in those sets, if the difference between the "badset"
timeout for this ip and the "goodset" timeout for this ip is greater
then the threshold (parameter) than it returns true and i could block
this ip completely.

I know that this may be a special scenario and ipset isn't made for
this.

> ipset does not aim to solve every issue.

I totally agree. This is the reason why i'm also thinking about moving
this part to a seperate match module for the compare-set part although i
would still call ipset in this module.

-- 
Andreas Herz
