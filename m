From: Javier Govea <jgovea@magma.ca>
Subject: RE: Round Robin Load Balancing
Date: Wed, 23 Jul 2003 20:58:32 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307240058.h6O0wW1R002030@webmail2.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Thanx to all of you guys for all ur help. (I just replied one of ur last emails and i
think i sent it by mistake like 3 times to some of you guys, my apologies for
that...sorry, it was a mistake)

I think Nth is what i've been looking for, but i need to test it first. I'm getting a
problem when i use my own compiled version of iptables (even without the Nth patch). My
LAN is not accessing internet, i think traffic is not being masqueraded but i don't know
why. Any ideas on why my compiled verion does not work?? and the redhat version does work????

Here are two problems i found:

1. "depmod -a" is giving this message  (i'm showing only one message, but i'm getting the
same thing for all iptables modules): 

depmod: *** Unresolved symbols in
/lib/modules/2.4.20-8/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o

how do i fix this????????

2. "modprobe ipt_MASQUERADE" is giving me an error (all other iptables modules seems to be
working without a problem):

modprobe: Too deep recursion in module dependencies!
modprobe: Circular dependency? ip_nat_core ip_nat_proto_udp ip_conntrack ip_tables
ipt_MASQUERADE
Aborted (core dumped)

how do i fix this??????

Finally, I actually don't know if any of my two previous errors are my problem. The
iptables that comes with redhat gives me the same error i'm describing in 2. But if i
insert the redhat module with "insmod" then my LAN can access internet. If i insert my own
compiled module I still cannot access the net. 

I'm also getting the same problem i'm describing in 1 with an NTFS module i compiled. But
my NTFS module is working properly. so...i'm all confused...where else can i look to find
my problem?????.....please any help is very much appreciated...

Thanx to all of you guys..
X


