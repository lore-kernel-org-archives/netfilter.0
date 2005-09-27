From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 12:42:07 -0400
Message-ID: <65aa6af905092709425857ae3b@mail.gmail.com>
References: <1127837987.2652.46.camel@localhost>
	<20050927163538.35781.qmail@web54713.mail.yahoo.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050927163538.35781.qmail@web54713.mail.yahoo.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Remove the UDP/port from the rule, that will allow you to PING the
box, and the inner box should respond.

Anyway, let's go to the basics... what is the output of

ifconfig
route -n

??

On 9/27/05, Alaios <alaios@yahoo.com> wrote:
> I have done absolutely what u have said.. I have
> rechecked the source port and destination and are the
> same.... The programme is a packet generator that
> creates bulk data. We use it to test oure network....
> I have applied your commands but with a little changes
> iptables -nat -A PREROUTING -i eth1 -d 143.233.222.77
> -p udp --destination-port 22453 -j DNAT
> --to-destination 10.2.4.1:22453
> My problem is that still i cant see any packages in
> the eth0 interface.. What know what else should i do
> now
>
> --- "John A. Sullivan III"
> <jsullivan@opensourcedevel.com> wrote:
>
> > It sounds like you really need to learn the basics.
> > I would suggest you
> > go through the links I mentioned below.  What
> > exactly do you want to do?
> >
> > It sounds like you want traffic coming in from
> > 143.233.222.253 on tcp
> > destination port 22453 (are you sure this is the
> > destination port and
> > not the source port?????) on the laptop interface
> > eth1 with IP address
> > 143.233.222.77 to be sent to 10.2.4.1 on the eth0
> > interface.  I am
> > assuming that 143.233.222.77 and 143.233.222.253 are
> > on the same
> > network, i.e., the subnet mask is 255.255.255.0 or
> > less.  I also
> > assuming that you have enabled forwarding as you
> > said you did.
> >
> > Then you would do something like:
> >
> > iptables -F
> > iptables -t nat -F
> > iptables -P FORWARD DROP
> > iptables -t nat -P ACCEPT
> > iptables -t nat -A PREROUTING -i eth1 -d
> > 143.233.222.77 --dport 22453 -j
> > DNAT --to-destination 10.2.4.1:22453
> > iptables -A FORWARD -m state --state
> > ESTABLISHED,RELATED -j ACCEPT
> > iptables -A FORWARD -s 143.233.222.253 -d 10.2.4.1
> > -p 6 --dport 22453 -j
> > ACCEPT
> >
> > I have a sneaking suspicion that 22453 is not the
> > destination port.
> > What service is 10.2.4.1 providing to
> > 143.233.222.253?
> >
> > I'm afraid I'm running out of time today.  I
> > probably cannot help much
> > more.  I'm sure someone else can jump in.  Take care
> > - John
> >
> > On Tue, 2005-09-27 at 08:40 -0700, Alaios wrote:
> > > My complete rule set??? Hm... there is nothing
> > like
> > > that... I work to a solution for 4-5 hours and
> > still
> > > havent finded any iptable rule to work.. in my pc
> > i
> > > dont have any ip rules loaded at all nor a
> > firewall
> > > applied.. I just want to do only this to work.. Do
> > u
> > > have anything else in mind plz?
> > >
> > > --- "John A. Sullivan III"
> > > <jsullivan@opensourcedevel.com> wrote:
> > >
> > > > I made some assumptions about other rules you
> > would
> > > > have had in place.
> > > > I believe someone else posted a much more
> > thorough
> > > > answer.  Did you
> > > > create an ESTABLISHED,RELATED rule as that other
> > > > post suggested?
> > > >
> > > > Would you mind posting your complete rule set
> > (with
> > > > any sensitive
> > > > information edited, of course)? - John
> > > >
> > > > On Tue, 2005-09-27 at 08:30 -0700, Alaios wrote:
> > > > > Thx for your quick reply..... i have just
> > tested
> > > > but
> > > > > it didnt work... I think that i cant explain
> > what
> > > > i
> > > > > need or i am doing sth wrong..
> > > > > i have enabled the packets loging
> > > > > so executing dmesg prints the following
> > > > > IN=3Deth1 OUT=3D MAC=3D(the mac addresses)
> > > > > As u can see the OUT is null which means thats
> > > > perhaps
> > > > > the problem... What do u have in mind?
> > > > >
> > > > > --- "John A. Sullivan III"
> > > > > <jsullivan@opensourcedevel.com> wrote:
> > > > >
> > > > > > On Tue, 2005-09-27 at 11:14 -0400, John A.
> > > > Sullivan
> > > > > > III wrote:
> > > > > > > On Tue, 2005-09-27 at 07:57 -0700, Alaios
> > > > wrote:
> > > > > > > > Hi plz take a look at the following
> > example
> > > > > > > >
> > > > > > > > The laptop has 2 ethernet interfaces
> > > > > > > > To eth1 comes traffic from src
> > > > 143.233.222.253
> > > > > > > > The eth0 has ip address 10.2.4.2 and it
> > is
> > > > > > connected
> > > > > > > > back to back with eth1 of other pc with
> > ip
> > > > > > address
> > > > > > > > 10.2.4.1
> > > > > > > > I want to forward the traffic with src
> > > > > > 143.233.222.253
> > > > > > > > to the 10.2.4.1 pc and if it works i
> > will
> > > > redo
> > > > > > this
> > > > > > > > for a second pc so as to l send the
> > traffic
> > > > to a
> > > > > > third
> > > > > > > > on.
> > > > > > > > Can u help me plz?
> > > > > > > >
> > > > > > > > I have tried this one
> > > > > > > > iptables -t nat -A PREROUTING -i eth1 -s
> > > > > > > > 143.233.222.253 -j DNAT --to-destination
> > > > > > 10.2.4.1
> > > > > > > > i have also set the
> > > > > > > > /proc/sys/net/ipv4/ip_forward to 1
> > > > > > > > but still i cant see any trafiic to eth0
> > > > > > interface (ip
> > > > > > > > 10.2.4.2)
> > > > > > > >
> > > > > > > >
> > > > > > > > I have also tested this one
> > > > > > > > iptables -t nat -A PREROUTING -p tcp -d
> > > > > > 143.233.222.77
> > > > > > > > (laptop eth1 card) --dport 22453 (i have
> > > > cheched
> > > > > > dst
> > > > > > > > port with tcpdump) 00 -j DNAT
> > > > --to-destination
> > > > > > > > 10.2.4.1
> > > > > > > > this still doesnt work
> > > > > > > > Every time i try to apply a new rule i
> > use
> > > > first
> > > > > > > > the iptables -F
> > > > > > > > iptables -t nat -F command
> > > > > > > <snip>
> > > > > > >
> > > > > > > I'm a little confused about what you are
> > > > doing.  I
> > > > > > would normally refer
> > > > > > > you to Oskar Andreasson's excellent
> > tutorial
> > > > at
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> > > > > > or the
> > > > > > > training slides on the ISCS web site
> > > > > > (http://iscs.sourceforge.net) but,
> > > > > > > since it appears that you have an
> > emergency,
> > > > here
> > > > > > goes:
> > > > > > >
> > > > > > > First, if the source is 143.233.222.253,
> > you
> > > > would
> > > > > > not want to DNAT it.
> > > > > > > DNAT changes the destination.  Thus, your
> > > > second
> > > > > > attempt is the correct
> > > > > > > one.  You might want to lock the
> > destination
> > > > port
> > > > > > - it's not likely to
> > > > > > > be a problem but, if it ever is, it will
> > be
> > > > one of
> > > > > > those really hard to
> > > > > > > diagnose, sporadic problems:
> > > > > > > -j DNAT --to-destination 10.2.4.1:22453
> > > > > > >
> > > > > > > Second, this only takes care of the
> > > > addressing.
> > > > > > You must still allow
> > > > > > > the traffic in the FORWARD chain of the
> > filter
> > > > > > table, e.g.,
> > > > > > >
> > > > > > > iptables -A FORWARD -d 10.2.4.1 -p 6
> > --dport
> > > > 22453
> > > > > > -j ACCEPT
> > > > > > >
> > > > > > > Hope this helps - John
> > > > > >
> > > > > > Oh, yes, you wanted to restrict the source
> > > > address.
> > > > > > Add that to your
> > > > > > filter table rule:
> > > > > > iptables -A FORWARD -s 143.233.222.253 -d
> > > > 10.2.4.1
> > > > > > -p 6 --dport 22453 -j
> > > > > > ACCEPT
> > > > > > --
> > > > > > John A. Sullivan III
> > > > > > Open Source Development Corporation
> > > > > > +1 207-985-7880
> > > > > > jsullivan@opensourcedevel.com
> > > > > >
> > > > > > If you would like to participate in the
> > > > development
> > > > > > of an open source
> > > > > > enterprise class network security management
> > > > system,
> > > > > > please visit
> > > > > > http://iscs.sourceforge.net
> > > > > >
> > > > > >
> > > > >
> > > > >
> > __________________________________________________
> > > > > Do You Yahoo!?
> > > > > Tired of spam?  Yahoo! Mail has the best spam
> > > > protection around
> > > > > http://mail.yahoo.com
> > > > --
> > > > John A. Sullivan III
> > > > Open Source Development Corporation
> > > > +1 207-985-7880
> > > > jsullivan@opensourcedevel.com
> > > >
> > > > Financially sustainable open source development
> > > > http://www.opensourcedevel.com
> > > >
> > > >
> > >
> > > __________________________________________________
> > > Do You Yahoo!?
> > > Tired of spam?  Yahoo! Mail has the best spam
> > protection around
> > > http://mail.yahoo.com
> > --
> > John A. Sullivan III
> > Open Source Development Corporation
> > +1 207-985-7880
> > jsullivan@opensourcedevel.com
> >
> > Financially sustainable open source development
> > http://www.opensourcedevel.com
> >
> >
>
>
>
>
> __________________________________
> Yahoo! Mail - PC Magazine Editors' Choice 2005
> http://mail.yahoo.com
>
>

