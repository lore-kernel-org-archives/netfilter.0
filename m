From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: ipset swap to nftables set
Date: Fri, 29 Sep 2023 21:59:42 +0200
Message-ID: <4af4812d-0b91-5b31-c4aa-e499e18ed65e@thelounge.net>
References: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
 <198a0e49-7406-45b8-9e7b-4c074a7b31dc@app.fastmail.com>
 <37e0df9b-fb90-c085-1b09-c35fc839e901@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <37e0df9b-fb90-c085-1b09-c35fc839e901@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: marek <cervajs64@gmail.com>, netfilter@vger.kernel.org



Am 29.09.23 um 21:47 schrieb marek:
> 
> Dne 2023-09-29 v 16:41 Kerin Millar napsal(a):
>> On Fri, 29 Sep 2023, at 2:44 PM, marek wrote:
>>> hi,
>>>
>>> i'm using in production ipset swap with ~3000 ip addr
>>>
>>> i.e.
>>>
>>> - change coming from customer (new ips, old ips deprecated)
>>>
>>> - generation of new list /etc/sysconfig/ipset-new
>>>
>>> - swap ipset-new with ipset
>>>
>>> transaction is near real-time
>>>
>>>
>>> now i'm moving from RHEL7 to RHEL9 (rocky, kernel 5.14, nftables 1.0.4)
>>> and trying move from ipset to nftables sets
>>>
>>> nft add set ip filter blackhole { type ipv4_addr\; comment \"drop all
>>> packets from these hosts\" \; }
>>> fill the set
>>>
>>> now the new flow is
>>>
>>> - change coming from customer (new ips, old ips deprecated)
>>>
>>> - nft flush set ip filter blackhole
>>>
>>> - nft add element ip filter blackhole { X }   (bash for loop)
>> Executing nft repeatedly will certainly be slow, if that is what you 
>> are currently doing. I'd be interested to know what you are using for 
>> to iterate over precisely because there's a fair chance that your use 
>> of for is an anti-pattern to begin with.
>>
>>>
>>> it tooks 10sec
>>>
>>> can you recommend better way? (performance similar to ipset swap)
>> Yes, definitely. However, I would prefer to see some of the existing 
>> code first. This will make it easier to provide clear guidance as to 
>> how to modify your script. In particular, please make it clear where 
>> the input data comes from, and the precise format of this data.
> 
> 
> i'll try tip from previous mail
> 
> current version is very simple loop like
> 
> cat file | while read i
> 
> do
> 
> nft add element ip filter blackhole { $i }
> 
> done
> 
> "i" is  ipv4 /32 ip address

this is always a problem - with a list of 10k records you call a binary 
10k times - you have the same difference between "iptables restore" and 
call iptables thousands of times

i disklike nftables in general and especially because oyu can't have you 
ipsets completly seperate and load the atomically at every point in time

hopefully iptables-nft will last forever
