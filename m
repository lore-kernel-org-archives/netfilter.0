From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: ipt_MARK/xt_MARK usage problem
Date: Tue, 22 Aug 2006 08:21:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608220815560.24532@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750768AbWHVGV7@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netfilter@lists.netfilter.org

Hello,


kernel 2.6.17 ships with xt_MARK, but iptables 1.3.5 still uses ipt_MARK. 
In essence, I cannot use `iptables -j MARK` giving me 

# iptables -A INPUT -j MARK --set-mark 1
iptables: Unknown error 4294967295

I have seen this before and the problem behind this strange error (-1) is 
that the .targetsize/.matchsize variables in the kernel modules do not 
match their userspace parts.

However, this time it seems to be something different:

# iptables -t mangle -A INPUT -j MARK --set-mark 1

Works without problems. Am I missing something?
How do I get MARK back to work in -t filter -- possibly without hacking in 
xt_MARK.c?




Jan Engelhardt
-- 
