From: Jason Opperisano <opie@817west.com>
Subject: Re: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 01 Sep 2004 12:43:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094056991.1824.4.camel@wolfpack.ljm.dom>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<3063e5040831212267c70f95@mail.gmail.com>
	<8ca42282040901045464650094@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca42282040901045464650094@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 07:54, Mike wrote:
> I thought I had seen others on this list discuss starting with a
> completely closed router that denies all traffic - INPUT, OUTPUT, and
> FORWARD; filter, nat, and mangle.

yes, you have.  i don't personally agree with this (with respect to nat
& mangle).

> echo "   Set the filter/nat/mangle packet Matching Table Policy."
> $IPTABLES -t filter -P INPUT DROP
> $IPTABLES -t filter -P OUTPUT DROP
> $IPTABLES -t filter -P FORWARD DROP

good, good...

> $IPTABLES -t nat -P PREROUTING DROP
> $IPTABLES -t nat -P POSTROUTING DROP
> $IPTABLES -t nat -P OUTPUT DROP
> $IPTABLES -t mangle -P INPUT DROP
> $IPTABLES -t mangle -P OUTPUT DROP
> $IPTABLES -t mangle -P FORWARD DROP
> $IPTABLES -t mangle -P PREROUTING DROP
> $IPTABLES -t mangle -P POSTROUTING DROP

bad...  you will be in a world of hurt trying to get anything to work
with the policies of every nat & mangle chain set to drop.

filter in the filter table
nat in the nat table
mangle in the mangle table

the ultimate FM:
  http://iptables-tutorial.frozentux.net/iptables-tutorial.html

-j

-- 
Jason Opperisano <opie@817west.com>


