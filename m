From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: what have I done wrong to make 1.2.7a not compile?
Date: Thu, 20 Feb 2003 10:01:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019BB2@hslex01.hslbz.local>
References: <FD8F124A387AD6119F7900A0D218B32172544A@hslex01.hslbz.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B32172544A@hslex01.hslbz.local>
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
Cc: Netfilter development <netfilter-devel-admin@lists.netfilter.org>

> [mailto:netfilter-admin@lists.netfilter.org] Namens Scott van Looy

> extensions/libipt_ROUTE.c: In function `print':
> extensions/libipt_ROUTE.c:119: structure has no member named `if_name'
> extensions/libipt_ROUTE.c:120: structure has no member named `if_name'
> extensions/libipt_ROUTE.c:122: structure has no member named
`if_index'
> make: *** [extensions/libipt_ROUTE_sh.o] Error 1
> 
> What's wrong then? :)

Well, I had the same problem.

Another person emailed me with the same question :
---
> I have the same problem that You discribed in 
> http://lists.netfilter.org/pipermail/netfilter/2002-December/0
> 40741.html.
> I'm doing excacly the same thing, but POM is in newest 
> version.Can I ask, did You resolve it? I'm trying to do 
> something with it, but it's hopeless. If You know how to 
> handle with it, please tell me.
---

I resolved the problem doing this :

In the IPTables package, "extensions/libipt_ROUTE.c" :
- rename all instances of "if_name" to "ifname",
- rename all instances of "if_index" to "ifindex".

In the kernel "include/linux/netfilter_ipv4/ipt_ROUTE.h" :
There is a section :
struct ipt_route_target_info {
	char ifname[IPT_ROUTE_IFNAMSIZ];
	unsigned int ipto;
};

The ifindex is missing, so change it into this :

struct ipt_route_target_info {
	char ifname[IPT_ROUTE_IFNAMSIZ];
	unsigned int ifindex;
	unsigned int ipto;
};


Again, I don't know if it's correct what I've done (I'm not a C
programmer ; I'm just trying to get it right) and I asked this question
twice (perhaps in the wrong list) with no response.
So far I don't have problems with it.


Rob


