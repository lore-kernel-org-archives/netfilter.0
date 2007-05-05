From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Advanced routing problem
Date: Sat, 05 May 2007 17:47:36 +0200
Message-ID: <463CA718.4060509@rtij.nl>
References: <1178377643.463c9daba4959@www.umrk.to>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1178377643.463c9daba4959@www.umrk.to>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jaap Winius <jwinius@umrk.to>
Cc: netfilter@lists.netfilter.org

Jaap Winius wrote:
> Hi all,
>   

Ha Jaap,

> After having configured my first iptables firewall, it looks as though
> I've already found something it can't handle. Well, I hope not...
>
> All was fine until a secondary external interface was added. I was
> hoping that I could configure the firewall to allow remote users to use
> either external interface to access a Windows server on a private net
> behind the firewall using VNC.
>
> At first I couldn't access the firewall via the secondary external
> interface at all, because the firewall was routing its responses out
> its default route -- the primary external interface -- and the ISP was
> dropping those packets (hot potato routing). However, after installing
> the advanced routing package (iproute), I configured a second default
> route and solved that problem.
>   

That's strange. that means you have some very funny routing. You'ld 
better explain how your routing is set up. Also post the output of 'ip ro'.

M4


