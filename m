From: "__ Radien__" <radien@zworg.com>
Subject: Help! problem with PPTPD and pptp nat helper
Date: Tue, 21 Dec 2004 07:00:25 -0800
Message-ID: <15655.1103641225@zworg.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Guys

  I have problem in having 

	- kernel 2.4(Fedora Core 1) + ip_nat_pptp (in patch-o-matic 20040406)
loaded with
	- running pptpd 1.2.1 

Server Side Configuration:
-Linux 2.4 Fedora Core 1, patched by pptp-conntrack-nat properly(tested
for proper NAT + ConnectionTracking on multiple 

PPTP-Tunnel sessions)
-iptables 1.2.11 patched the same as kernel
-pptpd 1.2.1
-ppp 2.4.3 cvs20040527.4
-lsmod output:
===================================
Module                  Size  Used by    Not tainted
ip_nat_pptp             3308   0  (unused)
ip_conntrack_pptp       4304   1  [ip_nat_pptp]
ip_conntrack_proto_gre    4852   0  [ip_nat_pptp ip_conntrack_pptp]
ppp_mppe               14040   0  (autoclean)
ppp_async               9888   0  (autoclean)
ppp_generic            27584   0  (autoclean) [ppp_mppe ppp_async]
slhc                    6844   0  (autoclean) [ppp_generic]
autofs                 13780   0  (autoclean) (unused)
iptable_filter          2412   0  (autoclean) (unused)
pcnet32                18464   1
mii                     4124   0  [pcnet32]
ip_nat_ftp              4048   0  (unused)
ip_conntrack_ftp        5584   1  [ip_nat_ftp]
iptable_nat            23352   2  (autoclean) [ip_nat_pptp ip_nat_ftp]
ip_conntrack           33032   4  (autoclean) [ip_nat_pptp
ip_conntrack_pptp ip_conntrack_proto_gre ip_nat_ftp 

ip_conntrack_ftp iptable_nat]
ip_tables              16544   4  [iptable_filter iptable_nat]
floppy                 58908   0  (autoclean)
sg                     37612   0  (autoclean) (unused)
microcode               5024   0  (autoclean)
keybdev                 2976   0  (unused)
mousedev                5688   0  (unused)
hid                    24772   0  (unused)
input                   6208   0  [keybdev mousedev hid]
usb-uhci               27468   0  (unused)
usbcore                82912   1  [hid usb-uhci]
ext3                   74148   2
jbd                    56560   2  [ext3]
BusLogic              101084   0
sd_mod                 13740   0  (unused)
scsi_mod              112232   3  [sg BusLogic sd_mod]
===================================

Client Side configuration:
Win2k3 VPN Client set to support any encryption - optional - and any
username/password authentication method

  when I try to dig a PPTP-VPN tunnel to this machine, using a pptp
client software, I get error messages and connection 

fails:

Client Side error:

  "Error 619: A connection to the remote computer could not be
established, so the port used for this connection was closed."

Server Side error:
(/var/log/messages on the Server)
=====================================
Dec 21 17:09:38 server pptpd[17740]: CTRL: Client 192.168.0.101 control
connection started
Dec 21 17:09:38 server pptpd[17740]: CTRL: Starting call (launching
pppd, opening GRE)
Dec 21 17:09:38 server kernel: application bug: pppd(17741) has SIGCHLD
set to SIG_IGN but calls wait().
Dec 21 17:09:38 server kernel: (see the NOTES section of 'man 2 wait').
Workaround activated.
Dec 21 17:09:38 server pppd[17741]: pppd 2.4.3 started by root, uid 0
Dec 21 17:09:38 server pppd[17741]: Using interface ppp0
Dec 21 17:09:38 server pppd[17741]: Connect: ppp0 <--> /dev/pts/1
Dec 21 17:10:09 server pppd[17741]: LCP: timeout sending Config-Requests
Dec 21 17:10:09 server pppd[17741]: Connection terminated.
Dec 21 17:10:09 server pppd[17741]: Exit.
Dec 21 17:10:09 server pptpd[17740]: GRE:
read(fd=5,buffer=804e6e0,len=8196) from PTY failed: status = -1 error =


Input/output error, usually caused by unexpected termination of pppd,
check option syntax and pppd logs
Dec 21 17:10:09 server pptpd[17740]: CTRL: PTY read or GRE write failed
(pty,gre)=(5,6)
Dec 21 17:10:09 server pptpd[17740]: CTRL: Client 192.168.0.101 control
connection finished

=====================================

/var/log/ppp/pppd.log
=====================================
==> /var/log/ppp/pppd.log <==
using channel 29
Using interface ppp0
Connect: ppp0 <--> /dev/pts/1
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x0 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x0 <callback CBCP>]
rcvd [LCP ConfReq id=0x1 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x1 <callback CBCP>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x2 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x2 <callback CBCP>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x3 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x3 <callback CBCP>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x4 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x4 <callback CBCP>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x5 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x5 <callback CBCP>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x6 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x6 <callback CBCP>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x7 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x7 <callback CBCP>]
sent [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic
0xab867b16> <pcomp> <accomp>]
rcvd [LCP ConfReq id=0x8 <mru 1400> <magic 0x347a73ef> <pcomp> <accomp>
<callback CBCP>]
sent [LCP ConfRej id=0x8 <callback CBCP>]
LCP: timeout sending Config-Requests
Connection terminated.
=====================================


==>Interesting part is, If I unload "ip_nat_pptp" module then connection
will be established well with no errors.<==

The configuration files, /etc/pptpd.conf and /etc/ppp/option.pptpd and
/etc/ppp/options were tested to work properly - with 

the above configurations but with the original (not patched) kernel and
iptables!

Anyone can help please?

TIA


