From: "David Luyer" <david@luyer.net>
Subject: RE: TCP delay, solved
Date: Fri, 14 Jun 2002 18:17:15 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <002101c2137b$e44d6de0$638317d2@pacific.net.au>
References: <200206140755.g5E7tuA26840@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206140755.g5E7tuA26840@Networker.rockstone.co.uk>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

> On Friday 14 June 2002 8:15 am, David Luyer wrote:
> 
> > [ ident lookups causing tcpd to be slow ]
> >
> > > There's no satisfactory answer to this problem at 
> > > present, I think.
> >
> > So it's a compile option on tcpd.  Recompile with it disabled.
> 
> Yes, but that would need to be done by everyone out on the 
> Internet whose systems my clients try to contact, otherwise
> we're still going to get those long delays (or a hole in my
> firewall).
> 
> Not what I consider a "satisfactory solution" :-)

Ah.  I missed the start of the discussion.  You're blocking ident
lookups on your customers, and it's causing them to have problems
accessing some sites and services?

Easy solution:

  deny (connection reset) rather than drop the connections

Hard solution:

  transproxy ident and return a cryptographic hash representing
  the actual client online on the IP which the ident request is
  for (this is a much cooler solution but I only know one ISP to
  have done it)

David.


