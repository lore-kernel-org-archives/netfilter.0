From: David Cannings <lists@edeca.net>
Subject: Re: iptables and pdc microsoft
Date: Thu, 1 Apr 2004 19:06:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404011906.05972.lists@edeca.net>
References: <20040401142233.81442.qmail@web14305.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401142233.81442.qmail@web14305.mail.yahoo.com>
Content-Disposition: inline
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

On Thursday 01 April 2004 15:22, Luca Rossi wrote:
> Hi
> is true that wins is not supported that Iptables?

RFC1001 [1] WINS, which is what Microsoft implement [2], is an application 
level protocol that uses TCP or UDP, therefore there is no such notion 
that netfilter does or doesn't "support" it.  It uses ports the same as 
any other protocol so can be filtered in exactly the same way.

David

1 - http://www.faqs.org/rfcs/rfc1001.html
2 - 
http://www.microsoft.com/windows2000/en/server/help/default.asp?url=/windows2000/en/server/help/sag_WINS_ovr_WhatIs.htm

