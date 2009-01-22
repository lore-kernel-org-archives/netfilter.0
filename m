From: David J Craigon <david@craigon.co.uk>
Subject: Re: Conntrack not recording packets going through a firewall [ 
	SOLVED! ]
Date: Thu, 22 Jan 2009 12:06:45 +0000
Message-ID: <c1ace6860901220406u52a890x6138d75492f379ea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=+0h1wO0sI6qiT3RQE0c+JfGkiswkF7zCpvegAtZSK+Y=;
        b=aZ+5OpiujmMo5iNrCuBgye9+P3qhz21Kh3tkTIlrljJ/8HSshM/Ra7yLsRxQGa4Erf
         Qc3bSQL3rLxsOvyuxPnjX6Pg2VROHvAcnKde3knsNk3sUCcXZ1wzx+T/PJJbf2qE6f7c
         sF3vALmfjk3KYy2feoLEDGZZTndB2uj4swLQA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've solved the problem! I've missed out a bit of useful information
for you, it turns out. I have bumped into the "conntrack doesn't work
with bridges" problem. I appreciate I didn't tell you I was using
bridges- sorry about that.

This is the stock kernel for CentOS 5. I understand this problem is
fixed in newer kernels, so I'll try one of those.

Thanks,

David

2009/1/21 Gilad Benjamini <gilad.benjamini@gmail.com>:
> I carefully went through your iptables rules in the original post, and other
> than a duplicate rule in Network-5 I can't really see a problem.
> The best tool to troubleshoot these issues is iptables counters. Reset the
> counters, run your test, look at the counters. This should give you a good
> picture of what's going on.
> Note, though, that counters do not show for packets caught by a chain
> default policy, so you might want to add explicit rules for these.
> I know that you already stated that this isn't a routing problem, but is it
> possible that packets between network-1 and network-5 travel through a
> router beyond your firewall ? i.e. between the firewall and the internet in
> your diagram ?
>
>> -----Original Message-----
>> From: netfilter-owner@vger.kernel.org [mailto:netfilter-
>> owner@vger.kernel.org] On Behalf Of David J Craigon
>> Sent: Wednesday, January 21, 2009 2:23 PM
>> To: netfilter@vger.kernel.org
>> Subject: Re: Conntrack not recording packets going through a firewall
>>
>> I seem to have ended up arguing on the internet, which wasn't really
>> my idea :-(.
>>
>> Right, let's go through this again.
>>
>> Internet--------Firewall------Server 1
>>                           |
>>                           ----------Server 5
>>
>> I'm working on the firewall, a linux box. The firewall has addresses
>> 10.72.2.1, 10.72.3.1 and 10.69.2.3, which goes off to the internet.
>> Server 1 has IP 10.72.2.3 and default gateway 10.72.2.1. Server 5 has
>> IP 10.72.3.3 and default gateway 10.72.3.1.
>>
>> Server 1 can see server 5. Server 1 can see the internet. Server 5 can
>> see server 1. Server 5 can see the internet.. There are absolutely no
>> routing problems whatsoever: Look! Here they are pinging each other!
>>
>> [root@server5 ~]# ping 10.72.2.3
>> PING 10.72.2.3 (10.72.2.3) 56(84) bytes of data.
>> 64 bytes from 10.72.2.3: icmp_seq=1 ttl=63 time=2.83 ms
>> 64 bytes from 10.72.2.3: icmp_seq=2 ttl=63 time=1.14 ms
>> 64 bytes from 10.72.2.3: icmp_seq=3 ttl=63 time=1.48 ms
>>
>> --- 10.72.2.3 ping statistics ---
>> 3 packets transmitted, 3 received, 0% packet loss, time 2002ms
>> rtt min/avg/max/mdev = 1.144/1.818/2.830/0.729 ms
>> [root@server5 ~]# traceroute 10.72.2.3
>> traceroute to 10.72.2.3 (10.72.2.3), 30 hops max, 40 byte packets
>>  1  10.72.3.1 (10.72.3.1)  4.367 ms  1.212 ms  5.749 ms
>>  2  10.72.2.3 (10.72.2.3)  5.196 ms  4.715 ms  5.163 ms
>> [root@server5 ~]#
>>
>> The reason I'm on the netfilter list, is because I'm trying to use the
>> firewall linux box as a firewall. Like I say, with my rule sets,
>> connections don't work from one server to the other for http traffic.
>> See my original email.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
