From: "Voltaire Pascual" <voltaire@voltaire.servebeer.com>
Subject: help: ip_nat_pptp/ip_nat_conntrack
Date: Mon, 26 May 2003 12:55:43 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <019b01c32343$10866510$6400a8c0@homes>
References: <2CE951F1A7DC0644A33B9F763D2029C0016FB0E4@mail.it.farmingdale.edu>
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

Hi there,

do you know where to find ip_nat_pptp/ip_conntrack_pptp  patches for kernel
2.4.20? I tried searching in google but didn't find any good guide for
newbie. The reason why im doing this is to allow my private network to
connect to the VPN simultaneously.

I have these files installed but can I ask your help how to install these as
modules?

"/usr/src/linux-2.4.20/net/ipv4/netfilter"
ip_nat_pptp.c
ip_conntrack_pptp.c

I cant find "pptp connection tracking" support in "make
menuconfig/Networking Options/Netfilter Configuration"

Appreciate your help.

/TIA.
VP.


