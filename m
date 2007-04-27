From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Wireless Login Page
Date: Fri, 27 Apr 2007 17:17:07 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704271716460.506@yvahk01.tjqt.qr>
References: <1177606092.3828.108.camel@ws1.walco02.com>
	<00d501c788c0$f460c730$0a00080a@rhea>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00d501c788c0$f460c730$0a00080a@rhea>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex <alex@hackgod.org>
Cc: netfilter@lists.netfilter.org


On Apr 27 2007 12:41, Alex wrote:
>
> You don't need contrack for the redirection part. I've achived the same thing
> on my router using -j REDIRECT

REDIRECT does use connection tracking (by means of a NAT mapping).


Jan
-- 

