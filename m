From: Nik Trevallyn-Jones <nik@designer.com.au>
Subject: Re: active firewall
Date: Wed, 24 Sep 2003 00:07:14 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03092400071405.01185@slinky.exmosys.com>
References: <03092320103102.01185@slinky.exmosys.com> <3F704B6A.7010905@chrisbrenton.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F704B6A.7010905@chrisbrenton.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 23 Sep 2003 23:32, you wrote:
> Nik Trevallyn-Jones wrote:
> >    As a result of experiences deploying PortSentry behind an ipchains
> > firewall recently, I started considering how iptables could be used to
> > deploy a dynamic firewall which would be able to modify itself in
> > response to predefined events.
>
> Be very careful with this. I've seen savvy attackers spoof attacks from
> the root name servers in order to make the firewall DoS the local
> environment. :(

Obviously any firewall rules, whether manually or automatically implemented 
are susceptible to address spoofing. That's one of the reasons I've tried to 
make my idea as general possible.

> > Q: Has anyone considered or suggested this before?
>
> Yup, and the feature is built into many commercial firewalls (FW-1, PIX,
> etc.). I know Bill Stearns was working on this at one point. You might
> be able to find more info at:
> http://www.stearns.org

coowell!  Thanks for the pointer!

> > 1  two new targets: ENLIST, DELIST
> > These targets effectively cause one or more new rules to be automatically
> > added/removed to/from the firewall in response to matching the associated
> > rule.
>
> Depending on your IDS, you can script this as well. I seem to remember a
> paper floating around at one point that shows how to set this up with
> Snort and iptables.

I haven't looked at snort, but PortSentry can (and does on my machine) do 
quite a bit of this. However, as I considered what improvements I would like 
in PortSentry, it became obvious I was trying to put rule-matching chain 
logic into it - hence my idea to extend iptables.

> > I would like to write a rule which asserts: "BLACKLIST any host that
> > sends a SYN packet to any ports between 1025-50000 unless there is a
> > socket listening to the port at the time the packet arrives".
>
> Hummm, so if I back door your system the firewall will happily update
> the ruleset to permit me access to that port. That's very polite of it. ;-)

Well, if I'm polite to hackers, maybe they'll be nice to me??

- Actually my logic (possibly flawed) was that if they had back doored my 
system, they probably had enough control to rewrite/disable my firewall 
anyway.

This kind of ability seems to be much more useful on my internal LAN than on 
my internet interface. I've found in general that PortSentry does basically 
nothing on my internet interface, because the firewall is stopping any 
traffic that would normally trip PortSentry. However, on my internal LAN, 
PortSentry flipped up the shutters pronto when someone recently connected a 
laptop that was infected with the Blaster worm.

Sadly, there was no firewall between that laptop and my other (relatively 
few) PCs, but PortSentry's response alerted me pretty quickly. So what I am 
planning now is a separate "quarantine" subnet where I will corral all 
laptops that could be carrying disease. In that case, PortSentry on the 
firewall/router between the quarantine and regular LAN would probably stop an 
infection spreading out of the quarantine subnet.

Cheers!
Nik.

