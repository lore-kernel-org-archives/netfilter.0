From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: DNAT problem
Date: Mon, 02 Oct 2006 14:48:37 +0200
Message-ID: <BAY103-F3134519578B54418B4FF25B21F0@phx.gbl>
References: <4520ED15.5090205@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4520ED15.5090205@plouf.fr.eu.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pascal.mail@plouf.fr.eu.org
Cc: netfilter@lists.netfilter.org

Pascal Hambourg wrote:

>The SAME target won't do round robin for the same source address. It will 
>only do round robin for separate source addresses.

You could try with the nth match (it is called statistic match
since 2.6.18, and you need iptables 1.3.6).

>What about the BALANCE target ? It's in the man page, but I had never heard 
>of it.

This is from ipt_SAME.c:

copied ipt_BALANCE.c to ipt_SAME.c and changed a few things.



