From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local machine to another
Date: Mon, 30 Jun 2003 01:12:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306300112.07671.Alistair@nerdnet.ca>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <20030630020152.GA27602@cannon.eng.us.uu.net> <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net>
Content-Disposition: inline
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
To: Michael <freeware@adsl-209-204-165-151.sonic.net>, Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

On June 29, 2003 10:22 pm, Michael wrote:
> What would you like me to confirm? That it's broken? It is broken. That
> the RST sending port is not the same as the initiating SYN port? It is
> not; it's low, just above 1024, so I assumed it to be
> netfilter-generated, whereas the Squid port was in the 30000 range. That
> my rule set isn't sending it? "I have no reject-with-tcp-reset lines in
> my tables." Don't know what else you could mean.
>
> Ramin Dousti wrote:
> >>I have a configuration, so:
> >>
> >>/------------\ .0.2     .{0,1}.1 /----------\ 1.2.3.4  (          )
> >>
> >>| Web server |-----+-------------| firewall |---------(  Internet  )
> >>
> >>\------------/     |        eth0 |  Squid   | eth1     (          )
> >>
> >>                   |             \----------/
> >>
> >>/---------\ .1.2   |
> >>
> >>| browser |--------/
> >>
> >>\---------/
> >>
> >>- The 192.168.{0,1}. subnets run on the same wire.
> >>- Port 80 on the public i/f is DNATed to the internal Web server.
> >>
> >>The firewall is running Squid to proxy for 192.168.1. clients, and it
> >>works fine *except* when the target server resolves to a public IP on
> >>eth1.  When that happens, I see the client-to-Squid communication go OK,
> >>then Squid send a SYN (from .0.1) to .0.2:80, .0.2 sends a SYN ACK,...
> >>but then netfilter spontaneously issues a RST to .0.2:80 from another
> >>port (i.e., not the one that Squid was using)!
> >
> >No idea why this RST is being sent (might have to do with your rule set or
> >more possibly the internals of squid) but the fact that you say the RST
> >sending port is not the same as the initiating SYN port should not break
> >anything. Can you confirm this?
> >
> >Ramin
> >
> >>I have no reject-with-tcp-reset lines in my tables.


	Ummm:
	     I wonder.
	     Does the squid to webserver connection ever go through *any* 
firewalling?
	Does the webserver to squid response get handled by any firewalling?

	I *suspect* that squid may be avoiding the firewall, sending connection 
	direct to webserver, but reply from webserver is hitting the firewall, and
	since it isn't thus in any conntrack, getting b0rked.  Mind you... 
	I'd need to see the ruleset first.  Question comes as ... where does 
	*squid* resolve names and what routes will it use? 

	To answer this at all I'd need to see the full ruleset.

	Then again ... I might be way off on this, but I've seen something remotely 	
	similar in practice where the hosts file on the firewall server mislead 
squid.

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

