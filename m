From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: error building iptables from cvs
Date: Mon, 9 Dec 2002 15:39:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212091539.45341.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

[root@fw iptables2]# make
Making all in .
make[1]: Entering directory `/usr/src/netfilter/iptables2'
make[1]: Nothing to be done for `all-am'.
make[1]: Leaving directory `/usr/src/netfilter/iptables2'
Making all in include
make[1]: Entering directory `/usr/src/netfilter/iptables2/include'
make[1]: Leaving directory `/usr/src/netfilter/iptables2/include'
Making all in libnfnetlink
make[1]: Entering directory `/usr/src/netfilter/iptables2/libnfnetlink'
cd . && aclocal
/bin/sh ./config.status --recheck
=2E/config.status: ./config.status: No such file or directory
make[1]: *** [config.status] Error 127
make[1]: Leaving directory `/usr/src/netfilter/iptables2/libnfnetlink'
make: *** [all-recursive] Error 1
[root@fw iptables2]#

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


