From: Jason Opperisano <opie@817west.com>
Subject: Re: DROP
Date: Mon, 18 Apr 2005 09:35:42 -0400
Message-ID: <20050418133542.GA15413@bender.817west.com>
References: <42634792.2070307@eccotours.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42634792.2070307@eccotours.dyndns.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Apr 18, 2005 at 07:37:22AM +0200, Brent Clark wrote:
> Hi all
> 
> I was wondering, if was adviseable to set the default policy for tables 
> nat and mangle to DROP.

no.  *all* packets traverse the filter chains--do your filtering
there.

this question seems to come up every so often, and the idea is
absolutely indefensible, IMHO.

-j

--
"Tom Tucker: And now time for the Ollie weather report.
 Ollie: It's gonna rain.
 Tom Tucker: Thanks Ollie."
        --Family Guy

