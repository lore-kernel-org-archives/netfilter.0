From: saint <nagajuna@optushome.com.au>
Subject: Re: Consequences
Date: 04 Feb 2003 11:59:38 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044320378.9025.86.camel@juna.cypherworld.org>
References: <1044278051.9027.50.camel@juna.cypherworld.org>
	 <20030203130900.75c2bf9a.brblueser@uol.com.br>
	 <1044287458.9025.82.camel@juna.cypherworld.org>
	 <200302031326.03681.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302031326.03681.netfilter@newkirk.us>
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
To: netfilter@newkirk.us, Netfilter Mailing List <netfilter@lists.netfilter.org>

Thanks Joel: I have correctly set my paths.

On Tue, 2003-02-04 at 05:26, Joel Newkirk wrote:
> On Monday 03 February 2003 10:50 am, saint wrote:
> > There have been a number of problems that I have but I believed
> > it had nothing to do with syntax errors or any missing rules on
> > my behalf.
> > I'll have to sit back and study these problems taking into
> > consideration you recommendations ( and Ken's).
> > How far reaching I not sure yet but I will say that I have conflicting
> > chains-> different userdefined chains, default policy of DROP
> > (INPUT/OUTPUT/FORWARD/POST-PRE ROUTING/ MANGLE ) drops everything
> > as expected and remains dropping everthing eventhough I have the
> > service exlicitly and carefully enabled are just some of these
> > problems.
> 
> You should almost never have anything but ACCEPT policy on any mangle or 
> nat table chains.  Only filter-INPUT, filter-OUTPUT and  filter-FORWARD 
> chains should ever have policy settings other than ACCEPT.
> 
> The number one cause of problems such as the errors you reported is that 
> during startup the paths are NOT those you use in a console. 
> Specifically, you will usually need to explicitly use /sbin/ifconfig.
> 
>  If you use the SysV Init (/etc/init.d, /etc/rc5.d, etc) system to start 
> your firewall, which is probably what you want, you have to make sure 
> that your startups occur in a reasonable order, based on the Sxx 
> prefixes. You have to ensure that the iptables startup and the 
> activation of your external interface both take place before your 
> script.  Put your script in init.d and a link to it in rc3.d and/or 
> rc5.d named Sxx.firewall, where 'xx' is greater than 'xx' for iptables 
> and the script that brings up your interface (probably network). For my 
> system, I have iptables->network->ADSL->firewall. (I've always had 
> problems getting the ADSL interface up in the regular network startup, 
> so I added it's own startup script)  I have also modified the iptables 
> startup script to set default DROP policies for INPUT/OUTPUT/FORWARD, 
> where originally (RedHat) they were ACCEPT.
> 
> When I tried your ip-extraction command I got "addr:141.150.238.220" (my 
> dyn-ip for the last few days, since 10am Jan 29 actually) which would 
> not be a valid string to use in a rule.  In my script (I have a 
> semi-dynamic IP on a PPPoE connection) I successfully use:
> PPPIP=      \
> $(/sbin/ifconfig "$EXTIF" | grep inet | cut -d":" -f 2 | cut -d" " -f 1)
> 
> where I have $EXTIF already defined as "ppp0".  I also have a cron job 
> running every hour to test if the result of that command matches the IP 
> in use for SNAT, and replaces the SNAT rule if necessary.  (Yes, I could 
> use MASQUERADE but don't want to, and I track IP changes for other 
> purposes as well.)
> 
> j
> 
> > I don't know what's causing them because, as I have indicated, syntax
> > & everthing else is fine.  Ofcourse because I don't know I'm looking
> > for a possible scapegoat and initialisation + ifconfig stuff is one
> > thing I haven't comes to terms with yet -> so hence my suspicion that
> > other things could've been affected by this.
> >
> > Let you know though when I figure it out.  Personally I want to finish
> > it before my summer break -> then its back to uni.
> >
> > Santos
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
> > >
> > > saint <nagajuna@optushome.com.au> wrote:
> > > > I think I get it and I think you've just solve a nagging
> > > > problem that I have.  I have wrote my own script, took me awhile
> > > > though.
> > > >
> > > > And I think it does have (have been) some far-reaching
> > > > consequences.
> > > >
> > > > Thanks again.
> > > >
> > > > On Tue, 2003-02-04 at 01:44, Andre Costa wrote:
> > > > > Hi Santos,
> > > > >
> > > > > there has been a discussion about this a while ago on this ML, I
> > > > > am forwarding you the msg which has a nice proposal to solve
> > > > > this. Basically it involves:
> > > > >
> > > > > * writing your own fw script (e.g. your rc.firewall)
> > > > >
> > > > > * put a symlink to it on /etc/init.d *BEFORE* the iptables link
> > > > > there, so that your script is called first (this means prepeding
> > > > > the symlink name with a 'S-number' lower than the one associated
> > > > > to iptables startup script)
> > > > >
> > > > > Please notice that you might have to remove the initialization
> > > > > part of/etc/sysconfig/iptables and put it at the beginning of
> > > > > your rc.firewall script, otherwise iptables-restore might choke
> > > > > or you might even undo what you have done on rc.firewall (these
> > > > > are wild guesses, make sure you test it properly). I am talking
> > > > > about all rules like
> > > > >
> > > > > *filter
> > > > >
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
> > > > >
> > > > > saint <nagajuna@optushome.com.au> wrote:
> > > > > > Thank Andre:  that's makes sense. So what on Earth do I do
> > > > > > when my firewall reboots and I can't be sure of the IP
> > > > > > address? Could I put the rc.firewall script in /etc/rc.d/ ?
> > > > > > and have run at boot time from /etc/init.d/ ?
> > > > > > I'm using SuSE 8.1 and I can actually put a line in
> > > > > > /etc/init.d/boot.local that will execute my rc.firewall.
> > > > > >
> > > > > > Santo.
> > > > > > Happy to learn.
> 
> 


