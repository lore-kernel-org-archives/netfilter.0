From: a.ledvinka@promon.cz
Subject: Re: FC2 + PowerEdge 2650 + smp kernel + iptables rules loading slow
Date: Wed, 8 Dec 2004 14:49:45 +0100
Message-ID: <OF65BF2D17.381C440F-ONC1256F64.004BB9DF-C1256F64.004BF797@promon.cz>
References: <41B5DBB3.1030009@net-m.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B5DBB3.1030009@net-m.de>
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
To: Iulian Topliceanu <iulian.topliceanu@net-m.de>
Cc: netfilter@lists.netfilter.org

> I've tried several iptables verions but the results were the same.
> 
> The question: why? :)
just first guess.

are not you trying to add rules which use DNS or other name system names 
instead of IP addresses?
(before the name system is availaible(notwork down) or after name system 
become unavailaible(iptables policies and rules))

