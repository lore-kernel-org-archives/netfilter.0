From: Johannes Erwerle <jo@swagspace.org>
Subject: iptables 1.4.16.3 on a Zyxel Router: NOTRACK / CT --notrack not
 available
Date: Sun, 16 Apr 2023 12:23:14 +0200
Message-ID: <f4d3374f-41e7-771a-1655-ef4c2b16347c@swagspace.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=swagspace.org;
        s=mail; t=1681640595;
        bh=qdrp3LqMeG3kqEUg7Kdx+wWBYpEnfNHK4SzqrkTcraM=;
        h=Date:To:From:Subject;
        b=qe9AC9iPzqP9AxHJWdsBHDgpvtPzWn//kEIzi4JtI3PXtgByFPKwF5vQjbbe1VxaK
         V4kaGyz09LxvirpjG3e4iB7xOXPoPH0u8kc08bR7qPO9zJi36XWXItzN8wA2Ccbya1
         GtJ9J/FxLEIaeHdsugtYSW8ITMnxvFwcxHRVl2r9rX+o4V4W5S28V9tk/2yxlC8ygv
         vW6yGZt/Cm8MSi37gSImTJW1IstlT09K60Mi1nmAf91EGYkO1PBDn7mFM3/X2whWCv
         KVY3iczauYOD+VcFMTHPUQdEk+YsRzRoSTkubloIa0se/Qtub3W8cyTSc/u4HlljrH
         eu7ADXKXB4+Pw==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!

I have a Zyxel NR7101 5G router. This device has to handle a lot of 
sessions and we had events in the past, where the conntrack table was 
full, leading to dropping new sessions.
An other issue is, that the device can only handle ~250 new sessions per 
second. (At 250 sessions/s one CPU core is completely utilized and it 
starts sending pause frames).

Since we don't need any firewalling for the traffic that is only routed 
through the device I wanted to disable connection tracking for some 
connections to reduce the size of the conntrack table and hopefully 
increase the amount of new sessions that the device can handle)
However neither the NOTRACK target nor the --notrack option for the CT 
target are available.

Here are a couple of infos regarding the OS/Kernel/iptables version:

root@NR7101:~# uname -a
Linux NR7101 3.10.14 #1 SMP Tue Nov 29 09:49:05 CST 2022 mips 
GNU/Linuxroot@NR7101:~# iptables -V
iptables v1.4.16.3

When I am trying to add rules to disable tracking I get the following 
errors:

root@NR7101:/# iptables -t raw -A PREROUTING -d 1.2.3.4 -j CT --notrack
iptables v1.4.16.3: unknown option "--notrack"
Try `iptables -h' or 'iptables --help' for more information.
root@NR7101:/# iptables -t raw -A PREROUTING -d 1.2.3.4 -j NOTRACK
iptables v1.4.16.3: Couldn't find target `NOTRACK'

Try `iptables -h' or 'iptables --help' for more information.


Since this is a small embedded device man pages and other nice things 
one would expect from a modern linux distribution are usually not available.

 From what I found while digging through the change logs, at least one 
of the notrack options was available in iptables 1.4.16.3. However the 
device does not know them. Might this be a compile-time option and the 
feature was simply left out by the manufacturer? Or do I have to load a 
kernel module explicitly? Is there any way to get this working?

One workaround for the first issue would be to increase the conntrack 
table and hashsize, there is some RAM available, but it is not limitless.

Greetings and thank you very much
Jo
