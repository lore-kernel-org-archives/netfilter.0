From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: port forwarding AND local application consumption...
Date: Thu, 28 Sep 2006 10:29:11 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609281026230.21498@yvahk01.tjqt.qr>
References: <451AE547.8090409@eternet.cc>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451AE547.8090409@eternet.cc>
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
To: Lucas Diaz <lucasdiaz@eternet.cc>
Cc: netfilter@lists.netfilter.org

> I use kernel 2.4.x.
> I need to do port forwarding to a remote host AND to
> pass these packets to a local application.
>
> I used the DNAT feature in iptables and it does the
> port forwarding. But the issue is that these forwarded
> packets are unreachable to local application.

Of course, you just changed the IP address to something else than your 
own box. With DNAT, you explicitly 'give' up the connection for the 
local host.

>
> Any tips about proper iptables' rules to accomplish both?

Apart from writing your own target extensions, I know of none. Might use 
ipt_ROUTE as a base, it contains a --tee option.


Jan Engelhardt
-- 

