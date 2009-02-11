From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Wed, 11 Feb 2009 09:49:10 +0100
Message-ID: <49929106.8080006@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org> <4981D4EB.3060007@univ-nantes.fr> <49881800.20707@netfilter.org> <49896FEA.3050803@univ-nantes.fr> <4989713B.2010502@netfilter.org> <498C004A.20506@univ-nantes.fr> <49901394.30504@netfilter.org> <49917D90.8090706@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49917D90.8090706@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

Yoann Juet wrote:
> Pablo Neira Ayuso wrote:
>>> As you can see, this TCP connection is present:
>>>
>>> root@fw1-irt:~# conntrack -L  |grep 34189
>>> conntrack v0.9.10 (conntrack-tools): 14 flow entries has been shown.
>>> tcp      6 10581 ESTABLISHED src=172.18.244.10 dst=193.52.101.32
>>> sport=34189 dport=5222 packets=63 bytes=12039 src=193.52.101.32
>>> dst=172.18.244.10 sport=5222 dport=34189 packets=58 bytes=22146
>>> [ASSURED] mark=0 secmark=0 use=1
>>
>> This is weird, look like some problem in your scripts or the commit is
>> not working in node fw1-irt. The packet counters of the entry above show
>> that this is the old entry which is stuck in the cache after the second
>> failover. This should be deleted when fw1-irt's script issues the commit
>> (conntrackd -c). Does the log file tells that the commit was successful?
>>
> 
> I confirm that "conntrackd -c" is executed on FW1-IRT on the second
> failover. FYI, my LSB script executes the following instructions (start=
> new active node ; stop = new passive node):
> 
> ...
> case "$1" in
>         start)
>                 conntrackd -c -C /etc/conntrackd.conf
>                 conntrackd -f -C /etc/conntrackd.conf
>                 conntrackd -R -C /etc/conntrackd.conf
>                 exit 0
>                 ;;
> 
>         stop)
>                 #conntrackd -t -C /etc/conntrackd.conf
>                 conntrackd -n -C /etc/conntrackd.conf
>                 exit 0
>                 ;;

Before the second failover, does conntrackd -e in FW1-IRT (now in backup
mode) show, at least, one entry that talks about the TCP connection that
is in trouble? I think that it will not show any (but it should show
one, so I think that I have found the problem ;). Please, confirm this
and I'll get back to you with a possible solution soon.

BTW, why your script does not invoke the '-t', did you notice any
problem? That schedules the cleanup of the kernel conntrack table after
PurgeTimeout seconds when a node enters backup mode.

Thanks for your patience.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
