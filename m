From: Trevor Morrison <trevor@hailix.com>
Subject: Errors on starting of iptables
Date: Tue, 29 Apr 2003 16:28:50 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EAEFCA2.FD9B8302@hailix.com>
Reply-To: trevor@hailix.com
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------2C062829839FF86A09BC0841"
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
To: netfilter@lists.netfilter.org


--------------2C062829839FF86A09BC0841
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I have a RH box 7.1 with a modular 2.4.20 kernel.  I patched the kernel
with the latest iptables patch 1.2.8.  When I run the following command
from a cron job: iptables -t mangle -L  I get the following error:

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



--------------2C062829839FF86A09BC0841
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi,
<p>I have a RH box 7.1 with a modular 2.4.20 kernel.&nbsp; I patched the
kernel with the latest iptables patch 1.2.8.&nbsp; When I run the following
command from a cron job: iptables -t mangle -L&nbsp; I get the following
error:
<p>iptables: libiptc/libip4tc.c:384: do_check: Assertion `h->info.valid_hooks
== (1 &lt;&lt; 0 | 1 &lt;&lt; 3)' failed.
<br>/etc/rc.d/init.d/iptables: line 170: 17123 Aborted&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t mangle --list
<p>When I run that same command from the command line it prints the mangle
table fine.&nbsp; I&nbsp;also get this error when the machine reboots and
run the init script for iptables.&nbsp; I&nbsp;have included that script
below if it will help.
<p>#!/bin/sh
<br>#
<br># Startup script to implement /etc/sysconfig/iptables pre-defined rules.
<br>#
<br># chkconfig: 2345 11 92
<br>#
<br># description: Automates a packet filtering firewall with iptables.
<br>#
<br># by bero@redhat.com, based on the ipchains script:
<br># Script Author: Joshua Jensen &lt;joshua@redhat.com>
<br>#&nbsp;&nbsp; -- hacked up by gafton with help from notting
<br># modified by Anton Altaparmakov &lt;aia21@cam.ac.uk>:
<br># modified by Nils Philippsen &lt;nils@redhat.de>
<br>#
<br># config: /etc/sysconfig/iptables
<p># Source 'em up
<br>. /etc/init.d/functions
<p>IPTABLES_CONFIG=/etc/sysconfig/iptables
<p>if [ ! -x /usr/local/sbin/iptables ]; then
<br>&nbsp;exit 0
<br>fi
<p>KERNELMAJ=`uname -r | sed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
-e 's,\..*,,'`
<br>KERNELMIN=`uname -r | sed -e 's,[^\.]*\.,,' -e 's,\..*,,'`
<p>if [ "$KERNELMAJ" -lt 2 ] ; then
<br>&nbsp;exit 0
<br>fi
<br>if [ "$KERNELMAJ" -eq 2 -a "$KERNELMIN" -lt 3 ] ; then
<br>&nbsp;exit 0
<br>fi
<br>&nbsp;
<br>&nbsp;
<p>if&nbsp; /sbin/lsmod 2>/dev/null |grep -q ipchains ; then
<br>&nbsp;# Don't do both
<br>&nbsp;exit 0
<br>fi
<br>start() {
<br>&nbsp;# don't do squat if we don't have the config file
<br>&nbsp;if [ -f $IPTABLES_CONFIG ]; then
<br>&nbsp;&nbsp;&nbsp;&nbsp; # If we don't clear these first, we might
be adding to
<br>&nbsp;&nbsp;&nbsp;&nbsp; #&nbsp; pre-existing rules.
<br>&nbsp;&nbsp;&nbsp;&nbsp; action $"Flushing all current rules and user
defined chains:" iptables -F
<br>&nbsp;&nbsp;&nbsp;&nbsp; action $"Clearing all current rules and user
defined chains:" iptables -X
<br>&nbsp;&nbsp;&nbsp;&nbsp; chains=`cat /proc/net/ip_tables_names 2>/dev/null`
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
for i in $chains; do iptables -t $i -F; done &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
success $"Flushing all current rules and user defined chains:" || \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
failure $"Flushing all current rules and user defined chains:"
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
for i in $chains; do iptables -t $i -X; done &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
success $"Clearing all current rules and user defined chains:" || \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
failure $"Clearing all current rules and user defined chains:"
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for
i in $chains; do iptables -t $i -Z; done
<p>&nbsp;&nbsp;&nbsp;&nbsp; echo $"Applying iptables firewall rules: "
<br>/etc/sysconfig/iptables
<br># grep -v "^[[:space:]]*#" $IPTABLES_CONFIG | grep -v '^[[:space:]]*$'
| /usr/local/sbin/iptables-restore -c &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; success $"Applying iptables firewall
rules" || \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; failure $"Applying iptables firewall
rules"
<br>&nbsp;&nbsp;&nbsp;&nbsp; echo
<br>&nbsp;&nbsp;&nbsp;&nbsp; touch /var/lock/subsys/iptables
<br>&nbsp;fi
<br>}
<p>stop() {
<br>&nbsp;chains=`cat /proc/net/ip_tables_names 2>/dev/null`
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for i in $chains; do iptables
-t $i -F; done &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
success $"Flushing all chains:" || \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
failure $"Flushing all chains:"
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for i in $chains; do iptables
-t $i -X; done &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
success $"Removing user defined chains:" || \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
failure $"Removing user defined chains:"
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo -n $"Resetting built-in
chains to the default ACCEPT policy:"
<br>&nbsp;iptables -P INPUT ACCEPT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp; iptables -P OUTPUT ACCEPT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp; iptables -P FORWARD ACCEPT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp; iptables -t nat -P PREROUTING ACCEPT &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp; iptables -t nat -P POSTROUTING ACCEPT &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp; iptables -t nat -P OUTPUT ACCEPT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables
-t mangle -P PREROUTING ACCEPT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables
-t mangle -P OUTPUT ACCEPT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp; success $"Resetting built-in chains to the default
ACCEPT policy" || \
<br>&nbsp;&nbsp;&nbsp; failure $"Resetting built-in chains to the default
ACCEPT policy"
<br>&nbsp;echo
<br>&nbsp;rm -f /var/lock/subsys/iptables
<br>}
<p>case "$1" in
<br>&nbsp; start)
<br>&nbsp;start
<br>&nbsp;;;
<p>&nbsp; stop)
<br>&nbsp;stop
<br>&nbsp;;;
<p>&nbsp; restart)
<br>&nbsp;# "restart" is really just "start" as this isn't a daemon,
<br>&nbsp;#&nbsp; and "start" clears any pre-defined rules anyway.
<br>&nbsp;#&nbsp; This is really only here to make those who expect it
happy
<br>&nbsp;start
<br>&nbsp;;;
<br>condrestart)
<br>&nbsp;[ -e /var/lock/subsys/iptables ] &amp;&amp; start
<br>&nbsp;;;
<p>&nbsp; status)
<br>&nbsp;echo $"Table: filter"
<br>&nbsp;iptables --list
<br>&nbsp;echo $"Table: nat"
<br>&nbsp;iptables -t nat --list
<br>&nbsp;echo $"Table: mangle"
<br>&nbsp;iptables -t mangle --list
<br>&nbsp;;;
<p>&nbsp; panic)
<br>&nbsp;echo -n $"Changing target policies to DROP: "
<br>&nbsp;iptables -P INPUT DROP &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -P FORWARD DROP &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -P OUTPUT DROP &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -t nat -P PREROUTING DROP &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -t nat -P POSTROUTING DROP &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -t nat -P OUTPUT DROP &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -t mangle -P PREROUTING DROP &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -t mangle -P OUTPUT DROP &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp;&nbsp; success $"Changing target policies to DROP"
|| \
<br>&nbsp;&nbsp;&nbsp;&nbsp; failure $"Changing target policies to DROP"
<br>&nbsp;echo
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -F INPUT &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -F FORWARD &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -F OUTPUT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t nat -F PREROUTING &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t nat -F POSTROUTING &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t nat -F OUTPUT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t mangle -F PREROUTING &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t mangle -F OUTPUT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
success $"Flushing all chains:" || \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
failure $"Flushing all chains:"
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -X INPUT &amp;&amp;
\
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -X FORWARD &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -X OUTPUT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t nat -X PREROUTING &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t nat -X POSTROUTING &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t nat -X OUTPUT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t mangle -X PREROUTING &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
iptables -t mangle -X OUTPUT &amp;&amp; \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
success $"Removing user defined chains:" || \
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
failure $"Removing user defined chains:"
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;
<p>&nbsp; save)
<br>&nbsp;echo -n $"Saving current rules to $IPTABLES_CONFIG: "
<br>&nbsp;touch $IPTABLES_CONFIG
<br>&nbsp;chmod 600 $IPTABLES_CONFIG
<br>&nbsp;/usr/local/sbin/iptables-save -c > $IPTABLES_CONFIG&nbsp; 2>/dev/null
&amp;&amp; \
<br>&nbsp;&nbsp; success $"Saving current rules to $IPTABLES_CONFIG" ||
\
<br>&nbsp;&nbsp; failure $"Saving current rules to $IPTABLES_CONFIG"
<br>&nbsp;echo
<br>&nbsp;;;
<p>&nbsp; *)
<br>&nbsp;echo $"Usage: $0 {start|stop|restart|condrestart|status|panic|save}"
<br>&nbsp;exit 1
<br>esac
<p>exit 0
<br>&nbsp;
<p>TIA.
<pre>--&nbsp;
Trevor Morrison
Hailix, LLC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
trevor@hailix.com</pre>
&nbsp;</html>

--------------2C062829839FF86A09BC0841--


