From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: how to automate ip_forward
Date: Thu, 8 Jul 2004 17:39:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708173920.5f89fc14.leslie.polzer@gmx.net>
References: <16ac01c464e3$1af42c20$49caa8c0@caris.priv>
	<20040708142235.4b2d0aa1.leslie.polzer@gmx.net>
	<200407081319.57035.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407081319.57035.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 8 Jul 2004 13:19:57 +0100
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Thursday 08 July 2004 1:22 pm, Patrick Leslie Polzer wrote:
> > How do you test?
> 
> cat /proc/sys/net/ipv4/ip_forward is a pretty reliable indicator :)
Sure ;), but maybe he just noticed that the box is not forwarding
any packets, which may of course be caused by a pre-installed FORWARD
DROP policy.

Leslie

