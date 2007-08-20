From: =?koi8-r?B?68HOydfFwyDuycvPzMHK?= <n_kanivets@futureservice.ru>
Subject: ipt_time.c problem
Date: Mon, 20 Aug 2007 16:36:38 +0400
Message-ID: <010201c7e326$c10aa070$0511a8c0@Sklifer>
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

Hello, all.

I have encountered the problem of compiling "time" match extension for
2.6.21.5 kernel. After searching netfilter-devel-maillist I have found the
patch to sort this:
http://patchwork.netfilter.org/netfilter-devel/patch.pl?id=321

but I can not apply it successfuly.
 Trying patch command fails with at least one hunk.
 Trying to modify it manually also fails. It could be because my
undestanding of *.patch syntax is wrong.

Anyway, as the question is very-very urgent for me, could someone give the
100% working and patched source of ipt_time.c please ??


BTW, I'm using patchlet dated 20060701.

Many thanks in advance.
Nikolay.

e-mail: n_kanivets@futureservice.ru


