From: =?ISO-8859-1?Q?S=E9bastien_CRAMATTE?= <scramatte@zensoluciones.com>
Subject: IPMark won't compile on a vanilla 2.6.20 kernel
Date: Tue, 24 Apr 2007 15:54:09 +0200
Message-ID: <462E0C01.5080405@zensoluciones.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080005030200000501040402"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------080005030200000501040402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

IPMark won't compile on a vanilla 2.6.20 kernel
I obtain this error during the compilation under debian sarge 3.1

  CC [M]  net/ipv4/netfilter/ipt_TTL.o
  CC [M]  net/ipv4/netfilter/ipt_IPMARK.o
net/ipv4/netfilter/ipt_IPMARK.c: In function `target':
net/ipv4/netfilter/ipt_IPMARK.c:37: error: structure has no member named
`nfmark'
net/ipv4/netfilter/ipt_IPMARK.c:38: error: structure has no member named
`nfmark'
net/ipv4/netfilter/ipt_IPMARK.c: At top level:
net/ipv4/netfilter/ipt_IPMARK.c:77: warning: initialization from
incompatible pointer type
net/ipv4/netfilter/ipt_IPMARK.c:81: warning: initialization from
incompatible pointer type
make[4]: *** [net/ipv4/netfilter/ipt_IPMARK.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2
make[1]: Leaving directory
`/usr/src/sarge-router-0.3.2/linux/linux-2.6.20.7'

Any ideas ?


--------------080005030200000501040402--

