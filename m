From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: IPSec - IPTables issues
Date: Wed, 05 May 2004 12:08:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083773336.9138.43.camel@localhost>
References: <20040502155538.GD515@schottelius.org>
	 <20040504211557.GA236@schottelius.org> <4098FE7A.8070707@pbl.ca>
	 <200405051622.26944.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405051622.26944.Antony@Soft-Solutions.co.uk>
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

On Wed, 2004-05-05 at 11:22, Antony Stone wrote:
> On Wednesday 05 May 2004 3:47 pm, Aleksandar Milivojevic wrote:
> 
> > Nico Schottelius wrote:
> > > I'll compare what freeswan did with what Linux 2.6 does now:
> > >
> > > Freeswan has virtual devices (ipsec*), through which the unencrypted
> > > packets come into the system. So you can add these firewall lines:
> > >
> > > - allow AH, ESP, UDP/500, deny rest on eth0
> > > - allow IPs/networks, etc. on ipsec0
> >
> > Haven't worked much with IPSec (at least not over firewall).  Are you
> > sure that IPSec packets will go through Netfilter twice (once encrypted,
> > and than once again unencrypted)?
> 
> They do.   This makes it easy to filter the packet types you want to allow 
> through the tunnel, rather than having a VPN which passes just everything.
Please pardon my ignorance; I haven't yet played with 2.6 and the native
IPSec.  So how does one distinguish packets which have arrived from an
IPSec tunnel and are now re-traversing netfilter from those which have
arrived unencrypted and are traversing netfilter for the first time? We
would typically have a different set of access controls for data coming
from a quasi-trusted tunnel versus data coming in from the Internet and
historically differentiated by examining the interface (e.g., ipsec0
versus eth0).
> 
> > Anyhow, if I assume that what you wrote is correct (and it is how Linux
> > kernel handles packets), I still don't see need for virtual devices.
> 
> That's the way FreeS/WAN does it.
> 
> Regards,
> 
> Antony.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


