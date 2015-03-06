From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: time module rules using localtime
Date: Thu, 5 Mar 2015 21:05:09 -0500
Message-ID: <201503052105.09192.neal.p.murphy@alum.wpi.edu>
References: <20150305211842.6d3ae8ddd23917c1f7638085@lucassen.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150305211842.6d3ae8ddd23917c1f7638085@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, March 05, 2015 03:18:42 PM richard lucassen wrote:
> Apparently the time module now uses UTC by default and the --utc and
> --localtz options have been removed. As I understood from various
> documents on the internet, to have a rule like:
> 
> iptables -A FORWARD -s 1.2.3.4 -m time  --kerneltz \
>  --timestart 06:00 --timestop 06:30 -j REJECT
> 
> work properly with localtime, I need to set the kernel timezone
> variable as soon as the system time has been synchronized at boot:
> 
> hwclock --systz
> 
> and, furthermore, as the variable is not updated by ntp or whatsoever
> on DST, run a cronjob on Sunday at 3:00 AM in the last week of March
> and October (in Europe):
> 
> # last week of March and October: set DST kernel timezone
> 0 3 25-31 3,10 0 /sbin/hwclock --systz
> 
> As this event only happens twice a year, I'd like to know if this is
> the right way to use iptables time rules in a DST environment.
> 
> Right or wrong?
> 
> R.

I was under the impression that a special tool is needed to set the kernel TZ. 
What I did for Smoothwall 3.1 is set the hardware clock to localtime and 
ensure that the system time is correctly pulled from it. Then ensure that 
features that use '-m time' include the --kerneltz option.

The bit I haven't done yet is implement a way to detect the local time zone, 
determine the DST changeovers from the TZDATA package, then schedule an at job 
for the two specific times when the kernel TZ must be updated. Thus, if the 
system is running at that time, the kernel TZ will be updated. If the system 
is not running at that time, the kernel TZ will be correctly set the next time 
the system boots. (This means that a system reboot will ensure the kernel TZ 
is correct.)

The program to set the kerneltz is 'setknltz' by David Madore. A cron job runs 
at 0159 on 3/8 and 11/1 (for US/Eastern zone). The script that is run sleeps 
for 1.02 seconds, then runs setknltz. Next, I believe the rules that use '-m 
time' need to be reset so they have the correct offset from UTC.

I wrote some of this up on the smoothwall forum:
  http://community.smoothwall.org/forum/viewtopic.php?p=332138#p332138
and the fourth post below it. I might not be completely correct in my 
assumptions, but I'm fairly sure the method will be sound.

N
