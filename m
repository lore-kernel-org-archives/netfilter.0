From: saint <nagajuna@optushome.com.au>
Subject: RE: Consequences
Date: 04 Feb 2003 12:15:06 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044321306.9027.102.camel@juna.cypherworld.org>
References: <IMEDICLPAGAOCBLCCKLPIEDPENAA.netfilter@darrelldieringer.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <IMEDICLPAGAOCBLCCKLPIEDPENAA.netfilter@darrelldieringer.com>
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
To: Darrell Dieringer <netfilter@darrelldieringer.com>, Netfilter Mailing List <netfilter@lists.netfilter.org>


Thanks for the advice Darell:

Concerning PREROUTING/POST & MANGLE: the only rule that I have are:

# flsuh:
iptables -t nat --flush
iptables -t mangle --flush

# Policy:
iptables -t nat --policy PREROUTING DROP
iptables -t nat --policy OUTPUT DROP
iptables -t nat --policy POSTROUTING DROP
iptables -t mangle --policy PREROUTING DROP
iptables -t mnagle --policy OUTPUT DROP


Thats it.  the thing I just did (above) I learnt from reading "Linux
Firewalls" (RL Ziegler).  It said to be part of a DENY EVERYTHING by
default.  

However, I figured out AFTER going through all my rules for
INPUT/OUTPUT/FORWARD that it wasn't my rules at all, per say, that was
denying all sorts of services, like Internet access to the host & LAN,
SSD, DNS just to mention some common ones. 

What I ended up figuring out AFTER conceptually tracing
PREROUTING,POSTROUTING, etc... i.e the rules above, that if I didn't set
them to ACCEPT nothing gets anywhere in the first place.

So I set them to ACCEPT and all services were restored.  The only thing
is I worry about some packets escaping to the end of the chain and gets
accepted by default.

Everyones comments and suggestions have been helpful and I welcome more
anytime. 

Santos.
I love lively brain powered discussions.
  






On Tue, 2003-02-04 at 04:57, Darrell Dieringer wrote:
> Hello,
> 
> It has been quite awhile since I first set up my rules, so be advised
> that my suggestions may be a bit off (and subject to correction by
> others, of course)...
> 
> As a general rule, you should not do any packet filtering in
> PREROUTING / POSTROUTING / MANGLE.  Those chains are for things like
> SNAT / DNAT and a variety of other manipulations.  You should only be
> dropping traffic in INPUT / OUTPUT / FORWARD (and your user-defined
> filter table chains).
> 
> I remember having the same problem as you, and I'm pretty sure it was
> because I originally tried to use a default DROP policy on
> PRE/POSTROUTING & MANGLE.  Unless you duplicate all of your INPUT /
> FORWARD rules in PREROUTING, the incoming traffic you wish to permit
> will match the default DROP policy there (and subsequently die) before
> it ever gets to the filter table.  Same is true for your OUTPUT rules.
> 
> I hope this helped.
> 
> If you post your rules, I'm sure someone will advise you of the
> precise problem.
> 
> Darrell Dieringer - Madison, WI
> 
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org
> > [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of saint
> > Sent: Monday, February 03, 2003 9:51 AM
> > To: Andre Costa; Netfilter Mailing List
> > Subject: Consequences
> >
> >
> > There have been a number of problems that I have but I believed
> > it had nothing to do with syntax errors or any missing rules on
> > my behalf.
> > I'll have to sit back and study these problems taking into
> > consideration you recommendations ( and Ken's).
> > How far reaching I not sure yet but I will say that I have
> > conflicting
> > chains-> different userdefined chains, default policy of DROP
> > (INPUT/OUTPUT/FORWARD/POST-PRE ROUTING/ MANGLE ) drops everything
> > as expected and remains dropping everthing eventhough I
> > have the service
> > exlicitly and carefully enabled are just some of these problems.
> >
> > I don't know what's causing them because, as I have
> > indicated, syntax &
> > everthing else is fine.  Ofcourse because I don't know I'm
> > looking for a
> > possible scapegoat and initialisation + ifconfig stuff is
> > one thing I
> > haven't comes to terms with yet -> so hence my suspicion that other
> > things could've been affected by this.
> >
> > Let you know though when I figure it out.  Personally I
> > want to finish
> > it before my summer break -> then its back to uni.
> >
> > Santos
> >
> >
> > On Tue, 2003-02-04 at 02:09, Andre Costa wrote:
> > > You're welcome, Santos, I am glad I could be of help =)
> > >
> > > I am curious: what kind of "far-reaching consequences"? Could you
> > > please ellaborate?
> > >
> > > Happy firewalling ;)
> > >
> > > Andre
> > >
> > > On 04 Feb 2003 01:58:35 +1100
> > > saint <nagajuna@optushome.com.au> wrote:
> > >
> > > > I think I get it and I think you've just solve a nagging
> > > > problem that I have.  I have wrote my own script, took me awhile
> > > > though.
> > > >
> > > > And I think it does have (have been) some far-reaching
> > consequences.
> > > >
> > > > Thanks again.
> > > >
> > > >
> > > > On Tue, 2003-02-04 at 01:44, Andre Costa wrote:
> > > > > Hi Santos,
> > > > >
> > > > > there has been a discussion about this a while ago on
> > this ML, I am
> > > > > forwarding you the msg which has a nice proposal to
> > solve this.
> > > > > Basically it involves:
> > > > >
> > > > > * writing your own fw script (e.g. your rc.firewall)
> > > > >
> > > > > * put a symlink to it on /etc/init.d *BEFORE* the
> > iptables link
> > > > > there, so that your script is called first (this
> > means prepeding the
> > > > > symlink name with a 'S-number' lower than the one
> > associated to
> > > > > iptables startup script)
> > > > >
> > > > > Please notice that you might have to remove the
> > initialization part
> > > > > of/etc/sysconfig/iptables and put it at the beginning of your
> > > > > rc.firewall script, otherwise iptables-restore might
> > choke or you
> > > > > might even undo what you have done on rc.firewall
> > (these are wild
> > > > > guesses, make sure you test it properly). I am
> > talking about all
> > > > > rules like
> > > > >
> > > > > *filter
> > > > > :FORWARD DROP [0:0]
> > > > > :INPUT DROP [0:0]
> > > > > :OUTPUT ACCEPT [0:0]
> > > > >
> > > > > at the top of /etc/sysconfig/iptables
> > > > >
> > > > > HTH
> > > > >
> > > > > Andre
> > > > >
> > > > > On 04 Feb 2003 01:16:37 +1100
> > > > > saint <nagajuna@optushome.com.au> wrote:
> > > > >
> > > > > > Thank Andre:  that's makes sense. So what on Earth do I do
> > > > > > when my firewall reboots and I can't be sure of the
> > IP address?
> > > > > > Could I put the rc.firewall script in /etc/rc.d/ ?
> > and have run at
> > > > > > boot time from /etc/init.d/ ?
> > > > > > I'm using SuSE 8.1 and I can actually put a line in
> > > > > > /etc/init.d/boot.local that will execute my rc.firewall.
> > > > > >
> > > > > > Santo.
> > > > > > Happy to learn.
> > > >
> > >
> >
> >
> >
> 
> 


