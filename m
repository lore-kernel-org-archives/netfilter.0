From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Apps that try to do net-to-nat
Date: Fri, 30 Jan 2004 16:26:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075497993.20474.7.camel@jasiiitosh.nexusmgmt.com>
References: <Sea2-F35RQt5fZPNZYM00007124@hotmail.com>
	 <1075495257.20475.2.camel@jasiiitosh.nexusmgmt.com>
	 <200401302053.13354.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401302053.13354.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-01-30 at 15:53, Antony Stone wrote:
> On Friday 30 January 2004 8:40 pm, John A. Sullivan III wrote:
> 
> > On Fri, 2004-01-30 at 15:11, Jago Pearce wrote:
> > > I'm behind NAT at work and I need to connect to home, which is also
> > > behind NAT.
> > >
> > > What programs have tried to get past the NAT problem? I heard that mnet,
> > > the p2p program uses a ticketing system to pass messages. Any other
> > > programs that have attempted to do nat-to-nat and done so successfully?
> > > In particular - VoIP?
> >
> > <snip>
> > I'm used to the VPN world so for me the obvious choice is to set up a
> > VPN tunnel between home and office.  Hopefully it's not a major concern
> > but an added benefit is that your VoIP is encrypted and not subject to
> > useful interception.  OpenS/WAN (http://www.openswan.org) should work
> > nicely if your are running Linux on your gateway.
> 
> But, as a discussion on this list pointed out about a week ago, you can't do 
> that if neither of the endpoints which you wish to communicate have publicly 
> routable addresses.
> 
> I think to specify Jago's requirement slightly more explicitly, he has a 
> machine at home, which is SNATted out to the Internet (and therefore cannot 
> receive connections in from the Internet), and he has a machine at work which 
> is in the same situation - it is SNATted behind a firewall so that the 
> machine can connect to the Internet, but the Internet cannot connect to the 
> machine.
> 
> Therefore the requirement here is to break the security policy of both his 
> employer and his home ISP by linking together two machines which have been 
> assigned non-routable addresses.
> 
> Regards,
> 
> Antony.
I suppose it really depends on what he has where.  For example, if he is
at work on a Windows PC with a private address and needs to connect to a
home PC behind an iptables/openswan gateway, he can use a windows IPSec
client that supports NAT-Traversal, create a tunnel to the home gateway
and access the home PC or VoIP system or whatever he needs by using its
private address.  The tunnel will know that the private address lives on
the other side of the gateway's public address.  Of course, that may not
be the set up he has at all but it is one that will work along with
several variations on the same theme.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


