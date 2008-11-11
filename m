From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd + mark problems
Date: Tue, 11 Nov 2008 16:04:02 +0100
Message-ID: <49199EE2.7020901@netfilter.org>
References: <491879DD.2060608@3gnt.net> <49195D0E.2050906@netfilter.org> <491964D0.8030407@3gnt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <491964D0.8030407@3gnt.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Igor Neves <igor@3gnt.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Igor Neves wrote:
> Pablo Neira Ayuso wrote:
>> Igor Neves wrote:
>>   
>>> Hi,
>>>
>>> First of all, i would like to thanks you, for your great your.
>>>
>>> I have setup two firewalls with conntrackd in Centos 5, and everything
>>> it's ok and working as it should. By the way I have used heartbeat as HA
>>> manager, for that I have to develop conntrackd init script, and one ocf
>>> script for heartbeat. There are any interest in adding them to tree?
>>>     
>>
>> If they are generic enough to help others to set up hearbeat +
>> conntrackd, I'll be fine with it. Please, send them to me so I can check
>> them and don't forget to add the corresponding credits.
>>   
> Yes, they are generic, but I found one bug last night, I will correct
> and test everything, and mail them back to you.

OK, thank you Igor.

>>> I just have found one problem, in this 2 firewalls I need to setup
>>> "Policy Routing" and "Policy Shaper", but our solutions are based on
>>> mark's.
>>>
>>> I noticed that when the the backup firewall takes over the service(go to
>>> primary), and the primary goes to state backup, the connmark connections
>>> move from one to the other without any problem but it does not take the
>>> mark with it, it always insert the rule in the new primary with "mark=0".
>>>
>>> Is this a configuration problem? A todo item? A bug?
>>>     
>>
>> Looking at the archives, conntrack-tools >= 0.9.5 and Linux kernel >=
>> 2.6.20 supports connmarking. Please, try to guess where the connmark is
>> getting lost:
>>   
> Maybe this is the problem, centos 5 still use 2.6.18 releases.
>> (in the primary) # conntrack -L                # shows kernel table
>>   
> # conntrack -L -d 10.0.0.72
> tcp      6 431979 ESTABLISHED src=192.168.1.1 dst=10.0.0.72 sport=38004
> dport=22 packets=11 bytes=1608 src=10.0.0.72 dst=10.0.0.55 sport=22
> dport=38004 packets=11 bytes=1987 [ASSURED] mark=12 use=1
> 
> As you can see, there is the mark there.
> 
>> (in the primary) # conntrackd -i               # shows userspace cache
>>   
> In the cache, I have the connection, but it does not say anything about
> mark's.
> 
> # conntrackd -i
> tcp      6 ESTABLISHED src=192.168.1.1 dst=10.0.0.72 sport=38005
> dport=22 packets=2 bytes=112 src=10.0.0.72 dst=10.0.0.55 sport=22
> dport=38005 packets=1 bytes=60 [ASSURED] [active since 2s]

You need to upgrade to a Linux kernel >= 2.6.19 to support connmarking.
The events do not include the connmark in earlier versions.

Alternatively, you may write your own patch to include connmark in event
messages, it should straight forward - diff nf_conntrack_netlink.c
2.6.18 and 2.6.19 - although I don't know if you're a programmer.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
