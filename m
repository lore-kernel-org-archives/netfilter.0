From: Damjan <gdamjan@mail.net.mk>
Subject: Undefined symbols in ipt_XOR ipt_TARPIT with 2.6.14 kernel
Date: Tue, 8 Nov 2005 19:57:10 +0100
Message-ID: <20051108185710.GA14750@legolas.on.net.mk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I've got patch-o-matic-ng-20051107 and after patching and compiling I
get this:

*** Warning: "skb_ip_make_writable" [net/ipv4/netfilter/ipt_XOR.ko]
undefined!
*** Warning: "sysctl_ip_default_ttl" [net/ipv4/netfilter/ipt_TARPIT.ko]
undefined!

It seems these symbols are no longer EXPORTED? Or I'm missing some
patch?


-- 
damjan | дамјан
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

