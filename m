From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Blocking Streaming Media (Was: Re: (no subject)..)
Date: Thu, 10 Jun 2004 16:54:57 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040610235457.67649.qmail@web61007.mail.yahoo.com>
References: <20040610173342.6e858194@mgalepc.utilitran.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040610173342.6e858194@mgalepc.utilitran.com>
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
To: Michael Gale <michael.gale@utilitran.com>, netfilter@lists.netfilter.org


--- Michael Gale <michael.gale@utilitran.com> wrote:
> Hello,
> 
> 	Netfilter is a packet level firewall option, for security you should be
> using
> multiple levels. Which means adding more layers, use iptables for packet
> filtering and then:
> 
> Exampels:
> 
> 	Squid for http application level filtering
> 	Frox for FTP application level filtering
> 
> 	For https allow connections to only required servers.
> 
> 
> Michael.
> 
> 
> 
> 
> On Thu, 10 Jun 2004 14:37:43 -0700 (PDT)
> SBlaze <dagent.geo@yahoo.com> wrote:
> 
> > I guess, blocking ports or defining ports to be allowed to users is not 
> > enough. Users are clever and smart from day to day. Once the originial and 
> > standard ports blocked by administrator, they use port forwarding sometimes
> 
> > to some kind of hosting server or dedicated server, and they still able to
> do 
> > music streaming.
> > 
> > If you checkout the greatest site, let say www.shoutcast.com, u can see
> lots 
> > of stations use port 80, it means connecting to radio stations would be the
> 
> > same as clients surfing to the web. 
> > 
> > I'm still thinking patch-o-matic STRING would be the best solustion for now
> ..
> > 
> > Regards,
> > Rio Martin.
> > 
> > Perhaps you missed the rest of my post? I only pointed out the yahoo
> support
> > page as a starting point. I wouldn't attack this from a port point of view
> > becuase that method would be hit and miss. Find where the music comes from
> and
> > block the ranges it comes from. I stated examples of this with the Yahoo
> > LaunchCAST streaming protocol. I don't know the structure of your network
> so
> > it is hard for me to say how to find the culprits. I also used a packet
> > sniffer on my network to find where the service was originalting. Stopping
> > shoutcast maybe a bit more difficult... I'll look into that as well...
> > 
> > =====
> > In the absence of order there will be chaos.
> > 
> > 
> > 	
> > 		
> > __________________________________
> > Do you Yahoo!?
> > Friends.  Fun.  Try the all-new Yahoo! Messenger.
> > http://messenger.yahoo.com/ 
> > 
> > 
Well me personally I don't have the resources for squid... I can't speak for
Rio though. Perhaps he should check here.

http://www.squid-cache.org/Doc/FAQ/FAQ-3.html#ss3.1

My set up is only a Dual Pentium Pro 200 with one IDE 80GB drive(UDMA 66) w
128MB EDO RAM

=====
In the absence of order there will be chaos.


	
		
__________________________________
Do you Yahoo!?
Friends.  Fun.  Try the all-new Yahoo! Messenger.
http://messenger.yahoo.com/ 

