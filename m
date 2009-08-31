From: Thomas Berg <thomas.berg@branndal.se>
Subject: ULOG The kernel doesn't support a certain ebtables extension, consider
 recompiling your kernel or insmod the extension.
Date: Mon, 31 Aug 2009 22:15:08 +0200
Message-ID: <4A9C2F4C.9050405@branndal.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Running debian unstable with kernel Linux version 2.6.30-1-686 (Debian 
2.6.30-6)
trying to use ulogd and dont get it to work I get a strange error that I 
cant figure out how to workaround, except recompling the kernel, but the 
kernel is already complied with bridge support, is there any other 
support that i should include?

/sbin/ebtables --modprobe /sbin/modprobe -A FORWARD --in-interface 
eth1.4 --protocol IPv4 --ip-protocol udp --ip-destination-port 67 -j 
DROP --ulog
ULOG The kernel doesn't support a certain ebtables extension, consider 
recompiling your kernel or insmod the extension.

lsmod
ebt_ip                  1752  29
ebt_log                 3268  32
ebtable_broute          1740  0
ebtable_nat             2000  0
ebtable_filter          2028  1
ebtables               14108  3 ebtable_broute,ebtable_nat,ebtable_filter
ipt_ULOG                6684  1
x_tables               14108  4 ebt_ip,ebt_log,ebtables,ipt_ULOG
bridge                 39968  1 ebtable_broute
8021q                  17932  0
garp                    6996  1 8021q
stp                     2112  2 bridge,garp



I can se the modules below
/lib/ebtables
-rw-r--r--  1 root root  3704 2009-06-29 17:22 libebt_802_3.so
-rw-r--r--  1 root root  1768 2009-06-29 17:22 libebtable_broute.so
-rw-r--r--  1 root root  1928 2009-06-29 17:22 libebtable_filter.so
-rw-r--r--  1 root root  1928 2009-06-29 17:22 libebtable_nat.so
-rw-r--r--  1 root root  7908 2009-06-29 17:22 libebt_among.so
-rw-r--r--  1 root root  3908 2009-06-29 17:22 libebt_arpreply.so
-rw-r--r--  1 root root  7708 2009-06-29 17:22 libebt_arp.so
-rw-r--r--  1 root root 55884 2009-06-29 17:22 libebtc.so
-rw-r--r--  1 root root  6904 2009-06-29 17:22 libebt_ip6.so
-rw-r--r--  1 root root  6920 2009-06-29 17:22 libebt_ip.so
-rw-r--r--  1 root root  4364 2009-06-29 17:22 libebt_limit.so
-rw-r--r--  1 root root  5516 2009-06-29 17:22 libebt_log.so
-rw-r--r--  1 root root  3144 2009-06-29 17:22 libebt_mark_m.so
-rw-r--r--  1 root root  4548 2009-06-29 17:22 libebt_mark.so
-rw-r--r--  1 root root  5556 2009-06-29 17:22 libebt_nat.so
-rw-r--r--  1 root root  4552 2009-06-29 17:22 libebt_nflog.so
-rw-r--r--  1 root root  3432 2009-06-29 17:22 libebt_pkttype.so
-rw-r--r--  1 root root  3080 2009-06-29 17:22 libebt_redirect.so
-rw-r--r--  1 root root  2460 2009-06-29 17:22 libebt_standard.so
-rw-r--r--  1 root root  7960 2009-06-29 17:22 libebt_stp.so
-rw-r--r--  1 root root  4776 2009-06-29 17:22 libebt_ulog.so
-rw-r--r--  1 root root  4436 2009-06-29 17:22 libebt_vlan.so


Isnt ebtables supposed to auto load its needed modules? I was planning 
to log dhcp-req and desp-answ packets to a file for further handling 
with ulogd.

Best Regards,
Thomas





