From: Jason Opperisano <opie@817west.com>
Subject: Re: Block proxy use.
Date: Mon, 22 Nov 2004 11:01:26 -0500
Message-ID: <20041122160126.GA30757@bender.817west.com>
References: <1101131370.16509.24.camel@tux.it-akademiet.no>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1101131370.16509.24.camel@tux.it-akademiet.no>
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

On Mon, Nov 22, 2004 at 02:49:30PM +0100, Stian B. Barmen wrote:
> Is there som kind of filter for netfilter that can block access to
> anonymous proxies? The problem I often face is that the most advanced
> users always can work around the firewall by using proxies. 
> 
> I know that I could run a proxy myself but this is not exactly what I
> want. The best would be if there could be a filter similar to ipp2p
> which would check for a "proxy signature" and block those
> communications. 

best option:  run squid, transparently proxy connections to it, block
access to remote proxies by category with squidGuard and a decent
blacklist; or, by restricting HTTP CONNECT method.

sub-optimal options:

create a list of known remote proxies and block access to them via IP
address in netfilter or by black-holing the domains in your DNS server.

use something like l7filter (which i have zero experience with) to block
HTTP CONNECT requests.  note that this method is powerless against
remote proxies that use SSL.

-j

--
"Lisa, Vampires are make-believe, like elves, gremlins, and Eskimos."
        --The Simpsons

