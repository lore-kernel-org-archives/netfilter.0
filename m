From: Miha Verlic <fluke@krneki.org>
Subject: kernel panic
Date: Thu, 07 Sep 2006 18:42:30 +0200
Message-ID: <45004BF6.2050109@krneki.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

today one of the servers I administer crashed for the third time due to 
kernel panic. Folks at colocation site provided me with the following 
"screenshot": http://miha.krneki.org/netfilter/kernelpanic.jpg

I'm not sure whether this is related with netfilter/iptables, tg3 or 
something else, but the screenshot is full of netfilter messagess, so I 
tried this list first.

Funny thing is that /proc/sys/kernel/panic was set to 60 seconds, yet 
the machine did not reboot itself after the crash and colocation people 
said machine was not responding to keyboard, so they could not provide 
the whole trace.

Another interesting thing - machine is heavily loaded (apache+php+mysql) 
- pushing around 35-45mbit/s througout the whole day. After midnight 
utilization gets very low and yet all 3 crashes occured at around 2AM 
local time. There are no cron scripts at that time that would cause any 
cpu/network hammering, system is virtually idle.

Server is Dual Opteron 250 with 4gb ECC RAM and Adaptec 2015S SCSI 
controller (2x RAID1).

At the time of crash, system was using:
OS: (32bit) slackware-based with:
glibc 2.3.6 (NPTL), gcc 3.3.6,
iptables 1.3.4 (upgraded to 1.3.5 after crash)
kernel 2.6.17.8 with the following patches:
   - grsecurity 2.1.9 (200608012135)
   - dpt_i2o-2.5.0-2426 driver from adaptec
SMP and PAE are enabled, config file is located at:
http://miha.krneki.org/netfilter/config-2.6.17.8+d1

If anyone has any clue, don't hesitate to contact me.

Cheers
--
Miha


