From: Sebastian Arcus <shop@open-t.co.uk>
Subject: Fwd: Iptables, timestart and timestop arguments and daylight saving
 time in UK
Date: Wed, 13 Apr 2011 14:36:06 +0100
Message-ID: <4DA5A6C6.7040404@open-t.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Bump

Anybody?



-------- Original Message --------
Subject: Iptables, timestart and timestop arguments and daylight saving 
time in UK
Date: Tue, 29 Mar 2011 14:47:07 +0100
From: Sebastian Arcus <shop@open-t.co.uk>
To: netfilter@vger.kernel.org

Hi all,

The clock changed over the weekend in the UK by one hour (daylight
saving time). I have a setup where I block some MAC addresses access to 
the Internet based on time, using iptables, "timestart" and "timestop"
arguments. The command is the following:

iptables -A FORWARD -p ALL -o eth0 -m mac  --mac-source  $BLOCKED_MAC1 \
    -m time --timestart 13:00 --timestop 12:00 -j DROP


After the weekend, the server kept on blocking as per the old winter
time. I checked the server time with the "date" command and the time on
the client machine (Windows XP) - and in both places the clock is
updated as per new time / summer time. The iptables on server kept on
blocking according to winter time for two days. Even restarting the
iptables script (which flushes the tables) didn't make a different.
Finally, when I restarted the whole server, it started blocking
according to new summer time. Here is the setup:

Client: Windows XP Home
Server: Slackware 13.0
Kernel: 2.6.29.6
Iptables: 1.4.3.2

Is this a known bug in the kernel, or am I doing something wrong?

Thanks for any contributions,

Sebastian
