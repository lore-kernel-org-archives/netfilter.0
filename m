From: Jason Opperisano <opie@817west.com>
Subject: Re: PPTP connection tracking on Mandrake 10.0 with Kernel 2.6
Date: Thu, 09 Dec 2004 08:05:03 -0500
Message-ID: <1102597502.6274.4.camel@hubcap.ljm.dom>
References: <41B754EC.5000900@gmx.de>
	<1102547747.3472.31.camel@hubcap.ljm.dom>  <41B80A4C.6090002@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B80A4C.6090002@gmx.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-12-09 at 03:18, Ausi wrote: 
> > uh--that sounds pretty drastic...not saying this will fix it, but did
> > you also:
> > 
> >   modprobe ip_nat_pptp
> >   modprobe ip_nat_proto_gre
> > 
> No, there are no modules ip_nat_pptp and ip_nat_proto_gre.

well--i'm pretty sure you're going to need those...

-j

--
"Dear Baby, Welcome to Dumpsville. Population: You"
	--The Simpsons


