From: Jason Opperisano <opie@817west.com>
Subject: Re: --mac-dest matching
Date: Wed, 15 Sep 2004 08:02:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095249731.1899.23.camel@wolfpack.ljm.dom>
References: <1095242190.2267.24.camel@tartiflette>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095242190.2267.24.camel@tartiflette>
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

On Wed, 2004-09-15 at 05:56, Stephane Delcroix wrote:
> Hi,
> for a particular firewall, I need to match packet by mac-dest.
> I didnt find anything neither in netfilter doc nor in the kernel
> sources :(
> 
> Is there a patch or an extension for netfilter to do that?
> 
> regards,
> 
> Stephane

on a routing gateway; a destination MAC match is irrelevant, as the
destination MAC will always be that of the local machine (this pretty
much applies to a standalone host as well).

destination MAC addresses are only really relevant to switches...

anyways--i'm guessing you're probably trying to setup some sort of
bridge--in which case, you need "ebtables" which is available at:

        http://ebtables.sourceforge.net/
        
and can match on destination MAC address.

my other guess would be maybe you're looking to match
broadcasts/multicasts, in which case--the pkttype match may be of some
interest to you.

-j

-- 
Jason Opperisano <opie@817west.com>


