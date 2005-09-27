From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 13:15:11 -0400
Message-ID: <1127841311.2652.54.camel@localhost>
References: <65aa6af905092709425857ae3b@mail.gmail.com>
	<20050927165239.40193.qmail@web54713.mail.yahoo.com>
	<65aa6af905092709593478dc29@mail.gmail.com>
	<65aa6af905092710089d2d9ab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af905092710089d2d9ab@mail.gmail.com>
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
To: Edmundo Carmona <eantoranz@gmail.com>
Cc: netfilter@lists.netfilter.org

It won't respond if eth1 doesn't know how to get to ahost.  It looks
like the subnet mask on eth1 is 255.255.255.192.  That means it know
about addresses .64 to .127.  Unless it has a default gateway which
knows how to get to .253, it will drop the packet because of a routing
issue and not a netfilter issue - John

On Tue, 2005-09-27 at 13:08 -0400, Edmundo Carmona wrote:
> Let's retry.
> 
> ahost: 143.233.222.253  | eth1:143.233.222.77 box1 eth0:10.2.4.1 |
> eth0:10.2.4.2 box2
> 
> Is that correct? You want the traffic from ahost to reach box2, right?
> 
> Please.... (I beg you :'() try this on box1 (don't change it... it's
> just a test):
> 
> iptables -t nat -F
> iptables -F
> 
> iptables -P FORWARD ACCEPT
> 
> iptables -t nat -A PREROUTING -s 143.233.222.253 -j DNAT
> --to-destination 10.2.4.2
> 
> echo 1 > /blah/blah
> 
> Then ping box1 from ahost. It should respond.... but it should have
> been box2 the one that responded (as a matter of fact).
> 
> Am I correct?
> 
> On 9/27/05, Edmundo Carmona <eantoranz@gmail.com> wrote:
> > Look at the IP of eth0. its 10.2.4.1, and you said it was 10.2.4.2 and
> > wanted to forward it to another host with ip 10.2.4.1 (according to
> > your very first mail).
> >
> > On 9/27/05, Alaios <alaios@yahoo.com> wrote:
> > > eth0      Link encap:Ethernet  HWaddr
> > > 00:02:3F:6D:70:3E
> > >           inet addr:10.2.4.1  Bcast:10.255.255.255
> > > Mask:255.0.0.0
> > >           inet6 addr: fe80::202:3fff:fe6d:703e/64
> > > Scope:Link
> > >           UP BROADCAST RUNNING MULTICAST  MTU:1500
> > > Metric:1
> > >           RX packets:3 errors:0 dropped:0 overruns:0
> > > frame:0
> > >           TX packets:394 errors:0 dropped:0 overruns:0
> > > carrier:0
> > >           collisions:0 txqueuelen:1000
> > >           RX bytes:218 (218.0 b)  TX bytes:24983 (24.3
> > > Kb)
> > >           Interrupt:11 Base address:0x6800
> > >
> > > eth1      Link encap:Ethernet  HWaddr
> > > 00:02:2D:3B:1D:96
> > >           inet addr:143.233.222.77
> > > Bcast:255.255.255.255  Mask:255.255.255.192
> > >           inet6 addr: fe80::202:2dff:fe3b:1d96/64
> > > Scope:Link
> > >           UP BROADCAST NOTRAILERS RUNNING MULTICAST
> > > MTU:1500  Metric:1
> > >           RX packets:293209 errors:0 dropped:0
> > > overruns:0 frame:0
> > >           TX packets:74 errors:0 dropped:0 overruns:0
> > > carrier:0
> > >           collisions:0 txqueuelen:1000
> > >           RX bytes:364527709 (347.6 Mb)  TX
> > > bytes:19400 (18.9 Kb)
> > >           Interrupt:3 Base address:0x100
> > >
> > > lo        Link encap:Local Loopback
> > >           inet addr:127.0.0.1  Mask:255.0.0.0
> > >           inet6 addr: ::1/128 Scope:Host
> > >           UP LOOPBACK RUNNING  MTU:16436  Metric:1
> > >           RX packets:54 errors:0 dropped:0 overruns:0
> > > frame:0
> > >           TX packets:54 errors:0 dropped:0 overruns:0
> > > carrier:0
> > >           collisions:0 txqueuelen:0
> > >           RX bytes:3528 (3.4 Kb)  TX bytes:3528 (3.4
> > > Kb)
> > >
> > > Kernel IP routing table
> > > Destination     Gateway         Genmask         Flags
> > > Metric Ref    Use Iface
> > > 143.233.222.64  0.0.0.0         255.255.255.192 U
> > > 0      0        0 eth1
> > > 10.0.0.0        0.0.0.0         255.0.0.0       U
> > > 0      0        0 eth0
> > > 127.0.0.0       0.0.0.0         255.0.0.0       U
> > > 0      0        0 lo
> > >
> > >
> > >
> > > --- Edmundo Carmona <eantoranz@gmail.com> wrote:
> > >
> > > > Remove the UDP/port from the rule, that will allow
> > > > you to PING the
> > > > box, and the inner box should respond.
> > > >
> > > > Anyway, let's go to the basics... what is the output
> > > > of
> > > >
> > > > ifconfig
> > > > route -n
> > > >
> > > > ??
> > > >
> > > > On 9/27/05, Alaios <alaios@yahoo.com> wrote:
> > > > > I have done absolutely what u have said.. I have
> > > > > rechecked the source port and destination and are
> > > > the
> > > > > same.... The programme is a packet generator that
> > > > > creates bulk data. We use it to test oure
> > > > network....
> > > > > I have applied your commands but with a little
> > > > changes
> > > > > iptables -nat -A PREROUTING -i eth1 -d
> > > > 143.233.222.77
> > > > > -p udp --destination-port 22453 -j DNAT
> > > > > --to-destination 10.2.4.1:22453
> > > > > My problem is that still i cant see any packages
> > > > in
> > > > > the eth0 interface.. What know what else should i
> > > > do
> > > > > now
> > > > >
> > > > > --- "John A. Sullivan III"
> > > > > <jsullivan@opensourcedevel.com> wrote:
> > > > >
> > > > > > It sounds like you really need to learn the
> > > > basics.
> > > > > > I would suggest you
> > > > > > go through the links I mentioned below.  What
> > > > > > exactly do you want to do?
> > > > > >
> > > > > > It sounds like you want traffic coming in from
> > > > > > 143.233.222.253 on tcp
> > > > > > destination port 22453 (are you sure this is the
> > > > > > destination port and
> > > > > > not the source port?????) on the laptop
> > > > interface
> > > > > > eth1 with IP address
> > > > > > 143.233.222.77 to be sent to 10.2.4.1 on the
> > > > eth0
> > > > > > interface.  I am
> > > > > > assuming that 143.233.222.77 and 143.233.222.253
> > > > are
> > > > > > on the same
> > > > > > network, i.e., the subnet mask is 255.255.255.0
> > > > or
> > > > > > less.  I also
> > > > > > assuming that you have enabled forwarding as you
> > > > > > said you did.
> > > > > >
> > > > > > Then you would do something like:
> > > > > >
> > > > > > iptables -F
> > > > > > iptables -t nat -F
> > > > > > iptables -P FORWARD DROP
> > > > > > iptables -t nat -P ACCEPT
> > > > > > iptables -t nat -A PREROUTING -i eth1 -d
> > > > > > 143.233.222.77 --dport 22453 -j
> > > > > > DNAT --to-destination 10.2.4.1:22453
> > > > > > iptables -A FORWARD -m state --state
> > > > > > ESTABLISHED,RELATED -j ACCEPT
> > > > > > iptables -A FORWARD -s 143.233.222.253 -d
> > > > 10.2.4.1
> > > > > > -p 6 --dport 22453 -j
> > > > > > ACCEPT
> > > > > >
> > > > > > I have a sneaking suspicion that 22453 is not
> > > > the
> > > > > > destination port.
> > > > > > What service is 10.2.4.1 providing to
> > > > > > 143.233.222.253?
> > > > > >
> > > > > > I'm afraid I'm running out of time today.  I
> > > > > > probably cannot help much
> > > > > > more.  I'm sure someone else can jump in.  Take
> > > > care
> > > > > > - John
> > > > > >
> > > > > > On Tue, 2005-09-27 at 08:40 -0700, Alaios wrote:
> > > > > > > My complete rule set??? Hm... there is nothing
> > > > > > like
> > > > > > > that... I work to a solution for 4-5 hours and
> > > > > > still
> > > > > > > havent finded any iptable rule to work.. in my
> > > > pc
> > > > > > i
> > > > > > > dont have any ip rules loaded at all nor a
> > > > > > firewall
> > > > > > > applied.. I just want to do only this to
> > > > work.. Do
> > > > > > u
> > > > > > > have anything else in mind plz?
> > > > > > >
> > > > > > > --- "John A. Sullivan III"
> > > > > > > <jsullivan@opensourcedevel.com> wrote:
> > > > > > >
> > > > > > > > I made some assumptions about other rules
> > > > you
> > > > > > would
> > > > > > > > have had in place.
> > > > > > > > I believe someone else posted a much more
> > > > > > thorough
> > > > > > > > answer.  Did you
> > > > > > > > create an ESTABLISHED,RELATED rule as that
> > > > other
> > > > > > > > post suggested?
> > > > > > > >
> > > > > > > > Would you mind posting your complete rule
> > > > set
> > > > > > (with
> > > > > > > > any sensitive
> > > > > > > > information edited, of course)? - John
> > > > > > > >
> > > > > > > > On Tue, 2005-09-27 at 08:30 -0700, Alaios
> > > > wrote:
> > > > > > > > > Thx for your quick reply..... i have just
> > > > > > tested
> > > > > > > > but
> > > > > > > > > it didnt work... I think that i cant
> > > > explain
> > > > > > what
> > > > > > > > i
> > > > > > > > > need or i am doing sth wrong..
> > > > > > > > > i have enabled the packets loging
> > > > > > > > > so executing dmesg prints the following
> > > > > > > > > IN=eth1 OUT= MAC=(the mac addresses)
> > > > > > > > > As u can see the OUT is null which means
> > > > thats
> > > > > > > > perhaps
> > > > > > > > > the problem... What do u have in mind?
> > > > > > > > >
> > > > > > > > > --- "John A. Sullivan III"
> > > > > > > > > <jsullivan@opensourcedevel.com> wrote:
> > > > > > > > >
> > > > > > > > > > On Tue, 2005-09-27 at 11:14 -0400, John
> > > > A.
> > > > > > > > Sullivan
> > > > > > > > > > III wrote:
> > > > > > > > > > > On Tue, 2005-09-27 at 07:57 -0700,
> > > > Alaios
> > > > > > > > wrote:
> > > > > > > > > > > > Hi plz take a look at the following
> > > > > > example
> > > > > > > > > > > >
> > > > > > > > > > > > The laptop has 2 ethernet interfaces
> > > > > > > > > > > > To eth1 comes traffic from src
> > > > > > > > 143.233.222.253
> > > > > > > > > > > > The eth0 has ip address 10.2.4.2 and
> > > > it
> > > > > > is
> > > > > > > > > > connected
> > > > > > > > > > > > back to back with eth1 of other pc
> > > > with
> > > > > > ip
> > > > > > > > > > address
> > > > > > > > > > > > 10.2.4.1
> > > > > > > > > > > > I want to forward the traffic with
> > > > src
> > > > > > > > > > 143.233.222.253
> > > > > > > > > > > > to the 10.2.4.1 pc and if it works i
> > > > > > will
> > > > > > > > redo
> > > > > > > > > > this
> > > > > > > > > > > > for a second pc so as to l send the
> > > > > > traffic
> > > > > > > > to a
> > > > > > > > > > third
> > > > > > > > > > > > on.
> > > > > > > > > > > > Can u help me plz?
> > > > > > > > > > > >
> > > > > > > > > > > > I have tried this one
> > > > > > > > > > > > iptables -t nat -A PREROUTING -i
> > > > eth1 -s
> > > > > > > > > > > > 143.233.222.253 -j DNAT
> > > > --to-destination
> > > > > > > > > > 10.2.4.1
> > > > > > > > > > > > i have also set the
> > > > > > > > > > > > /proc/sys/net/ipv4/ip_forward to 1
> > > > > > > > > > > > but still i cant see any trafiic to
> > > > eth0
> > > > > > > > > > interface (ip
> > > > > > > > > > > > 10.2.4.2)
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > I have also tested this one
> > > > > > > > > > > > iptables -t nat -A PREROUTING -p tcp
> > > > -d
> > > > > > > > > > 143.233.222.77
> > > > > > > > > > > > (laptop eth1 card) --dport 22453 (i
> > > > have
> > > > > > > > cheched
> > > > > > > > > > dst
> > > > > > > > > > > > port with tcpdump) 00 -j DNAT
> > > > > > > > --to-destination
> > > > > > > > > > > > 10.2.4.1
> > > > > > > > > > > > this still doesnt work
> > > > > > > > > > > > Every time i try to apply a new rule
> > > > i
> > > > > > use
> > > > > > > > first
> > > > > > > > > > > > the iptables -F
> > > > > > > > > > > > iptables -t nat -F command
> > > > > > > > > > > <snip>
> > > > > > > > > > >
> > > > > > > > > > > I'm a little confused about what you
> > > > are
> > > > > > > > doing.  I
> > > > > > > > > > would normally refer
> > > > > > > > > > > you to Oskar Andreasson's excellent
> > > > > > tutorial
> > > > > > > > at
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > >
> > > >
> > > http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> > > > > > > > > > or the
> > > > > > > > > > > training slides on the ISCS web site
> > > > > > > > > > (http://iscs.sourceforge.net) but,
> > > > > > > > > > > since it appears that you have an
> > > > > > emergency,
> > > > > > > > here
> > > > > > > > > > goes:
> > > > > > > > > > >
> > > > > > > > > > > First, if the source is
> > > > 143.233.222.253,
> > > > > > you
> > > > > > > > would
> > > > > > > > > > not want to DNAT it.
> > > > > > > > > > > DNAT changes the destination.  Thus,
> > > > your
> > > > > > > > second
> > > > > > > > > > attempt is the correct
> > > > > > > > > > > one.  You might want to lock the
> > > > > > destination
> > > > > > > > port
> > > > > > > > > > - it's not likely to
> > > > > > > > > > > be a problem but, if it ever is, it
> > > > will
> > > > > > be
> > > > > > > > one of
> > > > > > > > > > those really hard to
> > > > > > > > > > > diagnose, sporadic problems:
> > > > > > > > > > > -j DNAT --to-destination
> > > > 10.2.4.1:22453
> > > > > > > > > > >
> > > > > > > > > > > Second, this only takes care of the
> > > > > > > > addressing.
> > > > > > > > > > You must still allow
> > > > > > > > > > > the traffic in the FORWARD chain of
> > > > the
> > > > > > filter
> > > > > > > > > > table, e.g.,
> > > > > > > > > > >
> > > > > > > > > > > iptables -A FORWARD -d 10.2.4.1 -p 6
> > > > > > --dport
> > > > > > > > 22453
> > > > > > > > > > -j ACCEPT
> > > > > > > > > > >
> > > > > > > > > > > Hope this helps - John
> > > > > > > > > >
> > > > > > > > > > Oh, yes, you wanted to restrict the
> > > > source
> > > > > > > > address.
> > > > > > > > > > Add that to your
> > > > > > > > > > filter table rule:
> > > > > > > > > > iptables -A FORWARD -s 143.233.222.253
> > > > -d
> > > > > > > > 10.2.4.1
> > > > > > > > > > -p 6 --dport 22453 -j
> > > > > > > > > > ACCEPT
> > > > > > > > > > --
> > > > > > > > > > John A. Sullivan III
> > > > > > > > > > Open Source Development Corporation
> > > > > > > > > > +1 207-985-7880
> > > > > > > > > > jsullivan@opensourcedevel.com
> > > > > > > > > >
> > > > > > > > > > If you would like to participate in the
> > > > > > > > development
> > > > > > > > > > of an open source
> > > > > > > > > > enterprise class network security
> > > > management
> > > > > > > > system,
> > > > > > > > > > please visit
> > > > > > > > > > http://iscs.sourceforge.net
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > >
> > > > __________________________________________________
> > > > > > > > > Do You Yahoo!?
> > > > > > > > > Tired of spam?  Yahoo! Mail has the best
> > > > spam
> > > > > > > > protection around
> > > > > > > > > http://mail.yahoo.com
> > > > > > > > --
> > > > > > > > John A. Sullivan III
> > > > > > > > Open Source Development Corporation
> > > > > > > > +1 207-985-7880
> > > > > > > > jsullivan@opensourcedevel.com
> > > > > > > >
> > > > > > > > Financially sustainable open source
> > > > development
> > > > > > > > http://www.opensourcedevel.com
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > __________________________________________________
> > > > > > > Do You Yahoo!?
> > > > > > > Tired of spam?  Yahoo! Mail has the best spam
> > > > > > protection around
> > > > > > > http://mail.yahoo.com
> > > > > > --
> > > > > > John A. Sullivan III
> > > > > > Open Source Development Corporation
> > > > > > +1 207-985-7880
> > > > > > jsullivan@opensourcedevel.com
> > > > > >
> > > > > > Financially sustainable open source development
> > > > > > http://www.opensourcedevel.com
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > __________________________________
> > > > > Yahoo! Mail - PC Magazine Editors' Choice 2005
> > > > > http://mail.yahoo.com
> > > > >
> > > > >
> > > >
> > > >
> > >
> > >
> > >
> > >
> > > __________________________________
> > > Yahoo! Mail - PC Magazine Editors' Choice 2005
> > > http://mail.yahoo.com
> > >
> >
> 
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


