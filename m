From: "Jason R. Martin" <jrmartn1@csl.uiuc.edu>
Subject: Re: IP Traffic Accounting
Date: Mon, 24 Jun 2002 10:33:00 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624103300.A29752@tiger.csl.uiuc.edu>
References: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net> <20020623225040.A26831@tiger.csl.uiuc.edu> <3D16B131.4090202@ozemail.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3D16B131.4090202@ozemail.com.au>; from mutk@ozemail.com.au on Mon, Jun 24, 2002 at 03:42:09PM +1000
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael <mutk@ozemail.com.au>
Cc: IPtables Users <netfilter@lists.samba.org>

> The main problems with this way of doing things are:
> 
> - If the host you run the IPaudit program on is also a firewall, by 
> virtue of the  fact that the program  requires promiscuous mode on the 
> interface it listens on introduces a (theoretical) security risk.

I agree, there is a security risk, as the recent tcpdump vulnerabilities
show.  However, the need for accounting was greater than the slim chance
of an attack directed at our setup.  I don't use the setup in the same way
you do, as I don't need to know exactly what each user is doing, but I 
am able to see host traffic useage so I can follow high bandwidth patterns.

> - An alternative to running the IPaudit on the firewalling host is to 
> have a seperate standalone machine running IPaudit, to sniff packets 
> passing by on an ethernet segment. This requires either a bridge device 
> or a non-switch Hub to connect the IPaudit machine to the same ethernet 
> segment as the interface you want to audit. So additional costs, and 
> additional points of failure.
> 
> - If the IPaudit runs on an additional machine as above, and uses a 
> plain garden variety non-switched Hub to allow the audit machine to 
> "see" the packets going to and from the internal interface of the 
> firewall, this introduces a performance bottle neck, especially when you 
> consider that there is no such thing as a full duplex non-switching hub. 
> So the use of the IPaudit standalone monitoring machine causes less than 
> ideal performance.
>
> IPmeter runs on a standalone machine, and I have observed performance 
> problems when using a non-switch hub to access the ethernet segment. 
> Collisions -many- with as little as 50 users.
> 
> IPaudit will probably be quite ok for a Workstation providing Internet 
> connections to other home users or small office, if security on the 
> Internal interface is not a concern. Also, a standalone machine to 
> monitor traffic may be a simple setup, and performance may not be such 
> an issue for a small number of hosts when using a no-switch Hub. 
> Performance will not be hampered at all if you can get hold of an 
> ethernet bridging device.

Yeah, using a hub would definitely not work for me.  I run ipaudit directly
on the firewall, where I have yet to see any sort of performance hit, even
with roughly 800-1000 users.  Every 30min I get a ~300k file.  I'm working
on ways of using the information through a MySQL database instead of the
flat text files that ipaudit produces.  We'll see if anything fun comes of
that :-)

Jason

> BTW, I have a complex setup of iptables firewall, a pam_iptables module, 
> PHP scripts, C coded programs and  postgressql DB running right now to 
> account for Internet access traffic. It's a monstrosity of 
> interdependent programs, very messy. But it is currently working, and 
> provides Internet access for over 50 users. Users have to loggin to the 
> server , this triggers iptables rules to be added to allow them access, 
> and starts a process that stores their byte counts in a PostgreSQL DB. 
> Users can also access a local web page to check their usage details for 
> month etc...
> 
> When I get the time, I'll clean it all up, document it and put it on a 
> website as an example of how to account for packets/bytecounts using 
> iptables, *and* provide access control as well (Thats what pam_iptables 
> provides).
> 
> I am saying it's a definitive, and good example, just "an example"...
> 
> Cheers,
> Michael

