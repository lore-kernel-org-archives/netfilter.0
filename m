From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Compiling ip_[conntrack|nat]_pptp
Date: Tue, 20 Apr 2004 07:46:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420054614.AB314398@sterenborg.info>
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
To: 'Netfilter' <netfilter@lists.netfilter.org>

Hi,

I compiled kernel 2.4.26 with pom-ng-17042004 and applied (amongst others)
the pptp patch.
Everything compiles fine except for that patch.

When I do a "make modules_install", the last lines are :

if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.26-4; fi
depmod: *** Unresolved symbols in
/lib/modules/2.4.26-4/kernel/net/ipv4/netfilter/ip_conntrack_pptp.o
depmod:         ip_ct_gre_keymap_add
depmod:         ip_ct_gre_keymap_destroy
depmod: *** Unresolved symbols in
/lib/modules/2.4.26-4/kernel/net/ipv4/netfilter/ip_nat_pptp.o
depmod:         ip_ct_gre_keymap_change

I notice in /lib/modules/2.4.26-4/kernel/net/ipv4/netfilter that there are
ip_conntrack_pptp.o and ip_nat_pptp.o but I don't have a
ip_conntrack_proto_gre.o which I do have on my "old" iptables box.

Kernel config snip :

#
# Networking options
#
...
CONFIG_NET_IPGRE=m

#
#   IP: Netfilter Configuration
#
CONFIG_IP_NF_CONNTRACK=m
...
CONFIG_IP_NF_PPTP=m
# CONFIG_IP_NF_PPTP_DEBUG is not set
...
CONFIG_IP_NF_NAT_PPTP=m


And that's about all I can find about GRE and PPTP in .config.
Could somebody please tell me what I'm doing wrong ?


Gr,
Rob


