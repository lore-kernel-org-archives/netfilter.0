From: Alex Flex <aflexzor@gmail.com>
Subject: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 04 May 2013 11:15:30 -0600
Message-ID: <51854232.1030306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=aNtacV+YCKTaErHMozE3fS065E92p+0P9DAN679EQUg=;
        b=CwAKqJdnWlBwNolckRRcScdQycox0NFxjGL1Gt+BofYoquuZHYE059qx6DtFiItBcP
         6PwPf4ouFBOjlIGcv2eoKsM+jVTOagGxubCPeya38CTJ/yOSFMjnonIxwAi+Vx10pQlc
         Wi7rEQtsTLV8ji9aHVPwiqPOBavtBCqV5biDfSDRv13UKvOQ5swJiMfMplTXsiMV+Wu0
         XBYbh/ek/NCsF2VRpLUqUPD2rop6fEP+KNnbmvbeYjIcU6Wlp41F4+HTXNIoofnk73ZM
         f77fLCaYptX+omM64t+cwVDnm8NBp8VE/PZ6o7Ka0bI+20kNEXWSyJs8R1EDDYjDQVMn
         nwTg==
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
