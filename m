From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets (SOLVED?)
Date: Mon, 10 Oct 2005 00:07:00 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510100006300.30581@filer.marasystems.com>
References: <20051007220642.4C94B3C65565@mailgate.informatik.haw-hamburg.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051007220642.4C94B3C65565@mailgate.informatik.haw-hamburg.de>
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
To: bernin_a@informatik.haw-hamburg.de
Cc: netfilter@lists.netfilter.org

On Fri, 7 Oct 2005 bernin_a@informatik.haw-hamburg.de wrote:

> Do i understand this correctly, the problem why the packets don't get
> masqueraded/natted properly is that they already have a conntrack entry
> before the nat rules are in place ??

Most likely this is the case in your setup, yes.

Regards
Henrik


