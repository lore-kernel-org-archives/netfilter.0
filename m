From: Jason Opperisano <opie@817west.com>
Subject: Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 10:06:36 -0500
Message-ID: <20050211150635.GA2371@bender.817west.com>
References: <200502111757.16352.e-boogie@yandex.ru>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200502111757.16352.e-boogie@yandex.ru>
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

On Fri, Feb 11, 2005 at 05:57:16PM +0300, Mikhail Zotov wrote:
> Hello everybody,
> 
> I have written an iptables script to protect a machine/LAN
> and I'd like to clarify an issue about RELATED ICMP packets
> of type 3 (actually, mostly 3/1).
> 
> As far as I understand, it is safe to ACCEPT incoming
> packets of this sort.

yes.  personally (for whatever that is worth), i allow ICMP Types 3, 11,
and 12 [*].

> Is it safe to allow _outgoing_ packets of this kind?
> Can an attacker make my machine generate such packets
> in order to obtain information about it?  (All new
> incoming packets are just DROPped.)

yes.  an open plea to all firewall administrators:

  please stop breaking our Internet!!!

-j

* http://www.iana.org/assignments/icmp-parameters

--
"You couldn't fool your mother on the foolingest day of your life if
 you had an electrified fooling machine."
        --The Simpsons

