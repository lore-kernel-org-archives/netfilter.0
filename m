From: Michal Kepien <lordpopcorn@poczta.onet.pl>
Subject: Re: Firewall setup at boot - trouble with setting up the LOG target
Date: Fri, 04 Jul 2003 00:03:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <sj99gvs6k6p4ec2ca0uh03tfu0mj1rd1u5@4ax.com>
References: <7C9884991ADAE0479C14F10C858BCDF52E3554@alderaan.smgtec.com> <200307031946.11124.pc-secure@home.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200307031946.11124.pc-secure@home.nl>
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
To: Pascal Italiaander <pc-secure@home.nl>, netfilter@lists.netfilter.org

>Yes , syslog need to be started ,for iptables to log to /var/log/....

OK, I've changed the boot sequence - the system logger and kernel
logger are run before the firewall is set up and it did no good.

>I use the command "iptables -L -nv" for detailed rules.

I knew this one :)

>b.t.w , i tested your rules-set , no errors from iptables.

That's right, as it's not the matter of errors (as I suppose).

>try a "lsmod" to see if the LOG target is loaded.

When everything works as it should, the ipt_LOG module _is_ loaded,
however it is _not_ loaded automatically at boot time.

>Perhaps , a guess , when iptables compiled from source ,the LOG target =
was not=20
>created or with errors.That could explain this behaviour.

I don't think so... I've un-bz2-ed the iptables-1.2.8 archive, then
run 'make KERNEL_DIR=3D/usr/src/linux-2.4.19' and 'make install
KERNEL_DIR=3D/usr/src/linux-2.4.19' and then compiled the kernel. If
something went wrong, I should have received some information about it
during iptables compiling, right? Besides, the ipt_LOG module _works_,
and just isn't _loaded automatically_.


OK, here's some new information I found. In the /var/log/messages
file, I've found firewall entries long before iptables should be
loaded! Here's a sample:


-----START /var/log/messages-----
[...]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI ISAPNP enabled
ttyS00 at 0x03f8 (irq =3D 4) is a 16550A
ttyS01 at 0x02f8 (irq =3D 3) is a 16550A
ttyS02 at 0x03e8 (irq =3D 4) is a 16550A
>>>>>>>> iptables v1.2.3:=20
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with
idebus=3Dxx
PIIX4: IDE controller on PCI bus 00 dev 39
PIIX4: detected chipset, but driver not compiled in!
PIIX4: chipset revision 1
PIIX4: not 100%% native mode: will probe irqs later
     ide0: BM-DMA at 0xf000-0xf007, BIOS settings: hda:DMA, hdb:pio
     ide1: BM-DMA at 0xf008-0xf00f, BIOS settings: hdc:pio, hdd:pio
HPT366: onboard version of chipset, pin1=3D1 pin2=3D2
>>>>>>>> log-level `info' ambiguous
>>>>>>>> Try `iptables -h' or 'iptables --help' for more information.
HPT366: IDE controller on PCI bus 00 dev 98
PCI: Enabling device 00:13.0 (0005 -> 0007)
PCI: Found IRQ 11 for device 00:13.0
PCI: Sharing IRQ 11 with 00:0b.0
[...]
-----END /var/log/messages-----


The lines worth your attention are marked with '>>>>>>>>'. The
questions are:

1) Why the heck the printed version of iptables is 1.2.3, if I
compiled version 1.2.8 into the kernel?
2) Why are the outputs located in such a weird place and why are they
separated by hardware detection information?

And something more: the same output ('iptables v1.2.3: log-level
`info' ambigous, Try `iptables -h'...') as shown above is produced
when I run /etc/rc.d/init.d/firewall start (which is quite logical).
This is why I suspect the /etc/rc.d/init.d/firewall script, which
looks like this:

-----START /etc/rc.d/init.d/firewall-----
#!/bin/sh
#
# firewall      Bring up/down networking
#
# chkconfig: 2345 11 89
# description: Loads a modified version of the TrinityOS rc.firewall
rule set
# probe: true

#
-------------------------------------------------------------------------=
---
# # TrinityOS-firewall
# v11/11/00
#
# Part of the copyrighted and trademarked TrinityOS document.
# <url url=3D"http://www.ecst.csuchico.edu/~dranch">
#
# Written and Maintained by David A. Ranch
# dranch at trinnet dot net
#
# Updates
# -------
#
# 11/11/00 - Fixed an echo typo to say that the policy is REJECT
#            and added a MASQ list "mlist" option
# 10/08/00 - Changed the defaults when the firewall is stopped from
ACCEPT =20
#            to REJECT
#
#
-------------------------------------------------------------------------=
---


# Source function library.
. /etc/rc.d/init.d/functions

# Check that networking is up.
[ "XXXX${NETWORKING}" =3D "XXXXno" ] && exit 0

[ -x /sbin/ifconfig ] || exit 0

# See how we were called.
case "$1" in
  start)
    /etc/rc.d/rc.firewall
    ;;
  stop)
    echo -e "\nFlushing firewall and setting default policies to
DROP\n"
    iptables -P INPUT DROP
    iptables -P OUTPUT DROP
    iptables -P FORWARD DROP
    iptables -F
    iptables -X
    iptables -Z
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  status)
    iptables -L
    ;;
  mlist)
    iptables -M -L
    ;;
  *)
        echo "Usage: firewall {start|stop|restart|status|mlist}"
        exit 1
esac

exit 0
-----END /etc/rc.d/init.d/firewall-----

Why is this script run so early (see above)? What should I do about
this whole mess?

Thanks everybody for your help and sorry for a long post.

Michal Kepien

