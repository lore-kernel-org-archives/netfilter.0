From: Javier Govea <jgovea@magma.ca>
Subject: Re: Round Robin Load Balancing
Date: Wed, 23 Jul 2003 20:31:19 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307240031.h6O0VJbk000891@webmail2.magma.ca>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Ramin Dousti <ramin@cannon.eng.us.uu.net>, Daniel Chemko <dchemko@smgtec.com>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

Hi,

> ip route add default scope global ["equalize"] nexthop dev ppp0 weight 1 \
> 	                                       nexthop dev ppp2 weight 1 \
> 	                                       nexthop dev ppp3 weight 1 \
> 	                                       nexthop dev ppp4 weight 1

This is exactely the setup i'm running including the "equalize" keyword. I'm combining
this with NAT which as i said in previous emails it is not load balancing my traffic. So,
this seems to answer your question about NAT playing well with this iproute setup. 

I read the documentation about NAT in IPROUTE
(http://snafu.freedom.org/linux2.2/docs/ip-cref/ip-cref.html) and it mentions that NAT is
only avalable for kernels 2.2.x .... am i right??????

Thanx....
X

> You can even do per packet routing ("equalize" keyword should do)
> which is not recommended while combining with nat. However, I don't
> know whether conntrack/nat in netfilter plays well with this or not.
> But even if not, you still can use the "nat" capability of iproute2 itself.
> 
> Let us know if it worked.
> 
> Ramin
> 
> On Thu, Jul 17, 2003 at 04:29:31PM -0400, Javier Govea wrote:
> 
> > I undesrtand what you mean about perfect load balancing (i'm not actually looking for a
> > perfect load balancer) I have two examples below, but first i will responde some of the
> > questions.
> > 
> > > Do these two ppp accounts belong to the same ISP? 
> > Yes. I have four accounts, all of them with the same ISP
> > >Does the ISP drop forign src?
> > ?????
> > > Is the gateway doing nat? 
> > Yes, im using iptables to setup the nat
> > > Do you have any preference on one of the ppp's than the other? 
> > No
> > >Can you bond (mppp)?
> > I haven't tried multilink ppp...i will look into this...
> > 
> > > You could also setup something like BGP to allow multiple routes to....
> > I don't know if this would be the best approach. I already tried to setup BGP and OSPF 
> > routes using zebra (<a href='http://zebra.org'>http://zebra.org</a>) and i never made
it work....
> > I found a tool called EQLPlus (<a
href='http://www.cwareco.com/download/eqlplus.html'>http://www.cwareco.com/download/eqlplus.html</a>)
but i was
> > never able to compile it. Has anybody has tried eqlplus before???????
> > 
> > > If one user makes a request out of line X then the return packet HAS to come back      
> >  > through line X. So, if one guy sends a huge request taking minutes to fulfill, he / she
> > > will tie up the line until the job is finished
> > 
> > Absolutely. I can live with that, but here is my problem. I have 4 ppp links on my router
> > (which is doing nat). Then if in a host, located in my LAN which connected to my router, i
> > open four browsers and each browser is pointing to the same site then i'm expepecting each
> > web page to be requested and returned in a different link. But that doesn't happen. Some
> > times it does happen but most of the time i get three of the responses on one link, one in
> > another and the other two links do nothing. Sometimes i get 2,1,1,0 ....
> > 
> > I did another test...i have website with has in its main web page has only 4 images
> > (differnt images but all of them of exactely the same size). if i point my browser to that
> > site, then i'm believe the browser is sending four http requests (one for each image),
> > well i would expect one image on each link....but again sometimes i get the four images on
> > the same link...some times i get 2 images in one link...
> > 
> > So, i don't want a perfect load balancer but i would like to fix the problems on my two
> > examples... i thought about implementing a round robin algorithm for load balancing where
> > my first request goes on my first available link, the second one on the second available
> > link and so on....this idea fixes my problems in my two previous examples, but i'm open to
> > suggestions....
> > 
> > any tips, pointer, ideas are all welcome...
> > 
> > cheers...
> > X
> > 
> > 
> > 
> > > Absolutely. Perfect load balancing needs to be coordinated on _all_ the
> > > endpoints of the links involved. In this case, 4 endpoints.
> > > 
> > > For a regular load balancing (which is going to be the case here)
> > > we still have lots of unknown variables. Do these two ppp
> > > accounts belong to the same ISP? Does the ISP drop forign src?
> > > Is the gateway doing nat? Do you have any preference on one of
> > > the ppp's than the other? Can you bond (mppp)? And so on.
> > > But a fun project, though, for someone who has time...
> > > 
> > > Ramin
> > > 
> > > On Tue, Jul 15, 2003 at 12:44:40PM -0700, Daniel Chemko wrote:
> > > 
> > > > Because of the nature of your setup, you cannot have a perfect equal
> > > > load balance setup. This is because you cannot control the inbound flow
> > > > of data. If one user makes a request out of line X then the return
> > > > packet HAS to come back through line X. So, if one guy sends a huge
> > > > request taking minutes to fulfill, he / she will tie up the line until
> > > > the job is finished. The load balancer should be smart enough to not
> > > > send any more requests to that line, but you are still seeing the line
> > > > being monopolized by this single connection, hence it is not balanced
> > > > over all lines equally.
> > > > 
> > > > In order to have fair balancing of all lines, I think you need to set up
> > > > a deal with your ISP to load balance on their end as well.
> > > > 
> > > > You could also setup something like BGP to allow multiple routes to the
> > > > same return address, but I am not familiar enough with BGP to be much
> > > > help in this area. In all likelihood, you are better off with your
> > > > current solution or maybe the ISP solution if it is supported by them
> > > > (more money usually).
> > > > 
> > > > 
> > > > 
> > > > -----Original Message-----
> > > > From: Javier Govea [mailto:jgovea@magma.ca] 
> > > > Sent: Tuesday, July 15, 2003 12:34 PM
> > > > To: netfilter@lists.netfilter.org
> > > > Subject: Round Robin Load Balancing 
> > > > 
> > > > Hi,
> > > > 
> > > > I'm trying to do some load balancing with four ppp connections. Here is
> > > > what i have: a LAN
> > > > connected to a redhat box which has four ppp interfaces. All the boxes
> > > > in the LAN are
> > > > accesing internet through the ppp interfaces in the redhat box. I'm
> > > > using iproute2, in my
> > > > redhat box, to setup the the four ppp interfaces as my default out going
> > > > route (as
> > > > described in LART <a
> > href='<a href='http://lartc.org/howto/index.html&#39;&gt;<a
href='http://lartc.org/howto/index.html&lt;/a&gt;'>http://lartc.org/howto/index.html</a></a>'>http://lartc.org/howto/index.html'><a
href='http://lartc.org/howto/index.html&lt;/a&gt;'>http://lartc.org/howto/index.html</a></a></a>)
and I'm using
> > > > iptables to masquerade
> > > > all the traffic comming from the LAN. 
> > > > 
> > > > My setup is working fine, ie. my LAN can access the net throught the
> > > > four ppp interfaces.
> > > > My problem is that i don't know how is the load balancing working. Some
> > > > times one of the
> > > > ppp interfaces is used more than the others (and that is my problem).
> > > > According to LART
> > > > the routes are cached, can someone go a bit into more details in this
> > > > caching thing??? how
> > > > does it work?  which particular files in the kernel are doing this?  
> > > > 
> > > > I would like to implement a simple round robing algorithm (with no
> > > > caching) for doing the
> > > > laod balancing. That is first connection established gose through ppp0,
> > > > the second
> > > > connection on ppp1 and so on. 
> > > > 
> > > > I could hack iproute2 and/or iptables, but i'm not sure about which
> > > > particular files i
> > > > should hack in order to implement this round robin algorithm. I actually
> > > > don't know if
> > > > what i want makes any sense
> > > > 
> > > > Any ideas or pointers are all very well appreaciated.
> > > > Thanx to all
> > > > X
> > > > 
> > > > 
> > > 
> 
> 

