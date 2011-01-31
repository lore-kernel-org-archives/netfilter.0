From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: ipt_NETFLOW for RHEL 6
Date: Mon, 31 Jan 2011 13:02:28 +0530
Message-ID: <4D46658C.3000309@linux.vnet.ibm.com>
References: <4D465F20.6020409@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D465F20.6020409@linux.vnet.ibm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

On Monday 31 January 2011 12:35 PM, Srinivasa T N wrote:
> Hi,
> I am trying to compile ipt_NETFLOW module for RHEL 6, but the
> compilation is giving error. Should I run POM or do something before =
I
> compile?
>
> ---------------------------------------------------------------------
> root@ltchs20 ipt_netflow-1.6]# ./configure
> Kernel version: 2.6.32-71.el6.x86_64
> Iptables binary version: 1.4.7 (detected from /sbin/iptables)
> Searching for iptables-1.4.7 sources..
> Found iptables sources at ../iptables-1.4.7
> Checking iptables sources version: 1.4.7 (ok)
> Iptables module path: /lib64/xtables (from library)
> Creating Makefile.. done.
> Now run: make all install
>
> [root@ltchs20 ipt_netflow-1.6]# make all
> Compiling for kernel 2.6.32-71.el6.x86_64
> make -C /lib/modules/2.6.32-71.el6.x86_64/build
> M=3D/root/seenu/ipt_netflow-1.6 modules
> make[1]: Entering directory `/usr/src/kernels/2.6.32-71.el6.x86_64'
> CC [M] /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.o
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91nf_seq_show=
=92:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:263: error: implicit
> declaration of function =91HIPQUAD=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:265: warning: too few
> arguments for format
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91hsize_procc=
tl=92:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:305: warning: passing argum=
ent
> 5 of =91proc_dointvec=92 from incompatible pointer type
> include/linux/sysctl.h:985: note: expected =91loff_t *=92 but argumen=
t is of
> type =91size_t *=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:305: error: too many argume=
nts
> to function =91proc_dointvec=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91sndbuf_proc=
ctl=92:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:331: warning: passing argum=
ent
> 5 of =91proc_dointvec=92 from incompatible pointer type
> include/linux/sysctl.h:985: note: expected =91loff_t *=92 but argumen=
t is of
> type =91size_t *=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:331: error: too many argume=
nts
> to function =91proc_dointvec=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function
> =91destination_procctl=92:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:349: warning: passing argum=
ent
> 5 of =91proc_dostring=92 from incompatible pointer type
> include/linux/sysctl.h:983: note: expected =91loff_t *=92 but argumen=
t is of
> type =91size_t *=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:349: error: too many argume=
nts
> to function =91proc_dostring=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function
> =91aggregation_procctl=92:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:364: warning: passing argum=
ent
> 5 of =91proc_dostring=92 from incompatible pointer type
> include/linux/sysctl.h:983: note: expected =91loff_t *=92 but argumen=
t is of
> type =91size_t *=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:364: error: too many argume=
nts
> to function =91proc_dostring=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: At top level:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:409: warning: initializatio=
n
> from incompatible pointer type
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:416: warning: initializatio=
n
> from incompatible pointer type
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:424: warning: initializatio=
n
> from incompatible pointer type
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:432: warning: initializatio=
n
> from incompatible pointer type
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91usock_free=92=
:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:535: warning: format =91%u=92
> expects type =91unsigned int=92, but argument 4 has type =91struct so=
cket *=92
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:535: warning: too few
> arguments for format
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91add_usock=92=
:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:580: warning: too few
> arguments for format
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91add_aggrega=
tion=92:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:693: warning: too few
> arguments for format
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: At top level:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:1245: warning: initializati=
on
> from incompatible pointer type
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c: In function =91ipt_netflow=
_init=92:
> /root/seenu/ipt_netflow-1.6/ipt_NETFLOW.c:1315: error: =91struct
> proc_dir_entry=92 has no member named =91owner=92
> make[2]: *** [/root/seenu/ipt_netflow-1.6/ipt_NETFLOW.o] Error 1
> make[1]: *** [_module_/root/seenu/ipt_netflow-1.6] Error 2
> make[1]: Leaving directory `/usr/src/kernels/2.6.32-71.el6.x86_64'
> make: *** [ipt_NETFLOW.ko] Error 2
> ------------------------------------------------------------------
>
> Regards,
> Seenu.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>

I compiled NETFLOW-1.7 and it compiled smoothly on my RHEL box.

Regards,
Seenu.
