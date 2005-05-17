From: =?utf-8?b?0J/RkdGC0YAg0JLQvtC70LrQvtCy?=
	=?utf-8?b?INCQ0LvQtdC60YHQsNC90LTRgNC+0LLQuNGH?= <pvolkov@mics.msu.su>
Subject: connlimit: Problems with patching kernel?
Date: Tue, 17 May 2005 10:33:55 +0400
Message-ID: <200505171033.55694.pvolkov@mics.msu.su>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello.

I need help with connlimit extention. My problem is that when I issue:
iptables -A INPUT -p tcp --syn --dport 23 -m connlimit --connlimit-above 10=
 -j=20
REJECT
I get an error:
iptables: No chain/target/match by that name

It seems to me that I have not patched kernel, as I do not=20
have /usr/src/linux/include/linux/netfilter_ipv4/ipt_connlimit.h in my kern=
el=20
sources. From HOWTO I know that I need to run runme to patch iptables and=20
kernel.  But when I issue command, it tells me that I've already have patch=
ed=20
kernel and iptables:

************listing of runme*************
# ./runme connlimit
Hey! KERNEL_DIR is not set.
Where is your kernel source directory? [/usr/src/linux]
Hey! IPTABLES_DIR is not set.
Where is your iptables source code directory?=20
[/usr/src/iptables] /root/iptables
Loading patchlet=20
definitions................................................................=
=2E.....................=20
done

Welcome to Patch-o-matic ($Revision: 3733 $)!

Kernel: =C2=A0 2.6.11, /usr/src/linux
Iptables: 1.3.1, /root/iptables
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
=2D------------------------------------------------------
Already applied:

Excellent! Source trees are ready for compilation.
****************end of listing runme*********************

I had the only kernel in my directory. I have right symlink. I exported=20
KERNEL_DIR, IPTABLES_DIR, tried vanilla sources, but still no luck.
Why ./runme tell me that everything is patched although it's not? How runme=
=20
checks that I have this patch installed? Can I can install patch manually?

BTW. iptables are patched normaly and I=20
have: /usr/local/lib/iptables/libipt_connlimit.so file. What is the problem=
=20
with kernel. Where is my problem?

Thank you for your help in advance,
Peter.

