From: <hard__ware@hotmail.com>
Subject: re:Problem Compiling iptables 1.2.7a
Date: Fri, 29 Nov 2002 16:01:41 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE32xxvo6KHqiwEbbhF00003e3a@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Aaron Clausen  maureen-taocow@alberni.net  stated .

;; I have applied the patch-o-matic patches to a fresh copy of the 2.4.19
;; kernel.  A few patches didn't go through, but nothing major.  I compiled
the
;; kernel, and that went without a hitch.  Now I go to compile the iptables
;; binary and libraries and this is what I get:

;; cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
;; -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o extensions/libipt_ah_sh.o -c
;; extensions/libipt_ah.c
;; ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
;; cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/
;; -DIPTABLES_VERSION=\"1.2.7a\"  -fPIC -o
extensions/libipt_conntrack_sh.o -c
;; extensions/libipt_conntrack.c
;; ect, ect , etc .

Gday Aaron .

i have also Recently been playing around with allot of the optional
patch-o-matic modules .

I found using a distro like RH 7.3 (with a minimal install) and then install
all the latest needed modules / updates

Then i use kernel 2.4.18-18.x or 2.4.18-3 with iptables 1.2.7a & the
patch-o-matic (i really only recommend installing base modules that you
need)

i have also previosly posted a message on how to get the ip_limit module
working -->
http://lists.netfilter.org/pipermail/netfilter/2002-September/038769.html

here is a list of patch-o-matiic modules that i have successfully compilled
as kernel modules & are tested & working ..

TTL Target Patch
IP Limit
quota
time
random

Also all submitted patches most of which are for 2.4.19x & 2.4.20 pre here
at http://www.netfilter.org/documentation/pomlist/pom-submitted.html
i also have working with my kernel configuration ..

if i can help in any way please let me know .. :D

P.S.   to all you kernel / netfilter hackin Newbies ..

when using the Patch-o-Matic or iptables source try using an "export" to set
your "KERNEL_DIR"

#> export KERNEL_DIR=/usr/src/linux.2.4.18.18x

Have Phun Everyone,  cyas ...

Hard__warE


