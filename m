From: "Tim Lank" <asysad@gmail.com>
Subject: NAT/conntrack issue?
Date: Fri, 18 Jan 2008 14:13:47 -0500
Message-ID: <89622f200801181113k308dee7au215d0a2072ea16@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=Deb0KvjpSVclCL6HCt4Zkd2ySUl9/TNkNypwGSHkmjc=;
        b=B28DR/z/QeJ/f+UhudUz9yPVAa8S7w2r7XdXvrMTTu63gjQyAaEsKHE/uKs/TWrPNYeOkEce9yHvta5xFxonneldSuckbSI9aBDP/HU00qmJ/a6iVI3Tu6SejGVhsP4/8zLc5L0HaHZB6s7nPajO7P3VU2zJCa04spfCaUpgHi0=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

We have a RHEL4 Apache server (ourweb.example.com 10.36.8.47) that is
setup with IPTables using the following NAT Redirect (vip.example.com
10.36.8.25):

*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A PREROUTING -d 10.36.8.25 -j REDIRECT
COMMIT

It works most all of the time and sends HTTP packets back out from the
box with the IP of vip.example.com.  This is what we want.  However,
occaisonally, it will send HTTP ACK (seq=0) packets back out from the
box with the IP of ourweb.example.com.

Why is this?

# lsmod | grep ip
ipv6                  243553  64
ipt_REJECT             10689  1
ipt_state               5953  23
iptable_filter          6977  1
ipt_REDIRECT            6209  1
iptable_nat            27613  2 ipt_REDIRECT
ip_conntrack           46085  2 ipt_state,iptable_nat
ip_tables              22721  5
ipt_REJECT,ipt_state,iptable_filter,ipt_REDIRECT,iptable_nat


<VirtualHost *>
  ServerName vip.example.com
  DocumentRoot "/opt/IBM/HTTPServer/htdocs/en_US"
  RedirectMatch temp ^/somethingelse/wot(.*)$
http://somewhere.example.com/somethingelse/wot$1
  RedirectMatch temp ^/something(.*)$
http://www.example.com/goingtosomewhere/index.html
  RewriteEngine on
  RewriteLog "/opt/IBM/HTTPServer/logs/rewrite.log"
  RewriteLogLevel 1
  RewriteCond %{DOCUMENT_ROOT}/someportal -f
  RewriteRule ^/someexternal/portal/somet*
http://www.example.com/helpdesk/status/status.htm [R]
</VirtualHost>

eth0      Link encap:Ethernet  HWaddr 00:0B:DB:E7:BD:09
          inet addr:10.36.8.47  Bcast:10.36.8.255  Mask:255.255.255.0
          inet6 addr: fe80::20b:dbff:fee7:bd09/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:577119464 errors:0 dropped:0 overruns:0 frame:0
          TX packets:548977728 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:3106281031 (2.8 GiB)  TX bytes:3152249982 (2.9 GiB)
          Interrupt:217
eth1      Link encap:Ethernet  HWaddr 00:0B:DB:E7:BD:0A
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:225
lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:132983 errors:0 dropped:0 overruns:0 frame:0
          TX packets:132983 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:53593753 (51.1 MiB)  TX bytes:53593753 (51.1 MiB)
sit0      Link encap:IPv6-in-IPv4
          NOARP  MTU:1480  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

# rpm -qa | grep iptables
iptables-1.2.11-3.1.RHEL4
#
# uname -a
Linux ourweb 2.6.9-67.ELsmp #1 SMP Wed Nov 7 13:58:04 EST 2007 i686
i686 i386 GNU/Linux
#
# for f in /proc/sys/net/ipv4/netfilter/ip_conntrack_*; do
> echo "$f: $(cat $f)"
> done
/proc/sys/net/ipv4/netfilter/ip_conntrack_buckets: 8192
/proc/sys/net/ipv4/netfilter/ip_conntrack_count: 301
/proc/sys/net/ipv4/netfilter/ip_conntrack_generic_timeout: 600
/proc/sys/net/ipv4/netfilter/ip_conntrack_icmp_timeout: 30
/proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid: 0
/proc/sys/net/ipv4/netfilter/ip_conntrack_max: 65536
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal: 0
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose: 3
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_max_retrans: 3
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close: 10
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait: 60
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established: 432000
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_fin_wait: 120
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_last_ack: 30
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_max_retrans: 300
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_syn_recv: 60
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_syn_sent: 120
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_time_wait: 120
/proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout: 30
/proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream: 180
