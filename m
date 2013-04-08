From: Alex Flex <aflexzor@gmail.com>
Subject: =?UTF-8?B?RFJPUElORyBJQ01QIGFuZCBzdGlsbCBnZXR0aW5nIGtlcm5lbCBtZXM=?=
 =?UTF-8?B?c2FnZXMgb2YgaWNtcCB0cmFmZmljP+KAjw==?=
Date: Mon, 08 Apr 2013 12:06:59 -0600
Message-ID: <51630743.2020404@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=J8UTEEUEhjsSAc0Mq5g6gnM7WsU6wL3DDOQoJbRbSuw=;
        b=kkHOVIDt9gSz2tqHdB0aSxvQDPEi2Wee/YmhflnFAnocW9ojxu90aiSrCFAWcMtqps
         39ZmBfZIj4e2N6oxHT0+bDjL++Xad5D7xhJa6kUVOplVdrIxqKbVO95wgK31tplKm4B+
         d4df/1f3fDymF5Tla+9zJGlLHTFPAChb9pBtLQH5J1Bmx7/WQcaItdu5QQkPDbzVpfba
         ebXKwrUoE9IveJWJnhdQbXxFsQ4wZD1muJzObDbFreaDgFiywUEOj9ObpP0k8gE4uBG1
         9riLW2rkcWf+vRSzvFgTjnpokAcDqopojQ/6cHwU7O52iCyXTEXkpG4WfAfLgKmW9foB
         3wAg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I recently got a medium size DoS attack against my uplink, I deduce that 
because the attack was bigger than my uplink then I was effectively DoSed.

The attack nature was ICMP, but i had a ruleset to DROP all incomign 
ICMP. What confuses me the most is that I saw messages AS IF the kernel 
was dealing with ICMP traffic selectively. The result I was expecting 
was to not have any type of syslog ICMP messages regarding ICMP because 
in theory DROP means DROP silently.


Can anybody explain to me what could have occured?

Feb 27 14:27:11  kernel: Redirect from 125.215.162.43 on eth0 about 
125.215.162.46 ignored.
Feb 27 14:27:11  kernel:  Advised path = 4.221.27.8 -> 192.168.11.6
Feb 27 14:27:11  kernel: Redirect from 72.15.39.88 on eth0 about 
72.15.39.99 ignored.
Feb 27 14:27:11  kernel:  Advised path = 4.221.27.8 -> 72.15.39.99
Feb 27 14:27:12  kernel: Redirect from 23.128.38.14 on eth0 about 
85.20.63.101 ignored.
Feb 27 14:27:12  kernel:  Advised path = 4.221.27.8 -> 85.20.63.101
Feb 27 14:27:13  kernel: Redirect from 89.167.45.143 on eth0 about 
89.167.45.118 ignored.
Feb 27 14:27:13  kernel:  Advised path = 4.221.27.8 -> 89.167.45.118
Feb 27 14:27:13  kernel: Redirect from 94.255.230.139 on eth0 about 
94.255.231.10 ignored.
Feb 27 14:27:14  kernel:  Advised path = 4.221.27.8 -> 94.255.231.10
Feb 27 14:27:14  kernel: Redirect from 120.192.115.1 on eth0 about 
120.192.115.11 ignored.
Feb 27 14:27:14  kernel:  Advised path = 4.221.27.8 -> 120.192.115.11
Feb 27 14:27:15  kernel: Redirect from 183.61.108.1 on eth0 about 
183.61.108.112 ignored.
Feb 27 14:27:16  kernel:  Advised path = 4.221.27.8 -> 183.61.108.112
Feb 27 14:27:16  kernel: Redirect from 109.164.253.57 on eth0 about 
109.164.253.59 ignored.
Feb 27 14:27:16  kernel:  Advised path = 4.221.27.8 -> 109.164.253.59
Feb 27 14:27:16  kernel: Redirect from 61.92.213.127 on eth0 about 
61.92.212.1 ignored.
Feb 27 14:27:16  kernel:  Advised path = 4.221.27.8 -> 119.247.29.11


Finally, is there any difference between DROPing ICMP and using the 
sysctl variable to ignore all ICMP?

Alex