> It's the NTH patch. he he p-o-m.. 
> 
> Thanks,
> ____________________________________________
> George Vieira 
>
> 
> There is an extension that says something like every N packets, execute
> this rule. I forgot what it was called though.. *doh*
> 
> Try looking back ~ 1 month ago. I know I saw it there somewhere.
> 
> -----Original Message-----
> From: Javier Govea [mailto:jgovea@magma.ca] 
> Sent: Thursday, July 17, 2003 1:30 PM
> To: Ramin Dousti; Daniel Chemko
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Round Robin Load Balancing
> 
> I undesrtand what you mean about perfect load balancing (i'm not
> actually looking for a
> perfect load balancer) I have two examples below, but first i will
> responde some of the
> questions.
> 
> > Do these two ppp accounts belong to the same ISP? 
> Yes. I have four accounts, all of them with the same ISP
> >Does the ISP drop forign src?
> ?????
> > Is the gateway doing nat? 
> Yes, im using iptables to setup the nat
> > Do you have any preference on one of the ppp's than the other? 
> No
> >Can you bond (mppp)?
> I haven't tried multilink ppp...i will look into this...
> 
> > You could also setup something like BGP to allow multiple routes
> to....
> I don't know if this would be the best approach. I already tried to
> setup BGP and OSPF 
> routes using zebra (<a href='http://zebra.org'>http://zebra.org</a>) and i never made it
work....
> I found a tool called EQLPlus
> (<a
href='http://www.cwareco.com/download/eqlplus.html'>http://www.cwareco.com/download/eqlplus.html</a>)
but i was
> never able to compile it. Has anybody has tried eqlplus before???????
> 
> > If one user makes a request out of line X then the return packet HAS
> to come back      
>  > through line X. So, if one guy sends a huge request taking minutes to
> fulfill, he / she
> > will tie up the line until the job is finished
> 
> Absolutely. I can live with that, but here is my problem. I have 4 ppp
> links on my router
> (which is doing nat). Then if in a host, located in my LAN which
> connected to my router, i
> open four browsers and each browser is pointing to the same site then
> i'm expepecting each
> web page to be requested and returned in a different link. But that
> doesn't happen. Some
> times it does happen but most of the time i get three of the responses
> on one link, one in
> another and the other two links do nothing. Sometimes i get 2,1,1,0 ....
> 
> I did another test...i have website with has in its main web page has
> only 4 images
> (differnt images but all of them of exactely the same size). if i point
> my browser to that
> site, then i'm believe the browser is sending four http requests (one
> for each image),
> well i would expect one image on each link....but again sometimes i get
> the four images on
> the same link...some times i get 2 images in one link...
> 
> So, i don't want a perfect load balancer but i would like to fix the
> problems on my two
> examples... i thought about implementing a round robin algorithm for
> load balancing where
> my first request goes on my first available link, the second one on the
> second available
> link and so on....this idea fixes my problems in my two previous
> examples, but i'm open to
> suggestions....
> 
> any tips, pointer, ideas are all welcome...
> 
> cheers...
> X
> 
> 
> 
> > Absolutely. Perfect load balancing needs to be coordinated on _all_
> the
> > endpoints of the links involved. In this case, 4 endpoints.
> > 
> > For a regular load balancing (which is going to be the case here)
> > we still have lots of unknown variables. Do these two ppp
> > accounts belong to the same ISP? Does the ISP drop forign src?
> > Is the gateway doing nat? Do you have any preference on one of
> > the ppp's than the other? Can you bond (mppp)? And so on.
> > But a fun project, though, for someone who has time...
> > 
> > Ramin
> > 
> > On Tue, Jul 15, 2003 at 12:44:40PM -0700, Daniel Chemko wrote:
> > 
> > > Because of the nature of your setup, you cannot have a perfect equal
> > > load balance setup. This is because you cannot control the inbound
> flow
> > > of data. If one user makes a request out of line X then the return
> > > packet HAS to come back through line X. So, if one guy sends a huge
> > > request taking minutes to fulfill, he / she will tie up the line
> until
> > > the job is finished. The load balancer should be smart enough to not
> > > send any more requests to that line, but you are still seeing the
> line
> > > being monopolized by this single connection, hence it is not
> balanced
> > > over all lines equally.
> > > 
> > > In order to have fair balancing of all lines, I think you need to
> set up
> > > a deal with your ISP to load balance on their end as well.
> > > 
> > > You could also setup something like BGP to allow multiple routes to
> the
> > > same return address, but I am not familiar enough with BGP to be
> much
> > > help in this area. In all likelihood, you are better off with your
> > > current solution or maybe the ISP solution if it is supported by
> them
> > > (more money usually).
> > > 
> > > 
> > > 
> > > -----Original Message-----
> > > From: Javier Govea [mailto:jgovea@magma.ca] 
> > > Sent: Tuesday, July 15, 2003 12:34 PM
> > > To: netfilter@lists.netfilter.org
> > > Subject: Round Robin Load Balancing 
> > > 
> > > Hi,
> > > 
> > > I'm trying to do some load balancing with four ppp connections. Here
> is
> > > what i have: a LAN
> > > connected to a redhat box which has four ppp interfaces. All the
> boxes
> > > in the LAN are
> > > accesing internet through the ppp interfaces in the redhat box. I'm
> > > using iproute2, in my
> > > redhat box, to setup the the four ppp interfaces as my default out
> going
> > > route (as
> > > described in LART <a
> href='<a href='http://lartc.org/howto/index.html&#39;&gt;<a
href='http://lartc.org/howto/index.ht'>http://lartc.org/howto/index.ht</a>'>http://lartc.org/howto/index.html'><a
href='http://lartc.org/howto/index.ht'>http://lartc.org/howto/index.ht</a></a>
> ml</a>) and I'm using
> > > iptables to masquerade
> > > all the traffic comming from the LAN. 
> > > 
> > > My setup is working fine, ie. my LAN can access the net throught the
> > > four ppp interfaces.
> > > My problem is that i don't know how is the load balancing working.
> Some
> > > times one of the
> > > ppp interfaces is used more than the others (and that is my
> problem).
> > > According to LART
> > > the routes are cached, can someone go a bit into more details in
> this
> > > caching thing??? how
> > > does it work?  which particular files in the kernel are doing this?
> 
> > > 
> > > I would like to implement a simple round robing algorithm (with no
> > > caching) for doing the
> > > laod balancing. That is first connection established gose through
> ppp0,
> > > the second
> > > connection on ppp1 and so on. 
> > > 
> > > I could hack iproute2 and/or iptables, but i'm not sure about which
> > > particular files i
> > > should hack in order to implement this round robin algorithm. I
> actually
> > > don't know if
> > > what i want makes any sense
> > > 
> > > Any ideas or pointers are all very well appreaciated.
> > > Thanx to all
> > > X
> > > 
> > > 
> > 
> 
> 

