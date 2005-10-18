From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: compiling ip_set_iptree.o
Date: Tue, 18 Oct 2005 11:35:56 +0800
Message-ID: <00e501c5d395$0cb95eb0$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 
Compiling ip_set_iptree.o as module get this error :-

 CC [M]  net/ipv4/netfilter/ip_set_iptree.o
net/ipv4/netfilter/ip_set_iptree.c:123: error: parse error before "flags"
net/ipv4/netfilter/ip_set_iptree.c:124: warning: function declaration isn't a prototype
net/ipv4/netfilter/ip_set_iptree.c: In function `__addip':
net/ipv4/netfilter/ip_set_iptree.c:125: error: `set' undeclared (first use in this function)
net/ipv4/netfilter/ip_set_iptree.c:125: error: (Each undeclared identifier is reported only once
net/ipv4/netfilter/ip_set_iptree.c:125: error: for each function it appears in.)
net/ipv4/netfilter/ip_set_iptree.c:132: error: `hash_ip' undeclared (first use in this function)
net/ipv4/netfilter/ip_set_iptree.c:132: error: `ip' undeclared (first use in this function)
net/ipv4/netfilter/ip_set_iptree.c:135: error: `flags' undeclared (first use in this function)
net/ipv4/netfilter/ip_set_iptree.c:141: error: `timeout' undeclared (first use in this function)
make[4]: *** [net/ipv4/netfilter/ip_set_iptree.o] Error 1

Regards.




