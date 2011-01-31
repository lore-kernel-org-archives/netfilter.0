From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: ipt_NETFLOW for RHEL 6
Date: Mon, 31 Jan 2011 12:35:04 +0530
Message-ID: <4D465F20.6020409@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
	I am trying to compile ipt_NETFLOW module for RHEL 6, but the=20
compilation is giving error.  Should I run POM or do something before I=
=20
compile?

---------------------------------------------------------------------
root@ltchs20 ipt_netflow-1.6]# ./configure
Kernel version: 2.6.32-71.el6.x86_64
Iptables binary version: 1.4.7 (detected from /sbin/iptables)
Searching for iptables-1.4.7 sources..
=46ound iptables sources at ../iptables-1.4.7
Checking iptables sources version: 1.4.7 (ok)
Iptables module path: /lib64/xtables (from library)
Creating Makefile.. done.
   Now run: make all install

[root@ltchs20 ipt_netflow-1.6]# make all
Compiling for kernel 2.6.32-71.el6.x86_64
make -C /lib/modules/2.6.32-71.el6.x86_64/build=20
M=3D/root/seenu/ipt_netflow-1.6 modules
make[1]: Entering directory `/usr/src/kernels/2.6.32-71.el6.x86_64'
   CC [M]  /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.o
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91nf_seq_show=92=
:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:263: error: implicit=20
declaration of function =91HIPQUAD=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:265: warning: too few=20
arguments for format
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91hsize_procctl=
=92:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:305: warning: passing argumen=
t=20
5 of =91proc_dointvec=92 from incompatible pointer type
include/linux/sysctl.h:985: note: expected =91loff_t *=92 but argument =
is of=20
type =91size_t *=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:305: error: too many argument=
s=20
to function =91proc_dointvec=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91sndbuf_procct=
l=92:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:331: warning: passing argumen=
t=20
5 of =91proc_dointvec=92 from incompatible pointer type
include/linux/sysctl.h:985: note: expected =91loff_t *=92 but argument =
is of=20
type =91size_t *=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:331: error: too many argument=
s=20
to function =91proc_dointvec=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function=20
=91destination_procctl=92:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:349: warning: passing argumen=
t=20
5 of =91proc_dostring=92 from incompatible pointer type
include/linux/sysctl.h:983: note: expected =91loff_t *=92 but argument =
is of=20
type =91size_t *=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:349: error: too many argument=
s=20
to function =91proc_dostring=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function=20
=91aggregation_procctl=92:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:364: warning: passing argumen=
t=20
5 of =91proc_dostring=92 from incompatible pointer type
include/linux/sysctl.h:983: note: expected =91loff_t *=92 but argument =
is of=20
type =91size_t *=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:364: error: too many argument=
s=20
to function =91proc_dostring=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: At top level:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:409: warning: initialization=20
from incompatible pointer type
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:416: warning: initialization=20
from incompatible pointer type
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:424: warning: initialization=20
from incompatible pointer type
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:432: warning: initialization=20
from incompatible pointer type
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91usock_free=92=
:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:535: warning: format =91%u=92=
=20
expects type =91unsigned int=92, but argument 4 has type =91struct sock=
et *=92
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:535: warning: too few=20
arguments for format
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91add_usock=92:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:580: warning: too few=20
arguments for format
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91add_aggregati=
on=92:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:693: warning: too few=20
arguments for format
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: At top level:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:1245: warning: initialization=
=20
from incompatible pointer type
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91ipt_netflow_i=
nit=92:
/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:1315: error: =91struct=20
proc_dir_entry=92 has no member named =91owner=92
make[2]: *** [/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.o] Error 1
make[1]: *** [_module_/root/seenu/ipt_netflow-1.6] Error 2
make[1]: Leaving directory `/usr/src/kernels/2.6.32-71.el6.x86_64'
make: *** [ipt_NETFLOW.ko] Error 2
------------------------------------------------------------------

Regards,
Seenu.
