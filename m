From: Trevor Morrison <trevor@hailix.com>
Subject: Errors on startup of iptables 1.2.8
Date: Sat, 10 May 2003 18:09:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EBD94A2.D9B53124@hailix.com>
Reply-To: trevor@hailix.com
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
To: netfilter <netfilter@lists.netfilter.org>

  Hi,

I have a RH box 7.1 with a modular 2.4.20 kernel.  I patched the kernel
with the latest iptables patch 1.2.8.  When I run the following command
from
a cron job: iptables -t mangle -L  I get the following error:

iptables: libiptc/libip4tc.c:384: do_check: Assertion
`h->info.valid_hooks == (1 << 0 | 1 << 3)' failed.
/etc/rc.d/init.d/iptables: line 170: 17123 Aborted
iptables -t mangle --list

When I run that same command from the command line it prints the mangle
table fine.  I also get this error when the machine reboots and run the
init script for iptables.  I have included that script below if it will
help.

#!/bin/sh
#
# Startup script to implement /etc/sysconfig/iptables pre-defined rules.

#
# chkconfig: 2345 11 92
#
# description: Automates a packet filtering firewall with iptables.
#
# by bero@redhat.com, based on the ipchains script:
# Script Author: Joshua Jensen <joshua@redhat.com>
#   -- hacked up by gafton with help from notting
# modified by Anton Altaparmakov <aia21@cam.ac.uk>:
# modified by Nils Philippsen <nils@redhat.de>
#
# config: /etc/sysconfig/iptables

# Source 'em up
. /etc/init.d/functions

IPTABLES_CONFIG=/etc/sysconfig/iptables

if [ ! -x /usr/local/sbin/iptables ]; then
 exit 0
fi

KERNELMAJ=`uname -r | sed                   -e 's,\..*,,'`
KERNELMIN=`uname -r | sed -e 's,[^\.]*\.,,' -e 's,\..*,,'`

if [ "$KERNELMAJ" -lt 2 ] ; then
 exit 0
fi
if [ "$KERNELMAJ" -eq 2 -a "$KERNELMIN" -lt 3 ] ; then
 exit 0
fi



if  /sbin/lsmod 2>/dev/null |grep -q ipchains ; then
 # Don't do both
 exit 0
fi
start() {
 # don't do squat if we don't have the config file
 if [ -f $IPTABLES_CONFIG ]; then
     # If we don't clear these first, we might be adding to
     #  pre-existing rules.
     action $"Flushing all current rules and user defined chains:"
iptables -F
     action $"Clearing all current rules and user defined chains:"
iptables -X
     chains=`cat /proc/net/ip_tables_names 2>/dev/null`
            for i in $chains; do iptables -t $i -F; done && \
              success $"Flushing all current rules and user defined
chains:" || \
              failure $"Flushing all current rules and user defined
chains:"
            for i in $chains; do iptables -t $i -X; done && \
              success $"Clearing all current rules and user defined
chains:" || \
              failure $"Clearing all current rules and user defined
chains:"

            for i in $chains; do iptables -t $i -Z; done

     echo $"Applying iptables firewall rules: "
/etc/sysconfig/iptables
# grep -v "^[[:space:]]*#" $IPTABLES_CONFIG | grep -v '^[[:space:]]*$' |
/usr/local/sbin/iptables-restore -c && \
      success $"Applying iptables firewall rules" || \
      failure $"Applying iptables firewall rules"
     echo
     touch /var/lock/subsys/iptables
 fi
}

stop() {
 chains=`cat /proc/net/ip_tables_names 2>/dev/null`
        for i in $chains; do iptables -t $i -F; done && \
                success $"Flushing all chains:" || \
                failure $"Flushing all chains:"
        for i in $chains; do iptables -t $i -X; done && \
                success $"Removing user defined chains:" || \
                failure $"Removing user defined chains:"
        echo -n $"Resetting built-in chains to the default ACCEPT
policy:"
 iptables -P INPUT ACCEPT && \
    iptables -P OUTPUT ACCEPT && \
    iptables -P FORWARD ACCEPT && \
    iptables -t nat -P PREROUTING ACCEPT && \
    iptables -t nat -P POSTROUTING ACCEPT && \
    iptables -t nat -P OUTPUT ACCEPT && \
           iptables -t mangle -P PREROUTING ACCEPT && \
           iptables -t mangle -P OUTPUT ACCEPT && \
    success $"Resetting built-in chains to the default ACCEPT policy" ||
\
    failure $"Resetting built-in chains to the default ACCEPT policy"
 echo
 rm -f /var/lock/subsys/iptables
}

case "$1" in
  start)
 start
 ;;

  stop)
 stop
 ;;

  restart)
 # "restart" is really just "start" as this isn't a daemon,
 #  and "start" clears any pre-defined rules anyway.
 #  This is really only here to make those who expect it happy
 start
 ;;
condrestart)
 [ -e /var/lock/subsys/iptables ] && start
 ;;

  status)
 echo $"Table: filter"
 iptables --list
 echo $"Table: nat"
 iptables -t nat --list
 echo $"Table: mangle"
 iptables -t mangle --list
 ;;

  panic)
 echo -n $"Changing target policies to DROP: "
 iptables -P INPUT DROP && \
     iptables -P FORWARD DROP && \
     iptables -P OUTPUT DROP && \
     iptables -t nat -P PREROUTING DROP && \
     iptables -t nat -P POSTROUTING DROP && \
     iptables -t nat -P OUTPUT DROP && \
     iptables -t mangle -P PREROUTING DROP && \
     iptables -t mangle -P OUTPUT DROP && \
     success $"Changing target policies to DROP" || \
     failure $"Changing target policies to DROP"
 echo
        iptables -F INPUT && \
                iptables -F FORWARD && \
                iptables -F OUTPUT && \
                iptables -t nat -F PREROUTING && \
                iptables -t nat -F POSTROUTING && \
                iptables -t nat -F OUTPUT && \
                iptables -t mangle -F PREROUTING && \
                iptables -t mangle -F OUTPUT && \
                success $"Flushing all chains:" || \
                failure $"Flushing all chains:"
        iptables -X INPUT && \
                iptables -X FORWARD && \
                iptables -X OUTPUT && \
                iptables -t nat -X PREROUTING && \
                iptables -t nat -X POSTROUTING && \
                iptables -t nat -X OUTPUT && \
                iptables -t mangle -X PREROUTING && \
                iptables -t mangle -X OUTPUT && \
                success $"Removing user defined chains:" || \
                failure $"Removing user defined chains:"
        ;;

  save)
 echo -n $"Saving current rules to $IPTABLES_CONFIG: "
 touch $IPTABLES_CONFIG
 chmod 600 $IPTABLES_CONFIG
 /usr/local/sbin/iptables-save -c > $IPTABLES_CONFIG  2>/dev/null && \
   success $"Saving current rules to $IPTABLES_CONFIG" || \
   failure $"Saving current rules to $IPTABLES_CONFIG"
 echo
 ;;

  *)
 echo $"Usage: $0 {start|stop|restart|condrestart|status|panic|save}"
 exit 1
esac

exit 0


TIA.


--
Trevor Morrison
Hailix, LLC
trevor@hailix.com




