From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: conntrackd failover works partially
Date: Wed, 23 Jul 2008 17:20:21 +0200
Message-ID: <48874C35.5010308@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <4883DA4D.4080906@netfilter.org> <48849BBE.5060403@bock.nu> <48872918.5080406@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48872918.5080406@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Pablo Neira Ayuso wrote:
>>> Basically, you must to find the same
>>> set of flows in the master's internal-cache and the backup's
>>> external-cache if everything goes fine.
>> That's exactly what I can observe. They are consistent when the failover
>> goes fine, and they're not when I have INVALID packets.
> 
> Why did you set cache-write through on? You have a basic primary-backup
> failover, right? Set it off, please.

Fine. I was just experimenting.


>> As written in my last mail, I increased the SocketBufferSize to 256M and
>> the SocketBufferSizemaxGrown to 1024M in conntrackd.conf.
> 
> That's too much, why did you set such a high buffer? Are you getting
> some log messages that tells you to do so?

No, I just wanted to make absolutely sure that a too small buffer cannot 
be the reason, and the machine has plenty of RAM. What is a sensible value?


>> Now I get a lot of the following entries in syslog in addition to the
>> INVALID packets:
>> conntrack-tools[21319]: cache_wt crt-upd: Invalid argument
>> conntrack-tools[21319]: cache_wt update:Invalid argument
> 
> Please, enable logging via /var/log/conntrackd.log. The syslog logging
> is not including the information about the entry that has failed. I'll
> fix this to make both logging approaches consistent.

OK, here are some example entries from conntrackd.log:

[Tue Jul 22 10:05:58 2008] (pid=27666) [ERROR] cache_wt crt-upd: Invalid 
argument
Tue Jul 22 10:05:58 2008        tcp      6 120 SYN_SENT src=10.5.0.101 
dst=10.6.6.102 sport=53000 dport=80 [UNREPLIED]
[Tue Jul 22 10:05:58 2008] (pid=27666) [ERROR] cache_wt update:Invalid 
argument
Tue Jul 22 10:05:58 2008        tcp      6 60 SYN_RECV src=10.5.0.101 
dst=10.6.6.102 sport=53000 dport=80
[Tue Jul 22 10:05:58 2008] (pid=27666) [ERROR] cache_wt crt-upd: Invalid 
argument
Tue Jul 22 10:05:58 2008        tcp      6 120 SYN_SENT src=10.5.0.101 
dst=10.6.6.102 sport=53074 dport=80 [UNREPLIED]
[Tue Jul 22 10:05:58 2008] (pid=27666) [ERROR] cache_wt update:Invalid 
argument
Tue Jul 22 10:05:58 2008        tcp      6 60 SYN_RECV src=10.5.0.101 
dst=10.6.6.102 sport=53074 dport=80
[Tue Jul 22 10:05:58 2008] (pid=27666) [ERROR] cache_wt crt-upd: Invalid 
argument

This is all with cache-write through, so we can just skip it for the 
moment if you like.

Without cache-writethrough, I don't have the "cache_wt" message. 
Nevertheless, I get lots of INVALID messages and many dying TCP 
conntections on failover, so there's no improvement in the result of 
0.9.7 over 0.9.6. The lost packets in the multicast sequence tracking 
are gone, as you suggested.


>> In FT-FW mode, the failover always fails, and it produces log entries like:
> 
> Please, too many issues at the same time. Let's try to get it working
> without the cachewritethrough clause and then we'll get back to this, OK?

No problem, I was just testing FT-FW mode as you were proposing in your 
last mail. One correctly working mode is enough for me. ;-)

best regards
Bernhard
