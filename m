From: Nick Taylor <nickt@lightlink.com>
Subject: Re: bind 9 and iptables
Date: Fri, 27 Aug 2004 17:02:51 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0408271654340.28191@adore.lightlink.com>
References: <web-420492681@mail01.infosat.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-420492681@mail01.infosat.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: it clown <suse@mailbox.co.za>
Cc: netfilter@lists.netfilter.org

Okay.  Now I will assume that "forwarding" means satisfying a DNS query
recursively, ie the firwall box will generate a NEW query (with the same
request in it), and a conversation will start between the firewall and the
DNS server at your ISP.  When the answer comes back, it will be cached,
and a reply will be formed to the client.  In this case, the client talks
directly to the firewall, NOT the ISP's DNS server...

So, you want:

iptables -A INPUT ...

in order to allow the clients to connect to your machine.  A few other
people have suggested specific rules to accomplish this, but in the
simplest form,

iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
is what you're missing.

Please note that this rule isn't specific enough, but there may be reasons
why your site would chose to implement a more specific rule differently
than I would.  I would constrain the DNS service to packets entering the
firewall on the "lan" side, and to source addresses within the network I
was expecting them from, like this:

iptables -A INPUT -p tcp --dport 53 -i eth0 -s 192.168.1.0/24 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -i eth0 -s 192.168.1.0/24 -j ACCEPT


I didn't see any -A INPUT -j ACCEPT rules at all in your sample code.
If there were some that don't seem to be matching, and they just didn't
get forwarded to the list, please post these so we can figure out why
they're not matching as intended.

On Fri, 27 Aug 2004, it clown wrote:

> Date: Fri, 27 Aug 2004 22:53:10 +0200
> From: it clown <suse@mailbox.co.za>
> To: netfilter@lists.netfilter.org
> Subject: Re: bind 9 and iptables
>
> OK i will try again.
>
> I have a internal dns server with a forwarder to my isp.The
> internal dns server is on the iptables box.The clients use
> the internal dns server to resolve names on the local
> network.When the internal dns cannot resolve a name it
> forwards to my isp's dns.
>
> So my problem is with the forwarding.To get that to work i
> have to uncomment:
>
> iptables -P INPUT DROP and iptables -P OUTPUT DROP.
>
> When i uncomment those two rules the clients can browse the
> internet.
>
> what rules can i use instead of uncommenting those two
> rules because thats not secure?
>
> I hope this makes more sense, thanks.
>
> Regards
>
> On Fri, 27 Aug 2004 16:19:59 -0400 (EDT)
>  Nick Taylor <nickt@lightlink.com> wrote:
> > Your question isn't really specific enough to be sure
> > what's going on, but
> > I'm assuming that on your firewall box, the rules you
> > present allow DNS
> > queries to work, but that on clients behind the firewall,
> > DNS still fails,
> > and furthermore that you have the clients set up to use a
> > DNS server on
> > the outside of your firewall.  If this is the case, try:
> >
> > iptables -A FORWARD ...
> >
> > Remember, the input and output chains are only for
> > traffic with a LOCAL
> > source or destination (same computer as firewall),
> > whereas forward is for
> > traffic that goes through the firewall computer.
> >
> >
> >  On Fri, 27 Aug 2004, it clown wrote:
> >
> > > Date: Fri, 27 Aug 2004 22:06:00 +0200
> > > From: it clown <suse@mailbox.co.za>
> > > To: netfilter@lists.netfilter.org
> > > Subject: bind 9 and iptables
> > >
> > > Hi All
> > >
> > > I have a dns with a forwarder to my isp on the iptables
> > > box. I am having trouble on getting dns to work
> > properly.
> > >
> > > When i comment:
> > >
> > > iptables -P INPUT DROP
> > > iptables -p OUTPUT DROP
> > >
> > > DNS will work fine and all the pc's can browse the net.
> > >
> > > I have tried the following with out any luck:
> > >
> > > iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> > > iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> > > iptables -A INPUT -m state --state ESTABLISHED,RELATED
> > -j
> > > ACCEPT
> > >
> > > what rule do i need to add to make things more secure
> > to
> > > get my dns working properly, thanks?
> > >
> > > Regards
> > >
> > >
> > >
> >
> _____________________________________________________________________
> > > For super low premiums ,click here
> > http://www.dialdirect.co.za/quote
> > >
>
> _____________________________________________________________________
> For super low premiums ,click here http://www.dialdirect.co.za/quote
>

