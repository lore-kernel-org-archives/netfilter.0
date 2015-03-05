From: richard lucassen <mailinglists@lucassen.org>
Subject: time module rules using localtime
Date: Thu, 5 Mar 2015 21:18:42 +0100
Message-ID: <20150305211842.6d3ae8ddd23917c1f7638085@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Apparently the time module now uses UTC by default and the --utc and
--localtz options have been removed. As I understood from various
documents on the internet, to have a rule like:

iptables -A FORWARD -s 1.2.3.4 -m time  --kerneltz \
 --timestart 06:00 --timestop 06:30 -j REJECT

work properly with localtime, I need to set the kernel timezone
variable as soon as the system time has been synchronized at boot:

hwclock --systz

and, furthermore, as the variable is not updated by ntp or whatsoever
on DST, run a cronjob on Sunday at 3:00 AM in the last week of March
and October (in Europe):

# last week of March and October: set DST kernel timezone
0 3 25-31 3,10 0 /sbin/hwclock --systz

As this event only happens twice a year, I'd like to know if this is
the right way to use iptables time rules in a DST environment.

Right or wrong?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
