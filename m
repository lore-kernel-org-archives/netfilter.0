From: David Cary Hart <DCH@TQMcube.com>
Subject: Re: Dumb question
Date: Thu, 26 Aug 2004 20:52:24 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093567944.21197.2.camel@dchws.tqmcube.com>
References: <1093567709.3959.15.camel@omega.paradigm-omega.net>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093567709.3959.15.camel@omega.paradigm-omega.net>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-08-26 at 20:48, Robin Lynn Frank wrote:
> Apologies if this is a dumb question but I am new to manipulating
> iptables directly.  There is a pest that has been routinely probing us. 
> While we simply drop them, I'd like to make it "uncomfortable" for them
> to continue.  When I attempt the following, I get the response
> indicated.  We are running Mandrake Linus 10.0 Official with a 2.6
> kernel.

I Frank.
> 
I use TARPIT. It is available in the latest POM which you can download.
You need the IPTables source code and the source for your kernel which
well then have to be recompiled. Make CERTAIN that you are not running
conntrack with TARPIT. 

> # /sbin/iptables -A INPUT -s ###.###.#.### -j TARPIT
> iptables: No chain/target/match by that name
> 
> Any help is appreciated.


