From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: iptables & ebtables
Date: Sun, 16 Oct 2005 19:38:51 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510161937480.32106@filer.marasystems.com>
References: <20051015082648.4FCF8F88@smtp.263.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051015082648.4FCF8F88@smtp.263.net>
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
To: bend chen <boy2eye@263.net>
Cc: netfilter <netfilter@lists.netfilter.org>

On Sat, 15 Oct 2005, bend chen wrote:

> If I used ebtables process a package,but need iptables can't process THIS package,how can I do?

What kind of packet is it?

If you have set a mark in ebtables then you can look for this mark in 
iptables using the mark match.

Regards
Henrik

