From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: vpn under linux
Date: Mon, 12 Apr 2004 14:58:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16506.59106.186796.341759@saint.heaven.net>
References: <20040412122513.2441.qmail@web13908.mail.yahoo.com>
	<1081785660.16834.13.camel@localhost>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1081785660.16834.13.camel@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@lists.netfilter.org>
Cc: Scott MacKay <scottmackay@yahoo.com>

I can fill in some gaps ...

John A. Sullivan III writes:
> I'm afraid I don't have time to answer in depth today but here are a few
> quick answers regarding *swan:
> 
> On Mon, 2004-04-12 at 08:25, Scott MacKay wrote:
> > I had a couple questions about the different methods
> > talked about here, probably focusing on CIPE,
> > FreeSWAN/OpenSWAN, and the OpenVPN (along with any
> > others users may chime in with)
> > 1.  Where in the netfilter path do these solutions
> > package up data?  Important to know if we see
> > tunnel/VPN packets or the contents which are going
> > into them, both incoming and outgoing
> *swan makes this convenient by passing the traffic from the physical
> interface to an ipsec interface, e.g., eth0 -> ipsec0.  I believe there
> are extensive diagrams of how this works in the training section at
> http://iscs.sourceforge.net

OpenVPN and CIPE also both use virtual devices, giving access to both
the encrypted packets and the unencrypted contents.

> > 2.  Which of these guys support broadcast or
> > multicast?

OpenVPN and CIPE both support bridging modes.

> > 3.  Do any of these support non-encrypted
> > transmission?  The reason for this would be if a
> > higher level/later service provided the encryption
> > over the risky sections of a transmission

OpenVPN supports unencrypted transmission.  I don't think CIPE does,
but I'm not 100% sure.

> > 4.  What kind of overhead do these cost?  I was
> > curious from the perspective of initialization/updates
> > and also any additional packet headers (rough guess). 
> There are some performance benchmarks buries somewhere in the extensive
> *swan documentation.

The additional packet headers (of ANY tunnel protocol) can cause
problems when accessing servers with broken path mtu discovery.  This
normally isn't a problem for internal VPN use, but you'll run into
this when using a VPN to get internet access via a remote site's
internet connection.  (If you do this, Netfilter mss rewriting can be
a big help.)

OpenVPN implements emulation of full-size mtu.  However, turning this
on can result in a significant (~30%) drop in speed, so I don't use
it.

Otherwise, OpenVPN and CIPE (and probably *SWAN) run essentially at
wirespeed - usually less than 1-2% speed cost.  OpenVPN supports
compression, and compressible transfers can run even faster than
uncompressed wirespeed.

OpenVPN has become my personal VPN choice.  I use it for a VPN linking
my office and home and for a demonstration tunnel between upstate NY
and New Zealand.  (http://www.nz.netheaven.com)  Previously I used
mostly CIPE, and for Linux I still regard the choice a close call.

--
Dick St.Peters, stpeters@NetHeaven.com 

