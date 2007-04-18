From: dominiaz <dominiaz@gmail.com>
Subject: ipt_connlimit.c + kernel 2.6.20 = big problem. HELP
Date: Wed, 18 Apr 2007 16:10:57 +0200
Message-ID: <462626F1.6050402@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
	b=HacCfDQ05jJRoaJDfGFKYzFByBOzFD/6rlCaD+Vkij225t5ClwsdshavSphWn8tB8bYuDgizztfVVN3VCttmaIVt9ANvfsvcTOd5ZiQGvL/rjU9SOpoa3VIzSKRcoLCulyV3d6N3g4KaCERv08qu+Q4pv/mmDyNcrxNoVqxltLk=
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
To: netfilter@lists.netfilter.org

Hello!

I`ve got the newest snapshot of p-o-m from 14.04.2007. When i include
ipt_connlimit.c to my kernel something isn`t ok. When i try to compile
it then get an error like:

net/built-in.o: In function `match':
ipt_connlimit.c:(.text+0x6ae49): undefined reference to
`nf_conntrack_find_get'
make: *** [.tmp_vmlinux1] Error 1

Does someone know how to resolve that problem?


