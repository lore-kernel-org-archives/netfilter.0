From: lst_hoe01@kwsoft.de
Subject: Re: Perfomance problem on MIPS
Date: Thu, 01 Jun 2006 09:46:54 +0200
Message-ID: <20060601094654.a603gs9n082s4gc0@webmail.kwsoft.de>
References: <19506.060601@sigrand.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <19506.060601@sigrand.ru>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Zitat von art <art@sigrand.ru>:

> Hello all,
>
> I have some problem with using iptables:
> I work with Infineon ADM5120 SOC. It has MIPS32 4KC processor(200MHz),
> embedded ADM5120 switch (with 4 100Mbit interfaces).
> I get embedded Linux OS work on it.
> I test network bandwidth without iptables enabled in kernel - result
> 80Mbit/s.
> When I enable Connection tracking (I need NAT) & iptables and test
> WITOUT ANY RULES - bandwidth was near 35-40Mbi/s.
> Then I make several tests and find that most bandwidth reduction
> occurs when enabling Connection tracking.
>
> It's wery upset fact. What can be done with this? Can I get version
> where NAT not depend on Connection tracking?

For performance see

http://people.netfilter.org/kadlec/nftest.pdf

For NAT without conntrack use NOTRACK or disable connection tracking at all.

Regards

Andreas



