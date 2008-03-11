From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: [SOLVED] PPPoE on a bridge, nat sees bridge as incoming interface
Date: Tue, 11 Mar 2008 13:05:19 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803111304160.24076@fbirervta.pbzchgretzou.qr>
References: <20080306172218.GA14566@possum.gg3.net> <47D07205.10906@plouf.fr.eu.org>
 <20080306172218.GA14566@possum.gg3.net> <47D069BF.9080208@riverviewtech.net>
 <20080311110854.GA8806@possum.gg3.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080311110854.GA8806@possum.gg3.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georgi Georgiev <chutz@gg3.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Mar 11 2008 20:08, Georgi Georgiev wrote:
>
>My problem has been solved for a week now. Here is the summary.
>
>Problem: If a PPPoE connection is initialized over a bridge the nat
>table will see any incoming IP packet as coming from the bridge
>interface, and not the ppp interface.

Solution 3: iptables -m physdev --physdev-in ppp0 -i br0
            ebtables --logical-in ppp0 -i br0

>Solution 1: Set the following sysctl key to 0
>net.bridge.bridge-nf-filter-pppoe-tagged
>
>Warning: If adding this to /etc/sysctl.conf (or equivalent), make sure
>that the bridge module gets loaded *before* sysctl is applied.
>
>Solution 2: Compile the kernel without CONFIG_BRIDGE_NETFILTER.
>
>Both of these worked for me. I'm sticking with number two.
