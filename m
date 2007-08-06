From: <bblount@Automationdirect.com>
Subject: U32 Netfilter Module
Date: Mon, 6 Aug 2007 09:37:12 -0400
Message-ID: <2D6500C11B9BB7449D65291CE922EACF09C85702@srv-mail03.automationdirect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

I would like to use the U32 match with IPTables. I am having a huge
amount of trouble getting it to work though. I have tried POM-ng, the
xt_u32 patch on the dev list, SVN versions of IP Tables, IP Tables
1.3.8, 1.3.5, all to no avail. I am compiling the U32 module as a module
in the kernel, and every time I have gotten iptables: Invalid Argument
when I try to use iptables -A INPUT -m u32 --u32 '2&0xFFFF=3D0x2:0x0100'
-j DROP or anything related to u32. dmesg shows: ip_tables: u32 match:
invalid size 1984 !=3D 2028. I have tried changing the defines in
/usr/src/linux/include/linux/netfilter/xt_u32.h so that the structure
has the same size, but I'm a bit worried this will break other things
(and it didn't fix it anyway).=20

Has anyone had any luck with this module, and if so, what versions are
you using and where did you get the U32 module?

I'm currently using gentoo patched kernel 2.6.21-r4 and iptables 1.3.8.

Thanks!

