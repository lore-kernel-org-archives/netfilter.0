From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec - IPTables issues
Date: Wed, 5 May 2004 18:32:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405051832.27700.Antony@Soft-Solutions.co.uk>
References: <20040502155538.GD515@schottelius.org> <200405051622.26944.Antony@Soft-Solutions.co.uk> <1083773336.9138.43.camel@localhost>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083773336.9138.43.camel@localhost>
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

On Wednesday 05 May 2004 5:08 pm, John A. Sullivan III wrote:

> On Wed, 2004-05-05 at 11:22, Antony Stone wrote:
> > On Wednesday 05 May 2004 3:47 pm, Aleksandar Milivojevic wrote:
> > > Nico Schottelius wrote:
> > > >
> > > > Freeswan has virtual devices (ipsec*), through which the unencrypted
> > > > packets come into the system. So you can add these firewall lines:
> > > >
> > > > - allow AH, ESP, UDP/500, deny rest on eth0
> > > > - allow IPs/networks, etc. on ipsec0
> > >
> > > Haven't worked much with IPSec (at least not over firewall).  Are you
> > > sure that IPSec packets will go through Netfilter twice (once
> > > encrypted, and than once again unencrypted)?
> >
> > They do.   This makes it easy to filter the packet types you want to
> > allow through the tunnel, rather than having a VPN which passes just
> > everything.
>
> Please pardon my ignorance; I haven't yet played with 2.6 and the native
> IPSec.  So how does one distinguish packets which have arrived from an
> IPSec tunnel and are now re-traversing netfilter from those which have
> arrived unencrypted and are traversing netfilter for the first time?

That is a very good question, and one to which I am not aware of a good 
answer.   In my (extremely limited) experience of looking at IPsec in the 2.6 
kernels this is a major disadvantage of the design, and means it is not 
possible to secure a VPN (by which I mean selecting which traffic is allowed 
down it and which is not, as it was possible to do with FreeS/WAN by writing 
netfilter rules specifying ipsecN as the output interface).

> We would typically have a different set of access controls for data coming
> from a quasi-trusted tunnel versus data coming in from the Internet and
> historically differentiated by examining the interface (e.g., ipsec0
> versus eth0).

I agree.   If anyone knows a sensible way of achieving this with the new 2.6 
IPsec implementation, please share the knowledge :)

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


