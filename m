From: Bob McLaren <BobMcLaren@fssi-ca.com>
Subject: Can't compile 1.2.11 because of dstlimit?
Date: Tue, 06 Jul 2004 14:41:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40EB1C80.4050108@fssi-ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I don't patch/recompile my kernels or applications very often so please 
let me know what I've done wrong here.

In order to take advantage of the 'time' match capability of iptables, I 
have upgraded from
iptables-1.2.8-8.72.3 on linux-2.4.20-18.7
to
iptables-1.2.11 on linux-2.4.20-18.7custom (enabled ipt_time)
(note: This is on a RedHat 7.3 box)

I have successfully recompiled my kernel.  But now, when I attempt to 
compile iptables, I get an error regarding "dstlimit".
I don't necessarily need dstlimit, so I tried disabling it in my kernel 
options (although I didn't recompile the kernel after that), but that 
doesn't seem to fix the problem.

Here is an extract of the error that I see when I run make for 
iptables.  ANY help or a point in the right direction would be greatly 
appreciated.
-------------------------------------------------------------------------------
ld -shared  -o extensions/libipt_TRACE.so extensions/libipt_TRACE_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.20-18.7/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.2.11\"  -fPIC -o extensions/libipt_TTL_sh.o -c 
extensions/libipt_TTL.c
ld -shared  -o extensions/libipt_TTL.so extensions/libipt_TTL_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.20-18.7/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.2.11\"  -fPIC -o extensions/libipt_ULOG_sh.o -c 
extensions/libipt_ULOG.c
ld -shared  -o extensions/libipt_ULOG.so extensions/libipt_ULOG_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.20-18.7/include -Iinclude/ 
-DIPTABLES_VERSION=\"1.2.11\"  -fPIC -o extensions/libipt_dstlimit_sh.o 
-c extensions/libipt_dstlimit.c
extensions/libipt_dstlimit.c: In function `init':
extensions/libipt_dstlimit.c:104: structure has no member named `cfg'
extensions/libipt_dstlimit.c:105: structure has no member named `cfg'
extensions/libipt_dstlimit.c:106: structure has no member named `cfg'
extensions/libipt_dstlimit.c: In function `parse':
extensions/libipt_dstlimit.c:138: structure has no member named `cfg'
-------------------------------------------------------------------------------


