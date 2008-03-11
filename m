From: Georgi Georgiev <chutz@gg3.net>
Subject: [SOLVED] PPPoE on a bridge, nat sees bridge as incoming interface
Date: Tue, 11 Mar 2008 20:08:55 +0900
Message-ID: <20080311110854.GA8806@possum.gg3.net>
References: <20080306172218.GA14566@possum.gg3.net> <47D07205.10906@plouf.fr.eu.org> <20080306172218.GA14566@possum.gg3.net> <47D069BF.9080208@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47D07205.10906@plouf.fr.eu.org> <47D069BF.9080208@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

My problem has been solved for a week now. Here is the summary.

Problem: If a PPPoE connection is initialized over a bridge the nat
table will see any incoming IP packet as coming from the bridge
interface, and not the ppp interface.

Solution 1: Set the following sysctl key to 0
net.bridge.bridge-nf-filter-pppoe-tagged

Warning: If adding this to /etc/sysctl.conf (or equivalent), make sure
that the bridge module gets loaded *before* sysctl is applied.

Solution 2: Compile the kernel without CONFIG_BRIDGE_NETFILTER.

Both of these worked for me. I'm sticking with number two.

-- 
()   Georgi Georgiev   () If you don't care where you are, then you  ()
()    chutz@gg3.net    () ain't lost.                                ()
() http://www.gg3.net/ ()                                            ()
