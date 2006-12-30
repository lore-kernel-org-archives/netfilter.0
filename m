From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: ip_tables init broken
Date: Sat, 30 Dec 2006 18:14:35 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0612301738001.32449@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755176AbWL3RPA@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hello,


when the ip_tables module is loaded automatically when inserting the 
first rule, something gets screwed up, as -L -v -n shows:


17:39 ichi:~ # lsmod | grep ip_tables
17:39 ichi:~ # iptables -t mangle -A FORWARD -i eth1 -j MARK --set-mark 161
17:39 ichi:~ # iptables -t mangle -A FORWARD -i eth1 -j MARK --set-mark 161
17:39 ichi:~ # iptables -t mangle -L -v -n | grep eth1
p b targ pr opt in  out src       dst
0 0 MARK 0  -- eth1 *   0.0.0.0/0 0.0.0.0/0  0xa1
0 0 MARK 0  -- eth1 *   0.0.0.0/0 0.0.0.0/0  MARK set 0xa1

Everything is fine if ip_tables was loaded before.

This box runs 2.6.18.5. Can anyone confirm this bug?


	-`J'
-- 
