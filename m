From: "Brendan Grieve" <brendan_200201@grieve.com.au>
Subject: [Announce]: IP Traffic Log for Netfilter - ulacc
Date: Fri, 31 May 2002 11:11:21 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <001001c20850$d6c7f630$023610ac@techstart.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

ulogd_ACCOUNT
--------------------

---------------------------------------------------------------------------
1. What is it?
---------------------------------------------------------------------------

As part of my UAS software suite (Users Arn't Stupid), I have a Traffic
Accounting module for use with Harald Welte's ulog netfilter target.
(http://www.gnumonks.org/cgi-bin/cvsweb.cgi/ulog). I've been looking for
a decent 2.4 Kernel traffic accounting module for a while and gave up and
wrote my own.

This module has one fairly interesting feature. Most networks that I
administrate are generally quite dynamic. That is, all the workstations
on it are assigned their network details and IP Address via DHCP. As some
of my clients wished to have accounting down to the workstation detail,
I've made this particular module use a mixture of the IP and MAC. This
means that if a workstation gets a new IP, it will still have traffic
statistics applied correctly to it. If more than one IP has the same MAC,
as when they are behind a router, then accounting will still work, but
will only give totals for all addresses. This means I'm trusting the MAC
rather than the IP, and I am using two tables, one to store MAC's and one
to store IP's, with a relationship of one MAC to many IP's. NOTE: Both a
MAC and IP_can_ be forged, but this is a topic for another discussion.

A quick description of HOW this module achieves this is as follows: -

1. On each packet, determine if it is 'outgoing' or 'incoming'. (We're
   assuming that this is running on a router which the packets pass
   through). We can then determine whether to use the source IP (on
   outgoing packets) or destination IP (on incoming packets).

2. We then try to work out a MAC address, as follows: -
  a)  We check if we already have a cached entry that links the IP to a
      MAC, if so, we use it.
  b)  Else if traffic is outgoing, then we will also have the source MAC
      address given to us. We cache the MAC and link this IP to it.
  c)  Else If traffic is incoming then we store the traffic in a temp
      variable linked to the IP, and return. A future 'answer' will link
      this, and will also transfer the temp traffic counter to the MAC.

3. A few sanity checks are performed. ie: -
  a)  If traffic is outgoing, check that the currently linked MAC to the
      IP is correct. If not, fix up.

4. Traffic counters for the MAC are updated, and the cache times are
   touched to current time.


Some notes:
  * When a MAC cache expires, it is written to the log file, in the
    format:
           TIMESTAMP MACADDRESS TOTALTRAFFICFROM TOTALTRAFFICTO
  * When a SIGHUP is caught, all MAC stats are written to the log file
    and the tables cleared.
  * All memory allocation is cached so that performance is at optimum.
    Some sort of cleanup of the cached mallocs is probably useful to
    prevent Denial of Service.
  * Written for performance, so not much double-checking is done.
  * It would be fairly simple to write a web front-end that parses
    the file and links MAC to machine names.

---------------------------------------------------------------------------
2. How do I Compile it?
---------------------------------------------------------------------------

I've probably done things the wrong way, but I've copied the needed files
from ulogd and included them with this. A future change may to make a
configuration script that determines the directory of a ulogd source and
uses it.

To compile this, it should be as simple as doing the following: -

1. Uncompress archive to some directory.

2. Compile it. Should be as simple as going 'make' in the directory. The
   makefile will install it in /usr/lib/ulogd

3. Edit /etc/ulogd.conf. Theres an example in the example directory to
   get you started, but heres an example of a section: -

      # Where to write the logfile
      dumpfile /var/log/ipacc/ipaccount.log
      # What is the external interface? (IE, gateway Interface)
      extif eth0
      # Enable Plugin
      plugin /usr/lib/ulogd/ulogd_ACCOUNT.so

4. In your forward chain, just jump to ULOG. For example, I have: -
    iptables -A FORWARD -j ULOG --ulog-nlgroup 1 --ulog-cprange 20 \
             --ulog-qthreshold 50

4.1 UPDATE - It is better to have the following (So that Transparently
    routed traffic can be accounted for): -
        iptables -N ACCOUNT
        iptables -A ACCOUNT -j ULOG --ulog-nlgroup 1 \
                                --ulog-cprange 20 --ulog-qthreshold 50

        # Jump to it from FORWARD
        iptables -A FORWARD     -i ${GATEWAY_IF}        -o ! ${GATEWAY_IF} \
                        -j ACCOUNT
        iptables -A FORWARD     -i ! ${GATEWAY_IF}      -o ${GATEWAY_IF} \
                        -j ACCOUNT

        # Example: Account for transparent squid proxy:
        iptables -A INPUT -p tcp        -i ${SQUID_INTERFACE} --dport 3128 \
                                                -j ACCOUNT
        iptables -A OUTPUT -p tcp       -o ${SQUID_INTERFACE} --sport 3128 \
                                                -j ACCOUNT

5. Start ulogd.

6. Set up a cronjob to send a HUP to ulogd every day or every hour. That
   way you can have fairly recent statistics.

NOTE: I use a /var/log/ipacc  directory so that the directory can be
given a group write permission. This way a statistics parsing engine
(ie: http://www.worldguard.com.au/projects/ipacc) can read and write
securly to the directory.

---------------------------------------------------------------------------
3. TO DO
---------------------------------------------------------------------------
Probably something, but I'm sure it can wait.

---------------------------------------------------------------------------
4. Contact/Download Details
---------------------------------------------------------------------------
My name is Brendan Grieve. I hope someone finds some use for this software
or can modify to their needs.

Official Download Location: http://www.worldguard.com.au/projects/ulacc
My Email:  brendan (@) worldguard.com.au

Stay well. God Bless!


