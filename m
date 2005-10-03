From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: ip_nat_mangle_udp_packet: undersized packet
Date: Mon, 3 Oct 2005 14:22:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031420540.24889@filer.marasystems.com>
References: <4226a8f0509301353n4f736156p@mail.gmail.com> 
	<Pine.LNX.4.61.0509302321420.31223@filer.marasystems.com>
	<4226a8f0510030443m72c02cfj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4226a8f0510030443m72c02cfj@mail.gmail.com>
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
To: Caciano Machado <caciano@gmail.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

On Mon, 3 Oct 2005, Caciano Machado wrote:

>>> Anyone can tell what is the meaning of this message. I'm getting a lot
>>> of these warnings from kernel:
>>>
>>> "ip_nat_mangle_udp_packet: undersized packet"
>
> 2.4.25 with patch for sip conntrack helper, on ppc.

May be worth trying upgrading to a more recent kernel version.

Regards
Henrik

