From: "Stuart Clouston" <uncystu@hotmail.com>
Subject: Kernel 2.6.18 and quota match
Date: Fri, 22 Sep 2006 10:55:13 +1000
Message-ID: <BAY108-F3CD4343FDF322275C0034BC210@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi All,

I am experiencing a problem with the quota match under kernel version 
2.6.18.  (worked ok under kernel 2.6.16.4)

With just the quota match option enabled in the kernel config, trying to use 
the quota match reported an error that it couldn't locate the 
libipt_quota.so file. Is it still necessary to use patch-o-matic-ng to 
obtain the quota match now that kernel 2.6.18 has it as an option?

I have applied the quota patch from the pom-ng-20060511 snapshot anyway and 
I now get the following error whenever I attempt to create a rule using the 
quota match:
On screen: "invalid argument"
syslog:  ip_tables: quota match: invalid size 0 != 24

iptables 1.3.5 source is from ftp://ftp.netfilter.org/pub/iptables.  (Is 
this the correct version of iptables to use or should I be using the latest 
version from the snapshot directory on the ftp server?)

Thanks,
Stu

_________________________________________________________________
Research and compare new cars side by side at carpoint.com.au 
http://a.ninemsn.com.au/b.aspx?URL=http%3A%2F%2Fsecure%2Dau%2Eimrworldwide%2Ecom%2Fcgi%2Dbin%2Fa%2Fci%5F450304%2Fet%5F2%2Fcg%5F801459%2Fpi%5F1004813%2Fai%5F833884&_t=54321&_r=hotmail_endtext&_m=EXT


