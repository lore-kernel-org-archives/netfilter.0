From: Jason Opperisano <opie@817west.com>
Subject: Re: --mac-dest matching
Date: Wed, 15 Sep 2004 09:34:57 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095254611.1899.38.camel@wolfpack.ljm.dom>
References: <1095242190.2267.24.camel@tartiflette>
	<1095249731.1899.23.camel@wolfpack.ljm.dom>
	<1095251036.7600.20.camel@tartiflette>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095251036.7600.20.camel@tartiflette>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-09-15 at 08:23, Stephane Delcroix wrote:
> Hi,
> 
> Indeed, I'm setting up a bridge on a network with multiples gateways.
> I need to set up port forwarding different for each gateway => need --
> mac-dest.

=> need ebtables.

> I can eventually MARK packets with ebtables and filter with iptables
> later.
> Maybe someone had done this before and give me more informations...

fair enough--i will bow out of this thread now.

-j
 
-- 
Jason Opperisano <opie@817west.com>


