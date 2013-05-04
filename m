From: Alex Flex <aflexzor@gmail.com>
Subject: Re: SynFloods and CPU usage with and without iptables. Confused!
Date: Sat, 04 May 2013 12:42:15 -0600
Message-ID: <51855687.5040007@gmail.com>
References: <51854232.1030306@gmail.com> <27F4C2E78FB64527A44CA6E3BC368315@gmail.com> <7668B4D1FBE84D73BC3BFBFCAFCBEC1F@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=lQgJSTYfaHWA5I2S4Tux9/adlEwyY5kSDgDPMNNZ3bE=;
        b=CthUZwm/eXDJS/8YhwZBhZ3L+HSZHGXa9KX2zTNJxmtp71zeLTU6FD3X8ApauhXpTe
         uTGXqMJa9NkUf+ioI20nLRHjI5AiR3kBvom0hd9mEeXzQLfy/6iyzIl4uGQiQQ48cy9S
         17WEBrPM/8z9/vPjHSFJG3VA1wJaxVwF6ztbkZktM3692rorZ4aCD/wrwlPKnCgF1xH6
         JqUu8npgnEsCCob8ArbCiw3zJWoBtXlRHIpjKotTYXVc7o11MPA85EC6837krgF+wLc+
         n7DkGIaiMNg9lnRRUHt28yQJs83OhqdNr+r6XkuoNgjJmC8RXReiQoMrK628Z3hhqO7B
         ySYA==
In-Reply-To: <7668B4D1FBE84D73BC3BFBFCAFCBEC1F@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Payam Chychi <pchychi@gmail.com>, netfilter@vger.kernel.org

Payam,

Thanks for your reply!

Unfortunately the attack subsided and I did not get a packet log with 
tcpdump , I can tell you also that during such attack once I disabled 
iptables I was no longer logging anything. Dmesg all i see is:

possible SYN flooding on port 80. Sending cookies.
possible SYN flooding on port 80. Sending cookies.
possible SYN flooding on port 80. Sending cookies.
possible SYN flooding on port 80. Sending cookies.
possible SYN flooding on port 80. Sending cookies.
possible SYN flooding on port 80. Sending cookies.
[....]

I just realized that another machine of ours got attacked, about 20mbits 
and it brought the public interface down immediately . The graphs showed 
a CPU consumption of 14-20%.. then attack subsided 30 min later. This 
other machine also has syn cookieshowever dmesg didnt show any warning 
about it using syn cookies.. but it is enabled:

[root@w1 ~]# sysctl -a | grep syn
fs.quota.syncs = 0
net.ipv4.tcp_syn_retries = 5
net.ipv4.tcp_synack_retries = 5
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 1024
net.ipv6.conf.all.max_desync_factor = 600
net.ipv6.conf.default.max_desync_factor = 600
net.ipv6.conf.lo.max_desync_factor = 600
net.ipv6.conf.eth0.max_desync_factor = 600
net.ipv6.conf.eth1.max_desync_factor = 600



To me this confirms they are exausting something else ... Do you have 
any other suggestion?

Thanks

JP







On 05/04/2013 12:00 PM, Payam Chychi wrote:
> Wait are you logging the attack? That will cause high cpu utilization, 
> specially via syslog
>
> Anything on dmsg?
>
> -- 
> Payam Chychi
> Network Engineer / Security Specialist
>
> On Saturday, 4 May, 2013 at 10:29 AM, Payam Chychi wrote:
>
>> Do you have a capture of the attack? Does not make sense that cpu 
>> would go high for a normal synflood attack
>>
>> -- 
>> Payam Chychi
>> Network Engineer / Security Specialist
>>
>> On Saturday, 4 May, 2013 at 10:15 AM, Alex Flex wrote:
>>
>>> Hello Netfilter,
>>>
>>> Ive been receiving lately two types of syn floods on an Intel Xeon
>>> 2.4ghz + 4GB machine exclusively dedicated for this and the findings
>>> have me very confused:
>>> I have syn cookies enabled and checked to be working as per syslog.
>>> This machine has a 10gigabit uplink so I know that networking isnt a
>>> bottleneck here (bandwith or router hardware based).
>>>
>>> SCENARIO 1: the first attack was: 105mbits @ 330,000 pps and it brought
>>> the machine to 100% CPU usage and over 50% packetloss Load average 12.
>>> At that time it had a simple iptables script that that had less then 5
>>> blacklists of port 80 ips and then a ACCEPT On port 80, nothing 
>>> fancy. I
>>> disabled iptables and load average went down immediately to 8 but there
>>> was still high packet loss so basically we where DoSed efficiently.
>>>
>>> SCENARIO 2: After that the attacker sent only a 30mbit synflood @ 
>>> 70,000
>>> pps .. Now i had less packet loss, and interestingly with iptables
>>> enabled it would create almost immediate packetloss. At this time I
>>> tried to explore installing conntrack-tools information about the state
>>> table. conntrack said that with iptables enabled and syncookies the
>>> maximum entries where 1300 ONLY... and a CPU usage reported by HTOP of
>>> 40% on SI. After that I decided to drop iptables all together and
>>> immediately port 80 started flowing with normal traffic (we have less
>>> than 1mbit clean traffic) . No packetloss was present, because iptables
>>> was disabled conntrack did not report any entries and netstat-na |wc -l
>>> reported less than 300.
>>>
>>> Questions:
>>>
>>> a.) Can anybody suggest why there is so much CPU overhead when iptables
>>> is turned on and dealing with such PPS? Is this normal? Usually what 
>>> CPU
>>> usage does a syn flood cookie enabled take?
>>>
>>> b.) Is there a chance that the attacker exausted something else iam not
>>> seeing?
>>>
>>>
>>> Thanks for the help guys
>>>
>>> Alex
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>

