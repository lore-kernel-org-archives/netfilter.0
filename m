From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Sun, 16 Jun 2002 00:30:15 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206152330.g5FNUHA30988@Networker.rockstone.co.uk>
References: <3D0BBC45.5000807@palaver.net> <200206152233.g5FMXPA27757@Networker.rockstone.co.uk> <20020616001745.N2090@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020616001745.N2090@funkyjesus.org>
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
To: netfilter@lists.samba.org

On Sunday 16 June 2002 12:17 am, Nick Drage wrote:

> On Sat, Jun 15, 2002 at 11:33:23PM +0100, Antony Stone wrote:
> > On Saturday 15 June 2002 11:14 pm, Brian Capouch wrote:

> > > I wonder if the sages on this list might share advice as to whether or
> > > not it might be practical to maintain a working ISP where ALL client
> > > machines use private IP addresses, which are then NAT-ted to public IP
> > > space as necessary by iptables.

> > Some current ISPs already do this, and I guess the popularity with their
> > customers varies according to what the customers want to do :-)

> Can you name any ISPs that do this?  I haven't seen it in my limited
> experience.

There's a satellite ISP in the UK which does this - it's called either Hughes 
or StreamBeam, I'm not sure which is the end provider and which is the 
sub-carrier.   The equipment they provide is labelled Hughes.

As a standard account you get private (10.x.y.z) addresses on the end of the 
link, however you can ask for public-private NAT and they do SNAT/DNAT to 
your private addresses (one-to-one mapping).

I thought I'd heard that some ADSL services in UK provide private addresses 
too, but I've never had this, so I can't comment from personal experience.

 

Antony.

