From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: something stupid
Date: Thu, 6 Oct 2005 19:03:58 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510061903060.31577@filer.marasystems.com>
References: <1128493268.31931.9.camel@tholian.starken.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1128493268.31931.9.camel@tholian.starken.com>
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
To: Daniel Wittenberg <daniel-wittenberg@starken.com>
Cc: netfilter@lists.netfilter.org

On Wed, 5 Oct 2005, Daniel Wittenberg wrote:

> I think it's late and I've got to be missing something here.  I have 2
> interfaces to different ISP's.  The second interface, eth1, responds
> just fine on the primary IP ".189".  I have an alias interface .188 that
> when I apply an iptables rule to, gets no traffic at all.

alias interface? IP aliases all belong to the same interface (eth1), even 
if you give them a label.

What does your rules look like?

Regards
Henrik

