From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: Blocking Streaming Media (Was: Re: (no subject)..)
Date: Tue, 1 Jun 2004 08:50:00 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040601085000.3dcaae24@mgalepc.utilitran.com>
References: <200406010943.02317.rio@martin.mu>
	<20040601053750.50670.qmail@web61008.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040601053750.50670.qmail@web61008.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org


Squid -- can block this no problem.

Michael.


On Mon, 31 May 2004 22:37:50 -0700 (PDT)
SBlaze <dagent.geo@yahoo.com> wrote:

> 
> --- Rio Martin <rio@martin.mu> wrote:
> > On Monday 31 May 2004 18:18, Ivan wrote:
> > > Hi,
> > > I am looking for a solution to block streaming media using iptables.
> > > I have found that some of my users are listening to radio stations using
> > > internet, which has pumped up the
> > > internet bill significantly, and of course put a choke on my internet
> > > links. Does anyone know of a solution for blocking just the streaming
> > > media traffic from any web site, while still allowing
> > > the access to the website it self?
> > > Thanks,
> > > Ivan
> > 
> > 
> > Hiye Ivan,
> > The problem you faced was users connecting to Internet Radio Stations using 
> > web port (port 80) isnt it ? I give u an example like LaunchCast from Yahoo 
> > or other stations using port 80 as their service port.
> > 
> > This is become a serious problem when bandwidth allocated not so wide. The 
> > only thing in my mind, try to apply the magic of patch-o-matic STRING. 
> > Examine correctly what packets arrived or what kind of streaming packets
> > sent
> > 
> > by server. Block using those STRING.
> > 
> > Regards,
> > Rio Martin.
> > 
> 
> STRING matching is at best a primative method of any kind of filtration. It
> has been demonstrated and documented many times here that it's simply not an
> efficent option. However I do think I might can help with this. First you need
> to identify what and where the radio stations are coming from. If they are
> from the new Yahoo LAUNCHcast...stoping them should be fairly easy...with some
> work.
> 
> First this is good info to know...
> http://search1.cc.dcn.yahoo.com/cct_search.php?ui_mode=answer&prior_transaction_id=248668163&action_code=5&answer_id=14755094#__highlight
> 
> It contains info for firewalls and LAUNCHcast.
> 
> Assuming you are NATing your internal machines.... set up rules to block
> certain hosts at yahoo.
> 
> From personal experience I connect to this one
> re2wmcontent24.bcst.re2.yahoo.com (at least at this time I'm connected to it)
> 
> By doing some DNS snooping... It apears that there are 43 of these with this
> being the first...
> 
> hogwarts:~# nslookup -silent re2wmcontent01.bcst.re2.yahoo.com
> Server:         66.190.172.252
> Address:        66.190.172.252#53
> 
> Name:   re2wmcontent01.bcst.re2.yahoo.com
> Address: 206.190.44.76
> 
> and this being the last...
> 
> hogwarts:~# nslookup -silent re2wmcontent43.bcst.re2.yahoo.com
> Server:         66.190.172.252
> Address:        66.190.172.252#53
> 
> Non-authoritative answer:
> Name:   re2wmcontent43.bcst.re2.yahoo.com
> Address: 206.190.44.118
> 
> with 44 returning this...
> 
> hogwarts:~# nslookup -silent re2wmcontent44.bcst.re2.yahoo.com
> Server:         66.190.172.252
> Address:        66.190.172.252#53
> 
> ** server can't find re2wmcontent44.bcst.re2.yahoo.com: NXDOMAIN
> 
> So we can reasonably assume that if we block 206.190.44.76 thorugh
> 206.190.44.118 we could stop the LAUNCHcast broadcasts.... Dealing with NAT is
> a tad tricky though... since we need to stop it before it gets "NATED".
> 
> 
> With My setup my eth0 is the "wire" and my eht1 is LAN... so if I drop these
> on my LAN device(eth1)..theoretically I would stop the broadcast. If I wanted
> to stop it this would be the approach I would use. I hope it helps.... keep me
> posted if you try it.
> 
> =====
> In the absence of order there will be chaos.
> 
> 
> 	
> 		
> __________________________________
> Do you Yahoo!?
> Friends.  Fun.  Try the all-new Yahoo! Messenger.
> http://messenger.yahoo.com/ 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

