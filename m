From: Radien Radien <radien@gmail.com>
Subject: Help! problem with PPTPD and pptp nat helper
Date: Sun, 26 Dec 2004 15:45:45 +0330
Message-ID: <4a0a384e041226041571f504ae@mail.gmail.com>
Reply-To: Radien Radien <radien@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

But based on netfilter pom-ng documentation its needed for NAT working properly

http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-conntrack-nat

I have great successfull experiment using these 4 p-o-m modules, they
work perfect in my cases multiple session for DNAT and SNAT even both
at the same time. But when the last one is loaded part of pptpd(when
uses pppd) cannot negotiate using LCP, it seems so in logfiles. And if
I unload it, pptpd works fine!!

#This adds CONFIG_IP_NF_PPTP:
#Connection tracking and NAT support for PPTP.  Using this, you can track
#PPTP/GRE connections and do SNAT/DNAT.  You have to load the following modules
#for connection tracking:
#       ip_conntrack_proto_gre
#       ip_conntrack_pptp
#for NAT:
#       ip_nat_proto_gre
#       ip_nat_pptp
#

It seems to be a conflict of using ppp, with ip_nat_pptp module and pptpd.

-------------------------------------------------------------------------------------------------------

>trying to connect to a server which is itself behind a router and NAT'd

You mentioned that you applied the conntrack patch.  Did you do this on
both the firewalls?  I have had success with the following.  Note that I
have disabled ip_nat_pptp.  If I load ip_nat_pptp then only one person
can connect and on the first time only.  Subsequent attempts fail.  I
have asked but received no feedback on this as well.  But hopefully this
will help you as well.

Anyways, here's what I run and the order that I run them in.  The
firewall currently has two active incoming connections I did test
multiple outgoing connections when I configured it.

/etc/rc.d/rc.local:
/sbin/modprobe ip_conntrack_proto_gre
/sbin/modprobe ip_conntrack_pptp
/sbin/modprobe ip_nat_proto_gre
#/sbin/modprobe ip_nat_pptp
/sbin/modprobe ip_conntrack_irc
/sbin/modprobe ip_nat_irc
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_conntrack_mms
/sbin/modprobe ip_nat_mms
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_TARPIT
/sbin/modprobe ip_gre
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_nat
Gary Smith

