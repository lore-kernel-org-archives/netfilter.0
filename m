From: Unni <unni@lab.mutexes.org>
Subject: iptable stop hung
Date: Thu, 17 May 2012 19:00:35 +0530
Message-ID: <e88f94f075d38a9b52fa903788dd3117@lab.mutexes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi,

"iptable stop" got hung in the server, so I killed that process. But 
still there is a modprobe process running there, that I can't kill.

oot     13834 99.8  0.0   3884   596 ?        R    11:15 132:39 
/sbin/modprobe -q -r ipt_state ip_nat_ftp iptable_nat xt_NOTRACK 
ip_conntrack_ftp ip_conntrack_netbios_ns xt_connlimit ip_conntrack 
ipt_recent

This is what I can see in dmesg

http://pastebin.com/BxEsyByC

--Unni
