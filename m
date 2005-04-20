From: Jason Opperisano <opie@817west.com>
Subject: Re: Possibility to lock iptables rules.
Date: Wed, 20 Apr 2005 14:47:53 -0400
Message-ID: <20050420184753.GA25069@bender.817west.com>
References: <1113994155.31280.29.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113994155.31280.29.camel@localhost.localdomain>
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

On Wed, Apr 20, 2005 at 12:49:15PM +0200, Anders Fugmann wrote:
> Hi,
> 
> I would like to request a very simple feature: The possibility to lock
> all iptable rules in the kernel, making them immutable.
> 
> This would be usefull on machines which act both as a firewall and as a
> server. The problem today if an unwanted guest manages to break into the
> machine running the firewall and becomes root, the person can easilly
> change the rules, compromising the network guarded by the hacked
> firewall.
> 
> If it was somehow possible to lock the rules once setup, the attacker
> would be unable to modify the rules, the network guarded by the firewall
> would not (pending on how the firewall was setup) not be compromised,
> even if an attacker gained access to the firewall itself.

i'm guessing you're thinking about how the *BSD's have a concept of
kern.securelevel, and certain things (like firewall rules) become
immutable; even by root, at certain levels.

i'm not a kernel programmer, but i can tell you that the linux kernel
doesn't have anything like kern.securelevel; and without it, i don't
believe what you're asking for is possible.  i'd also figure that
implementing kern.securelevel in the linux kernel would be beyond the
scope of what the netfilter developers are responsible for.

-j

--
"Stewie: Careful! You're washing a baby's scalp, not scrubbing
 the vomit out of a Christmas dress, you stupid holiday drunk."
        --Family Guy

