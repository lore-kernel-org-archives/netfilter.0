From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: [OT?] URL rewriting
Date: Wed, 12 Oct 2005 23:04:17 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510122301510.31374@filer.marasystems.com>
References: <NEBBKBPLMLNABNADCIPAIENCBIAB.dleangen@canada.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPAIENCBIAB.dleangen@canada.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Leangen <dleangen@canada.com>
Cc: netfilter@lists.netfilter.org

On Wed, 12 Oct 2005, David Leangen wrote:

> Can iptables do URL rewriting?

You may be able to write a NAT helper doing this to a limited extent, but 
out of the box no.

Better to use a HTTP proxy.

> What do you recommend?

Well, Squid obviously, but then I am perhaps somewhat biased..

> Generally, I want to have one URL space as a public interface to my network.
> Services will be provided internally from various ports at different IP
> addresses, but all accessible publicly through the same URL space. IIUC,
> this is "reverse proxying".

It is.

Regards
Henrik

