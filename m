From: Damjan <gdamjan@mail.net.mk>
Subject: Re: ipt_IPV4OPTSSTRIP & Linux 2.6.14.4
Date: Fri, 23 Dec 2005 20:21:40 +0100
Message-ID: <20051223192140.GE31628@legolas.on.net.mk>
References: <20051223174303.GB31822@nightfall.luchs.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051223174303.GB31822@nightfall.luchs.at>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

> [...]
>   CC [M]  net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.o
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c: In function `target':
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:33: warning: implicit declaration of function `skb_ip_make_writable'
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: structure has no member named `nfcache'
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: `NFC_ALTERED' undeclared (first use in this function)
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: (Each undeclared identifier is reported only once
> net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.c:52: error: for each function it appears in.)
> make[3]: *** [net/ipv4/netfilter/ipt_IPV4OPTSSTRIP.o] Error 1
> make[2]: *** [net/ipv4/netfilter] Error 2
> make[1]: *** [net/ipv4] Error 2
> make: *** [net] Error 2
> 
> A short "grep skb_ip_make_writable net/ipv4/netfilter/*.c" shows that
> skb_ip_make_writable() is only used in the IPV4OPTSSTRIP extension. Has
> anyone else seen this error?

skb_ip_make_writable is renamed to skb_make_writable, but that's a
"warning", it's not what causes the compile error(*). 

The compile error is because of this line :
	skb->nfcache |= NFC_ALTERED;

which I removed, not knowing what it does, and then ipt_IPV4OPTSSTRIP 
compiles... but I don't know if it works :)


* it would be problem if you tried to use the module, it
 wouldn't load because of missing symbols.


-- 
damjan | дамјан
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

