From: Jason Opperisano <opie@817west.com>
Subject: Re: firewall ignore the rule
Date: Wed, 13 Jul 2005 22:10:32 -0400
Message-ID: <20050714021032.GA26090@bender.817west.com>
References: <2452665f0507130352544ab556@mail.gmail.com>
	<1121252895.11584.6.camel@anduril.intranet.cartel-securite.net>
	<2452665f05071318551f788f42@mail.gmail.com>
	<20050714020155.GA26028@bender.817west.com>
	<2452665f0507131910300b00de@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <2452665f0507131910300b00de@mail.gmail.com>
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

On Thu, Jul 14, 2005 at 10:10:30AM +0800, liyas_m m wrote:
> so how do i block that source from transmitting/broadcasting packet?

use something that operates at layer 2.  arptables and ebtables come to
mind.

-j

--
"Stewie: What the hell is this?
 Lois: Stewie that's tuna salad.
 Stewie: Really? I could have sworn it was cat food."
        --Family Guy

