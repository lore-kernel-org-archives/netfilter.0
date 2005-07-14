From: Jason Opperisano <opie@817west.com>
Subject: Re: firewall ignore the rule
Date: Wed, 13 Jul 2005 22:01:55 -0400
Message-ID: <20050714020155.GA26028@bender.817west.com>
References: <2452665f0507130352544ab556@mail.gmail.com>
	<1121252895.11584.6.camel@anduril.intranet.cartel-securite.net>
	<2452665f05071318551f788f42@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <2452665f05071318551f788f42@mail.gmail.com>
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

On Thu, Jul 14, 2005 at 09:55:23AM +0800, liyas_m m wrote:
> i have done that and checked with ethereal..still that source address
> is not blocked. It is still broadcasting ARP packets..a lot.

iptables/netfilter operates at layer 3.  therefore, packets generated or
received at layer 2 cannot be blocked with iptables/netfilter.
ethereal/iptraf operate at the BPF layer (layer 2), and arp packets are
layer 2 as well.

iptables/netfilter is not at fault; you have an invalid testing
methodology.

-j

--
"Peter: Brian, there's a message in my Alpha Bits. It says "OOOOOO".
 Brian: Peter, those are Cheerios."
        --Family Guy

