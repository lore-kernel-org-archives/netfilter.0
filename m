From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: Problem: ISA card & iptables (2.4.26) - disappearing packets
Date: Mon, 19 Jul 2004 17:29:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FBE8C1.CF721322@knoware.nl>
References: <40F8D503.3040608@polbox.com> <200407180939.37668.Antony@Soft-Solutions.co.uk> <40F8E16B.2020808@polbox.com> <200407181140.35100.Antony@Soft-Solutions.co.uk>
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

Antony Stone schreef:

> >
> > It's ISA PnP card so it's autoconfigured. I've checked and there is no
> > conflicts :(
>
> Are you sure it is actually being fully configured?   Are you doing the PnP
> setup in the Bios, or under Linux?
>

In my firewall based on Debian I have a 3Com Etherlink III card. I have
the
drivers for that card build in the kernel, not as modules (why using
modules if a
module is constantly loaded).Next I have written a script to activate
the card
(/etc/init.d/isapnp):
#!/bin/sh
#
# isapnp initialize isa-pnp devices
#
PATH="/sbin:/bin:/usr/sbin:/usr/bin"
case "$1" in
  start|restart)
    if [ -r /etc/isapnp.conf ]
    then
      if [ ! -e /proc/isapnp ]
      then
        if [ -e /lib/modules/`uname -r`/kernel/drivers/pnp/isa-pnp.o ]
        then
          modprobe isa-pnp
          result=$?
          if [ $result -ne 0 ]
          then
            exit 2
          fi
        else
          exit 1
        fi
      fi

      cat /etc/isapnp.conf >/proc/isapnp
    fi
    ;;
  stop)
    ;;
esac

And the configuration in /etc/isapnp.conf:
card 0 TCM5095
dev 0 TCM5095
port 0 0x220
irq 0 5
activate

Read kernel-source-'version'/Documentation/isapnp.txt for the options
Finaly I have created a symlink from /etc/rcS.d/S15isapnp to
../init.d/isapnp

Be sure that there are no IRQ's or Port conflicts, or you will find
difficulties
activating cards.


>
>
> Regards,
>
> Antony.
>
> --


Regards
--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B
GPG PblKey fprnt=ED20 0F25 C233 DC59 3FFA  170E D0BF 15F5 0BA6 1355


