From: "wei shuxi" <shuxi_w@seu.edu.cn>
Subject: tcp-window-tracking patch in 2.4.20
Date: Tue, 20 Sep 2005 16:54:30 +0800
Message-ID: <13201.279185205$1127206404@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-2022-jp"
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

Hi all,

 I failed to patch tcp-window-tracking and nf-log

my kernel 2.4.20-8
patch-o-matic-ng-20050913

and i found the nf-log patch is for kernel 2.4.31
                                           ~~~~~~~~? 
--------------------------------------------------------------
=09The functionality relies on the available "backend" logging
modules (ipt_LOG or ipt_ULOG). At least one of the logging
modules must be loaded in, otherwise no log will be generated.
If both modules are available in the kernel, then the firstly
registered (loaded) will handle the logging.
-----------------------------------------------------------------=

Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
cannot apply (3 rejects out of 23 hunks)

-----------------------------------------------------------------=

=A1=A1=A1=A1=A1=A1
Any ideas?
 =09=09=09=09

=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1wei shuxi
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1shuxi_w@seu.edu.cn
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12005-09-20



