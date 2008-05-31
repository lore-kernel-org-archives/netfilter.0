From: Jesper Dangaard Brouer <hawk@diku.dk>
Subject: Re: iptables limit --limit limitations
Date: Sat, 31 May 2008 18:33:55 +0000 (UTC)
Message-ID: <loom.20080531T183021-215@post.gmane.org>
References: <f08c15d10805170020i2ac5a207g969c0ed5bf10867c@mail.gmail.com> <alpine.LNX.1.10.0805261319140.19084@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Jan Engelhardt <jengelh <at> medozas.de> writes:

> It is known that the algorithm in limit and hashlimit are not quite 
> accurate. Though, we seem to be out of solutions, too.

Here is a paper on it here:
 http://people.netfilter.org/acidfu/papers/limit-tbf-analysis.pdf

I don't know if the solution proposed has been implemented (and accepted
upstream)???

Cheers,
 Jesper Brouer

