From: Jason Opperisano <opie@817west.com>
Subject: Re: REPOST: nfnetlink / ctnetlink / iptables2 questions
Date: Sat, 18 Dec 2004 18:14:48 -0500
Message-ID: <1103411687.3262.72.camel@hubcap.ljm.dom>
References: <41C3C4B3.2060003@ipom.com>
	<Pine.LNX.4.61.0412181111530.27672@filer.marasystems.com>
	<41C4B2F0.5090108@ipom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41C4B2F0.5090108@ipom.com>
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

On Sat, 2004-12-18 at 17:45, Phil Dibowitz wrote:
> Henrik Nordstrom wrote:
> > On Fri, 17 Dec 2004, Phil Dibowitz wrote:
> > 
> >> At the very least, libnfnetlink requires nfnetlink.h, which I would 
> >> have thought was part of libnfnetlink, but it appears it's not.
> > 
> > 
> > It is included as part of the required nfnetlink-ctnetlink kernel patch.
> 
> Hey, that's a start, thanks. Can you tell me where this kernel patch is?
> 
> I haven't found such a patch....

it's in patch-o-matic.  both patch-o-matic-ng-20040621 and CVS appear to
have the same version (0.13):

http://netfilter.org/files/patch-o-matic-ng-20040621.tar.bz2

http://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng/nfnetlink-ctnetlink-0.13/

-j

--
"When will I learn? The answer to life's problems aren't at the bottom
 of a bottle, they're on TV!"
	--The Simpsons


