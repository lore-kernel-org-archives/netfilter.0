From: "Stuart Clouston" <uncystu@hotmail.com>
Subject: RE: Kernel 2.6.18 and quota match
Date: Wed, 27 Sep 2006 10:38:40 +1000
Message-ID: <BAY108-F8318177454C51278A866ABC1A0@phx.gbl>
References: <BAY103-F260770D20AB6DE0A57B3BB2240@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F260770D20AB6DE0A57B3BB2240@phx.gbl>
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
To: pupilla@hotmail.com
Cc: netfilter@lists.netfilter.org

Hi Marco,

Thanks for your help.  It looks as though it is all working properly now. 
Looks like my original problem was that I was using the standard iptables 
download from the http site when I should have been using the latest 
snapshot.  Also the fact that I wasn't sure whether patch-o-matic was 
required or not didn't help.

Thank you mostly for clearing up my understanding of this issue. ;-)

Thanks again,
Stuart Clouston

>From: "Marco Berizzi" <pupilla@hotmail.com>
>To: uncystu@hotmail.com
>CC: netfilter@lists.netfilter.org
>Subject: RE: Kernel 2.6.18 and quota match
>Date: Mon, 25 Sep 2006 10:50:00 +0200
>
>Stuart Clouston wrote:
>
>>With kernel 2.6.18, should I still need patch-o-matic-ng to get the quota 
>>match?
>
>No, don't patch your kernel sources, nor iptables sources.
>Try this procedure.
>Untar linux kernel 2.6.18 source wherever you want
>(for example under /usr/src/linux-2.6.18) and build
>it. Then untar iptables snapshot, 'cd' to iptables
>snapshot sources and run:
>
>make KERNEL_DIR=/usr/src/linux-2.6.18
>
>

_________________________________________________________________
Windows Live Spaces: share up to 500 photos per month, free 
http://spaces.live.com/


