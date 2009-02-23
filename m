From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Mon, 23 Feb 2009 21:40:05 +0100
Message-ID: <49A309A5.3070300@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org> <4981D4EB.3060007@univ-nantes.fr> <49881800.20707@netfilter.org> <49896FEA.3050803@univ-nantes.fr> <4989713B.2010502@netfilter.org> <498C004A.20506@univ-nantes.fr> <49901394.30504@netfilter.org> <49917D90.8090706@univ-nantes.fr> <49929106.8080006@netfilter.org> <49952D6E.4020501@univ-nantes.fr> <49958FA7.1030702@netfilter.org> <499B0696.2020300@netfilter.org> <49A2C2F2.2050604@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49A2C2F2.2050604@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

Yoann Juet wrote:
> Pablo Neira Ayuso wrote:
>> Pablo Neira Ayuso wrote:
>>> Please, add the following line here to your scripts:
>>>
>>> conntrackd -B -C /etc/conntrackd.conf
>>>
>>> Let me now if that fixes your problem.
>>
>> Updates? I'm intrigued with your problem. Some more info for
>> troubleshooting. You have the commands:
>>
>> display internal cache (states that belong to this node)
>> # conntrackd -i
>>
>> display external cache (states that belong to other nodes)
>> # conntrackd -e
>>
>> While trigering fail-overs, you should see the same states in the
>> active's internal cache and the backup's external cache. If that does
>> happen, there's a problem somewhere.
>>
>> I'm about to release 0.9.11 but before I'd like to close pending issues.
> 
> The issue is solved by adding "conntrackd -B" to my script. According to 
> the logs, such instruction sends bulk update. What is it for exactly ?

It forces the new primary to send a bulk update with the current state 
(that has been injected into the kernel) to the backup. You were using 
heartbeat? It seems that heartbeat triggers the backup state transition 
(thus, the request to resync to the new primary) before the new primary 
is itself in sync.

BTW, this change in the primary-backup.sh script has been already 
included in the conntrack-tools 0.9.11 (that I release a couple of days 
ago).

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
