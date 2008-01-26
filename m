From: mouss <mouss@netoyen.net>
Subject: Re: Can I block nat'ed user with iptables?
Date: Sat, 26 Jan 2008 22:51:02 +0100
Message-ID: <479BAB46.4070501@netoyen.net>
References: <985036.73480.qm@web55409.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <985036.73480.qm@web55409.mail.re4.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

duren duren wrote:
> --- Rob Sterenborg <rob@sterenborg.info> wrote:
>
>   
>>> i have internet router using linux & i want only
>>>       
>> user1
>>     
>>> can access internet & user2 can't
>>> but if user1 use program like ccproxy, user2 can
>>>       
>> using
>>     
>>> internet from user1 as proxy server
>>>
>>> is't possible to block user from being nat'ed with
>>> iptables?
>>>       
>> Sure.
>>
>> INET_IP="a.b.c.d" # Your internet IP address
>> USER_IP="192.168.0.11" # IP of user1
>> LAN="192.168.0.0/24" # LAN where user1 is in
>>
>> $ipt -P FORWARD DROP
>> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED
>> -j ACCEPT
>> $ipt -A FORWARD -m state --state NEW -s $USER_IP -j
>> ACCEPT
>> $ipt -t nat -A POSTROUTING -s $LAN -j SNAT --to
>> $INET_IP
>>
>> Here, it's possible to perform NAT for the entire
>> LAN (see the rule for
>> the nat table). However, the policy for the FORWARD
>> chain in the filter
>> table (which is where most of us do filtering) is
>> set to DROP so every
>> packet that did not match a rule that accepts a
>> packet will be dropped.
>> Only ESTABLISHED and RELATED packets (which will be
>> the most) will be
>> accepted, as well as NEW packets from user1. This
>> way only user1 will be
>> able to use the internet (assuming routing is setup
>> correctly). It's up
>> to you to get ccproxy on the PC of user1 working.
>>
>>
>> Grts,
>> Rob
>>
>>     
>
> thanks Rob, but i'm litle bit confusing about this. If
> user1 install ccproxy & user2 use user1 as a proxy for
> their browser & user2 can connect.
> From linux server point of view, he just know, request
> come from user1 IP not from user2 IP, so he will
> forward it not block. is't right?
>   

If a proxy or NAT is used on Machine1, all you see is the IP of this 
machine. now what you can do depends on the details:

- first, why do you want to block user2. Without knowing the real 
problem details, you will not know whether any approach is the right 
solution.

- second, why does user1 install ccproxy? (is it to share the connection 
with user2?). battling against internal users is harder than fighting 
oustiders.

- finally, what kind of network architecture/administrative control are 
we talking about? (for example, things are different if you can put a 
firewall between the two users,  or if you can install a firewall on 
Machine1, ... etc).


one possibility is to disconnect user1 from time to time and tell him 
that he used all the bandwidth allocated for his usage. but if user2 
usage doesn't cause you trouble, the simplest solution is to let him 
connect...
