From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: vpn
Date: Tue, 14 Sep 2004 23:01:55 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095217315.21194.55.camel@inyoureyes.linsolutions.com>
References: <012a01c49a61$340e8ad0$49caa8c0@caris.priv>
	<1095172947.2055.33.camel@localhost>
	<20040914160735.GP26823@metastasis.org.uk>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20040914160735.GP26823@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tue, 2004-09-14 at 12:07, Nick Drage wrote:
> On Tue, Sep 14, 2004 at 10:42:27AM -0400, John A. Sullivan III wrote:
> > On Tue, 2004-09-14 at 09:46, Peter Marshall wrote:
> 
> <snip>
> 
> > I would suggest an IPSec VPN using either the native IPSec stack in the
> > latest Linux or either StrongSWAN (www.strongswan.org) or OpenSWAN
> > (www.openswan.org) and placing access control and VPN on the same
> > device.  That is how we design most devices for use in the ISCS project
> > (http://iscs.sourceforge.net).
> 
> Reading "Network Security Hacks" recently I liked the look of VTun.  Any
> thoughts on that?  How does it interface with IPTables?

Keyword being hack.

 Always see if ipsec will meet your needs first, any encapsulation using
tcp for its upper layer may be easier, but can create all kinds of
interesting thing with multiple flows and tcp timers expiring. Great
stuff if you want to be an expert at debugging tcp problems, otherwise
stick to something that uses udp for its upper layer.

Although for simple traffic with minimal flows is is definitely usable.


Interop with Openswan is excellent as well these days.

Plus with Novell sponsoring Openswan it gives many people a warm fuzzy
feeling, and the list is one of the best their is, no spam assaults like
the old freeswan list.

Ted 


