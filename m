From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: [OBORONA-SPAM]  Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 18:34:28 +0300
Message-ID: <200502111834.28809.e-boogie@yandex.ru>
References: <200502111757.16352.e-boogie@yandex.ru>
	<20050211150635.GA2371@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050211150635.GA2371@bender.817west.com>
Content-Disposition: inline
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

On Friday 11 February 2005 18:06, Jason Opperisano wrote:
> On Fri, Feb 11, 2005 at 05:57:16PM +0300, Mikhail Zotov wrote:
> > Hello everybody,
> > 
> > I have written an iptables script to protect a machine/LAN
> > and I'd like to clarify an issue about RELATED ICMP packets
> > of type 3 (actually, mostly 3/1).
> > 
> > As far as I understand, it is safe to ACCEPT incoming
> > packets of this sort.
> 
> yes.  personally (for whatever that is worth), i allow ICMP Types 3, 11,
> and 12 [*].

Thank you for the reply!
I do ACCEPT ICMP packets of types 11 and 12, too.

> > Is it safe to allow _outgoing_ packets of this kind?
> > Can an attacker make my machine generate such packets
> > in order to obtain information about it?  (All new
> > incoming packets are just DROPped.)
> 
> yes.

Does "yes" correspond to "Is it safe...?" or to "Can an attacker..."?

Regards,
Mikhail

