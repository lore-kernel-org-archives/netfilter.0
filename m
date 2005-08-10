From: Simon Waters <simonw@zynet.net>
Subject: Troubleshooting stability issue
Date: Wed, 10 Aug 2005 17:02:24 +0100
Message-ID: <1123689748.21756.TMDA@mercury.zynet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

One of our firewalls appears to be unstable.

The problems started with adding ip_conntrack and ip_conntrack_ftp, as we need 
to support active mode FTP from inside to the outside.

Prior to this we were using it as a basic port filter (poor iptables), and so 
many of the rules exist to allow return packets without connection tracking.

As such it makes sense for us to "clean-up" the ruleset, but this hasn't 
happened yet.

Due to some interesting (and maybe related?) hardware issues, we've run the 
same firewall configuration on three different servers (all x86, Redhat and 
Debian, IDE and SCSI), including one with the latest (for Debian) 2.6.8 
kernel, and are fairly confident we see the same software issue on all three 
boxes.

Symptom is that by the time we get to it, the box is totally unresponsive to 
local console, is not forwarding packets. In a word "hung".

Memory isn't obviously leaking.

The number of lines in "ip_conntrack" does appear to grow with time, but is 
still way below (at around 3000) the maximum allowed of 32,000+, and isn't 
growing monotonically. I think there may be clues here, if only to what is 
wrong with the ruleset.

Apart from sshd, there is practically nothing running.
atd
crond
inetd (this has nothing configured in /etc/inetd.conf, so I'll remove it).
Postfix is listening on 127.0.0.1:25 in case anything local suddenly needs to 
report anything to me.
lpd (lpd was running and not listening on any ports, so I'll remove it).

Just looking for some helpful pointers on how to investigate this issue 
further.

As even with a "suboptimal" rule set I wouldn't expect the box to hang.
Logs have no useful entries (certainly no "table full" messages).

Don't want to post the full ruleset here, at least not till I've been over it 
with a finetoothed comb. And it is about 230 lines. On the upside quite a lot 
of it has just been obseleted by us relocating all our machines to one site, 
so I can shortly remove large chunks of it.

 Simon


The box is currently running Debian Sarge, with stock kernel;

Linux version 2.4.27-2-386 (horms@tabatha.lab.ultramonkey.org) (gcc version 
3.3.5 (Debian 1:3.3.5-12)) #1 Mon May 16 16:47:51 JST 2005

Module                  Size  Used by    Not tainted
ipt_REJECT              3160   5  (autoclean)
ipt_state                504   2  (autoclean)
iptable_filter          1644   1  (autoclean)
ip_conntrack_ftp        3440   0  (unused)
ip_conntrack           17000   1  [ipt_state ip_conntrack_ftp]
ip_tables              10400   3  [ipt_REJECT ipt_state iptable_filter]
i810_rng                2368   0  (unused)
ehci-hcd               14764   0  (unused)
usb-uhci               19504   0  (unused)
usbcore                52268   1  [ehci-hcd usb-uhci]
e1000                  57676   2
sr_mod                 11640   0  (unused)
scsi_mod               86052   1  [sr_mod]
ide-cd                 27072   0
cdrom                  26212   0  [sr_mod ide-cd]
rtc                     5768   0  (autoclean)
reiserfs              152944   1  (autoclean)
ext3                   65388   0  (autoclean)
jbd                    34628   0  (autoclean) [ext3]
ide-detect               288   0  (autoclean) (unused)
ide-disk               12448   2  (autoclean)
piix                    7784   2  (autoclean)
ide-core               91832   2  (autoclean) [ide-cd ide-detect ide-disk 
piix]
unix                   12752  76  (autoclean)

The hardware doesn't seem to like the stock 2.6 kernels, and I don't have one 
spare to spend time figuring out why.

