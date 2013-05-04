From: Alex Flex <aflexzor@gmail.com>
Subject: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 04 May 2013 11:24:27 -0600
Message-ID: <5185444B.3090602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=aNtacV+YCKTaErHMozE3fS065E92p+0P9DAN679EQUg=;
        b=GSLbhhRi8xCxSh4aQHmVDuKL7vBG4M+tBaiV+5DOyGcqcB5WACXXejjKWuIRKcfMNt
         ClE8ec4A7jNzwNTj85G2xs+eZdyxYVInFQGIVNE1hqz8+E5gsVbjO7p+ZBX4fj3cDjl1
         bFbNL2uC3ajzRWq8tvRThwaaPnMUWbcImFUU8vlutuCmpYFeo2XgYn5IVw9VIBbOzXJ9
         GxUePUTtgT0uES2o9JWlgRovaXANejE4JvA/Yq7mRXLN8Lf/AGG4HNsXjChJUHhRuNTS
         XxBFXaGEUmOTVtGhTqiJ0/slEy2wJJg05qjrdtXZUJMmA/xwF5RrnjuD8FItPjNYzqIT
         0L3w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello Netfilter,

Ive been receiving lately two types of syn floods on an Intel Xeon 
2.4ghz + 4GB machine exclusively dedicated for this and the findings 
have me very confused:
  I have syn cookies enabled and checked to be working as per syslog.
This machine has a 10gigabit uplink so I know that networking isnt a 
bottleneck here (bandwith or router hardware based).

SCENARIO 1: the first attack was: 105mbits @ 330,000 pps and it brought 
the machine to 100% CPU usage and over 50% packetloss Load average 12. 
At that time it had a simple iptables script that that had less then 5 
blacklists of port 80 ips and then a ACCEPT On port 80, nothing fancy. I 
disabled iptables and load average went down immediately to 8 but there 
was still high packet loss so basically we where DoSed efficiently.

SCENARIO 2: After that the attacker sent only a 30mbit synflood @ 70,000 
pps .. Now i had less packet loss, and interestingly with iptables 
enabled it would create almost immediate packetloss. At this time I 
tried to explore installing conntrack-tools information about the state 
table. conntrack said that with iptables enabled and syncookies the 
maximum entries where 1300 ONLY... and a CPU usage reported by HTOP of 
40% on SI. After that I decided to drop iptables all together and 
immediately port 80 started flowing with normal traffic (we have less 
than 1mbit clean traffic) . No packetloss was present, because iptables 
was disabled conntrack did not report any entries and netstat-na |wc -l 
reported less than 300.

Questions:

a.) Can anybody suggest why there is so much CPU overhead when iptables 
is turned on and dealing with such PPS? Is this normal? Usually what CPU 
usage does a syn flood cookie enabled take?

b.) Is there a chance that the attacker exausted something else iam not 
seeing?


Thanks for the help guys

Alex

