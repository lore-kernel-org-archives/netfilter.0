From: Jason Opperisano <opie@817west.com>
Subject: Re: cron script error -- "Resource temporarily unavailable" [was:
	(no subject)]
Date: Wed, 09 Feb 2005 23:55:01 -0500
Message-ID: <1108011301.4619.51.camel@hubcap.ljm.dom>
References: <420AE506.4080403@thompsonmike.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420AE506.4080403@thompsonmike.co.uk>
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

On Wed, 2005-02-09 at 23:37, Michael Thompson wrote:
> Every once in a while while I am running a script from cron, it outputs 
> this:
> 
> iptables: Resource temporarily unavailable
> 
> what is that about? Could it be that two processes are trying to access 
> IPTables?

without any details about what the script is trying to do, i doubt
anyone is going to provide a useful response to you.

for example, if the script is trying to load a custom chain with 10,000
rules in it--this post from the archives may be similar to the problem
you are experiencing:

  http://marc.theaimsgroup.com/?l=netfilter&m=110064111107583&w=2

-j

--
"Oh, people can come up with statistics to prove anything, Kent. 14%
 of people know that."
	--The Simpsons


