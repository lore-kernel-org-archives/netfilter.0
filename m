From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Re: IPsec & FreeS/WAN
Date: Thu, 4 Jul 2002 13:59:13 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704175913.GA27072@willow.seitz.com>
References: <200FAA488DE0D41194F10010B597610D2BA1F6@JUPITER> <200207030925.g639PfU28723@vulcan.rissington.net> <20020703190127.GB19157@willow.seitz.com> <20020703191224.LSGV19225.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020703191224.LSGV19225.mta07-svc.ntlworld.com@there>
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
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Wed, Jul 03, 2002 at 08:12:22PM +0100, Antony Stone wrote:
> On Wednesday 03 July 2002 8:01 pm, Ross Vandegrift wrote:
> > Does anyone distribute the FreeS/WAN kernel code as a patch instead of
> > the crazy scriptish system they use?  I've never been able to get that
> > part working without many hours of fudging.  And after that, I'd *never*
> > want to have to do it again.  OTOH, if someone had a way to make diffs,
> > that would be very easy.
> 
> What kernel source do you start from ?

I start from a clean, bleeding edge tree in the 2.4 series.  I usually
apply a few misc patches: Andrew Morton's lowlatency, any available
reiserfs fixes, sometime and AC series patch.  Unfortunately, my HDD
died a week or two ago and I'm limping along on borrowed disk until my
RMA is fuffilled, so I can't check where the problem was.

Part of the problem was that there wasn't an easy way to just run the
kernel patching script.  IIRC, the scripts configure FreeS/WAN, and then
run something like "make config dep clean bzImage modules" in the kernel source
tree.  I'd much rather do "make patch" in the FreeS/WAN source tree, and
then be left to my own devices to build the KLIPS kernel.  Again, I'd
have hacked on this problem if my HDD hadn't died.

Perhpas when I get it back I'll do some work to make this part easier -
especially since were running into VPN type problems where I work.
What's the relative performance difference between an encrypted
vtun or vpnd session and an IPSec session?

Ross Vandegrift
ross@willow.seitz.com

