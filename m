From: "Preston Wade" <Preston_Wade@hilton.com>
Subject: RE: Connection Tracking
Date: Fri, 21 Jun 2002 10:25:29 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <0B2759D401C1D211ACA500805FFE2C3F0636753E@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Thanks to all that responded.  I guess I need another cup of coffee.  I
completely forgot that if a connection gets closed by either side it moves
into a different state which will put it to one of the other timeout vaules
specified in /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c
Thanks,
Preston


> -----Original Message-----
> From:	"Antony Stone" <Antony@Soft-Solutions.co.uk>@INTERNET@HHC 
> Sent:	Friday, June 21, 2002 10:06 AM
> To:	'netfilter@lists.samba.org'
> Subject:	Re: Connection Tracking
> 
> On Friday 21 June 2002 3:54 pm, Preston Wade wrote:
> 
> > Hello All,
> >
> > I am curious to get other peoples thoughts about the 5 Day timeout for
> the
> > following variable: TCP_CONNTRACK_ESTABLISHED.
> 
> 5 days is the value specified in TCP standards, but bear in mind this is
> only
> relevant for connections which have been established (SYN, SYN/ACK, ACK)
> but
> which have not been terminated (FIN or RST).   Connections which get ended
> by
> one party or the other will get removed from the table and the timeout is
> no
> longer relevant.
> 
> > This value seems high for
> > high traffic firewalls.  For instance if I wanted to use netfilter for a
> > firewall between my corporate network and my WAN, which has roughly 2300
> > nodes and 40000 users.  It seems to me like you would run out of STATE
> > memory and with most connection being TCP it would take 5 days before
> most
> > of them would timeout.
> 
> Do you really have large numbers of ESTABLISHED connections which are left
> in
> an open state by clients / servers, instead of being nicely killed off
> with
> FIN or RST packets ?
> 
> The onyl time I've seen this being a real problem was last summer, when
> Nimda
> and Code Red infections started setting up thousands of half-open
> connections
> to machines which couldn't cope with the load....
> 
> > I realize I could modify the value and recompile...
> > although it would be nice to be able to modify these with sysctl.conf or
> > via the /proc filesystem.
> 
> I believe it is possible to change this value on the fly using the
> /proc/sys/net/ipv4 filesystem, although I can't point you at the relevant
> name to use - maybe someone else on this list can remember ?
> 
> 
> 
> Antony.
> 
> 


