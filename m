From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 1 Sep 2004 12:53:52 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409011253.52931.Alistair@nerdnet.ca>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<200409011044.27158.Alistair@nerdnet.ca>
	<8ca4228204090109202271a1da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca4228204090109202271a1da@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 1, 2004 12:20 pm, Mike wrote:
> Hi Alistair,
>

	<SNIPPAGE>

>
> This comment pricks up my ears/eyes.  Why is this so, and do you have
> links to discussions on this topic.

	Prowl back through the lists -- there are several discussions on the issue.
	In the case of large scale firewalls there may be some call for using 
	mangle and nat to do filtering but its not really a good idea, since you then 
	need to build rules to let things through mangle and nat.
>
> >         There is a wonderful fellow named Oskar Andreasson who has
> > written a wonderful set of tutorials, and even provides some elemental
> > scripts as guidelines
> >         http://iptables-tutorial.frozentux.net/
> >
> >         Read and enjoy
>
> Thanks for pointer.  I've got a Firefox tab open to it right now.
> Looks very good.  Now let's see if I can absorb it.
>
> > > echo "   Enabling forwarding.."
> > > echo "1" > /proc/sys/net/ipv4/ip_forward
> >
> >         Urk
> >           Do this at the *end* of the script. -- just a good habit to NOT
> > turn on forwarding until all the rules are loaded to handle it.
>
> That sounds like a very good idea to me.  Noted for edit this evening.
>
> > > echo "   Set the filter/nat/mangle packet Matching Table Policy."
> > > $IPTABLES -t filter -P INPUT DROP
> > > $IPTABLES -t filter -P OUTPUT DROP
> > > $IPTABLES -t filter -P FORWARD DROP
> >
> > The above are a (tm) Good Thing (tm)
>
> Yes, this is the kind of thing that I want - start from complete
> lockdown, and then open only one thing at a time until I can do
> everything that I want on the network and maintain everything else in
> lockdown.
>
> > > $IPTABLES -t nat -P PREROUTING DROP
> > > $IPTABLES -t nat -P POSTROUTING DROP
> > > $IPTABLES -t nat -P OUTPUT DROP
> > > $IPTABLES -t mangle -P INPUT DROP
> > > $IPTABLES -t mangle -P OUTPUT DROP
> > > $IPTABLES -t mangle -P FORWARD DROP
> > > $IPTABLES -t mangle -P PREROUTING DROP
> > > $IPTABLES -t mangle -P POSTROUTING DROP
> >
> > In general the above are a (tm) Really Bad Thing (tm)
>
> As previously requested above, why are these policies bad/unworkable?
> Any info. and links discussing these iptables fundamentals would be
> greatly valued.

	You now have to put in ACCEPT rules to get things through.  This gets 
complicated by the fact that functionality changes in mangle and nat.   
Better to let things through the mangle and nat tables, and do filtering in 
the filter table.  There have been folks who like to drop things in the 
mangle and nat tables, but setting actual DROP policies makes life very 
difficult.

> > > echo "   INPUT/OUTPUT Rules for Routerbox."
> > > $IPTABLES -t filter -A INPUT -j ACCEPT
> > > $IPTABLES -t filter -A OUTPUT -j ACCEPT
> >
> > Uhhh ... I hope these are only here because yer having problems --
> >    These above two rules are a (tm) Really Bad Thing (tm)
> >         (they basically allow everything in and out -- *ouch*)
>
> You got it.  This is the rule of a man willing to submit his machines
> to a world of hostility in a desperate attempt to get
> some-packet/any-packet  through the routerbox.
>
> > > echo "   FORWARD Rules for data allowed IN and OUT of the LAN."
> > > $IPTABLES -t filter -A FORWARD -i eth0 -o eth1 -m state --state
> > > ESTABLISHED,RELATED -j ACCEPT
> >
> > Repeat the above rule for filter INPUT
>
> Ahh, I see what you are getting at.  Will do.
>
> > > $IPTABLES -t filter -A FORWARD -i eth0 -o eth1 -m state --state NEW -j
> > > ACCEPT
> >
> > The above rule is a (tm) Really Bad Thing (tm)
> >         (basically allows everything into yer lan *ouch*)
>
> Indeed, you are witnessing further desperation after hours of
> scratching my head and muttering to myself.  :-)
>
> > > echo "   Do not respond to remote Pings."
> > > $IPTABLES -t filter -A INPUT -p icmp --icmp-type echo-request -j DROP
> >
> > Umm .. You *might* want to set this to deny ping requests from the
> > outside, rather than dropping them all .. .unless you don't trust users
> > on the inside. *grin*
>
> I'm not quite sure I follow here.  How does this affect users behind
> the firewall on the home LAN.

	There is no definition of the SOURCE that you want to drop ICMP echorequests 
from.  Thus this rule drops all ping echorequests.
	iptables -t filter -A INPUT -p icmp -i [internet pipe device] -icmp-type \ 
echo-request -j DROP  
 	will allow your LAN users to ping the box, but prevent pings from the 
internet from getting in.

	Really and truely -- Oskar's tutorials are great and easy to read... and even 
the sample firewalls there are decent enough to start with for a newbie.


	Alistair Tonner

>
> Thanks again for your thoughtful response.
> I'd hope you can spare some further time to respond.
>
> Mike

