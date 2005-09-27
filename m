From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Plz i need help.... or i ll be fired :(
Date: Tue, 27 Sep 2005 11:46:47 -0400
Message-ID: <65aa6af905092708464042072d@mail.gmail.com>
References: <65aa6af905092708427ab4dbb1@mail.gmail.com>
	<20050927154321.68035.qmail@web54710.mail.yahoo.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050927154321.68035.qmail@web54710.mail.yahoo.com>
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

Are you gonna use the inner machine to "serve" the internet? say...
have a web server?

Use the rules I said before... plus these:

iptables -t nat -A PREROUTING -p tcp --dport 80 -d my-public-address
-j DNAT --to-destination the-inner-web-server

iptables -A FORWARD -i eth1 -o eth0 -p tcp --dport 80 -j ACCEPT

On 9/27/05, Alaios <alaios@yahoo.com> wrote:
> Hmm... i dont want to make the web work.... just to
> make my simple task to work
>
> --- Edmundo Carmona <eantoranz@gmail.com> wrote:
>
> > I would recommend to start over.
> >
> > Do this. On the "router" box do this:
> >
> > iptables -F
> > iptables -t nat -F
> >
> > iptables -P FORWARD DROP
> > iptables -P INPUT DROP
> >
> > iptables -A FORWARD -i eth0 -j ACCEPT
> > iptables -A FORWARD -m conntrack --ctstate
> > ESTABLISHED,RELATED -j ACCEPT
> >
> > iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
> >
> > echo 1 > /proc/sys/net/ipv4/ip_forward
> >
> > That should allow the "inner" machine to use the web
> > without a problem.
> >
> > On 9/27/05, Alaios <alaios@yahoo.com> wrote:
> > > Thx for your quick reply..... i have just tested
> > but
> > > it didnt work... I think that i cant explain what
> > i
> > > need or i am doing sth wrong..
> > > i have enabled the packets loging
> > > so executing dmesg prints the following
> > > IN=3Deth1 OUT=3D MAC=3D(the mac addresses)
> > > As u can see the OUT is null which means thats
> > perhaps
> > > the problem... What do u have in mind?
> > >
> > > --- "John A. Sullivan III"
> > > <jsullivan@opensourcedevel.com> wrote:
> > >
> > > > On Tue, 2005-09-27 at 11:14 -0400, John A.
> > Sullivan
> > > > III wrote:
> > > > > On Tue, 2005-09-27 at 07:57 -0700, Alaios
> > wrote:
> > > > > > Hi plz take a look at the following example
> > > > > >
> > > > > > The laptop has 2 ethernet interfaces
> > > > > > To eth1 comes traffic from src
> > 143.233.222.253
> > > > > > The eth0 has ip address 10.2.4.2 and it is
> > > > connected
> > > > > > back to back with eth1 of other pc with ip
> > > > address
> > > > > > 10.2.4.1
> > > > > > I want to forward the traffic with src
> > > > 143.233.222.253
> > > > > > to the 10.2.4.1 pc and if it works i will
> > redo
> > > > this
> > > > > > for a second pc so as to l send the traffic
> > to a
> > > > third
> > > > > > on.
> > > > > > Can u help me plz?
> > > > > >
> > > > > > I have tried this one
> > > > > > iptables -t nat -A PREROUTING -i eth1 -s
> > > > > > 143.233.222.253 -j DNAT --to-destination
> > > > 10.2.4.1
> > > > > > i have also set the
> > > > > > /proc/sys/net/ipv4/ip_forward to 1
> > > > > > but still i cant see any trafiic to eth0
> > > > interface (ip
> > > > > > 10.2.4.2)
> > > > > >
> > > > > >
> > > > > > I have also tested this one
> > > > > > iptables -t nat -A PREROUTING -p tcp -d
> > > > 143.233.222.77
> > > > > > (laptop eth1 card) --dport 22453 (i have
> > cheched
> > > > dst
> > > > > > port with tcpdump) 00 -j DNAT
> > --to-destination
> > > > > > 10.2.4.1
> > > > > > this still doesnt work
> > > > > > Every time i try to apply a new rule i use
> > first
> > > > > > the iptables -F
> > > > > > iptables -t nat -F command
> > > > > <snip>
> > > > >
> > > > > I'm a little confused about what you are
> > doing.  I
> > > > would normally refer
> > > > > you to Oskar Andreasson's excellent tutorial
> > at
> > > > >
> > > >
> > >
> >
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html
> > > > or the
> > > > > training slides on the ISCS web site
> > > > (http://iscs.sourceforge.net) but,
> > > > > since it appears that you have an emergency,
> > here
> > > > goes:
> > > > >
> > > > > First, if the source is 143.233.222.253, you
> > would
> > > > not want to DNAT it.
> > > > > DNAT changes the destination.  Thus, your
> > second
> > > > attempt is the correct
> > > > > one.  You might want to lock the destination
> > port
> > > > - it's not likely to
> > > > > be a problem but, if it ever is, it will be
> > one of
> > > > those really hard to
> > > > > diagnose, sporadic problems:
> > > > > -j DNAT --to-destination 10.2.4.1:22453
> > > > >
> > > > > Second, this only takes care of the
> > addressing.
> > > > You must still allow
> > > > > the traffic in the FORWARD chain of the filter
> > > > table, e.g.,
> > > > >
> > > > > iptables -A FORWARD -d 10.2.4.1 -p 6 --dport
> > 22453
> > > > -j ACCEPT
> > > > >
> > > > > Hope this helps - John
> > > >
> > > > Oh, yes, you wanted to restrict the source
> > address.
> > > > Add that to your
> > > > filter table rule:
> > > > iptables -A FORWARD -s 143.233.222.253 -d
> > 10.2.4.1
> > > > -p 6 --dport 22453 -j
> > > > ACCEPT
> > > > --
> > > > John A. Sullivan III
> > > > Open Source Development Corporation
> > > > +1 207-985-7880
> > > > jsullivan@opensourcedevel.com
> > > >
> > > > If you would like to participate in the
> > development
> > > > of an open source
> > > > enterprise class network security management
> > system,
> > > > please visit
> > > > http://iscs.sourceforge.net
> > > >
> > > >
> > >
> > >
> > > __________________________________________________
> > > Do You Yahoo!?
> > > Tired of spam?  Yahoo! Mail has the best spam
> > protection around
> > > http://mail.yahoo.com
> > >
> > >
> >
>
>
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
>

