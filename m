From: "Stephen J. McCracken" <smccracken@hcjb.org.ec>
Subject: Re: DROP
Date: Fri, 22 Apr 2005 08:54:05 -0500
Message-ID: <426901FD.4040301@hcjb.org.ec>
References: <42634792.2070307@eccotours.dyndns.org>
	<20050418133542.GA15413@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050418133542.GA15413@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

Jason Opperisano wrote:
> On Mon, Apr 18, 2005 at 07:37:22AM +0200, Brent Clark wrote:

>>I was wondering, if was adviseable to set the default policy for tables 
>>nat and mangle to DROP.
> 
> no.  *all* packets traverse the filter chains--do your filtering
> there.

Just to better understand, don't all packets also pass the mangle table 
and only the first packet of a connection the nat table?

Thanks for your enlightenment...

sjm

