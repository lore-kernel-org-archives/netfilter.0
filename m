From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Limit connections per IP
Date: Sun, 1 Apr 2007 23:55:57 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704012355420.1245@yvahk01.tjqt.qr>
References: <8d158e1f0703231031g261ca993s7c9e4f3ef62108c8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8d158e1f0703231031g261ca993s7c9e4f3ef62108c8@mail.gmail.com>
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
To: Patrick Ale <patrick.ale@gmail.com>
Cc: netfilter@lists.netfilter.org


On Mar 23 2007 18:31, Patrick Ale wrote:
> I want to limit the connections per IP on port 80 to 4.
>
> I googled a lot and found several options, iplimit, connlimit-above..
> But none of these seem to be available for me :(
>
> I run kernel 2.6.21-rc4-git7 and also tried 2.6.20.3 with iptables
> 1.3.7 and the path-o-matic patch set.
>
> Any ideas?

D/L pom-ng, run ./download and let ipt_connlimit compile.


Jan
-- 

