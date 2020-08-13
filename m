From: sean darcy <seandarcy2@gmail.com>
Subject: Re: ingress hook on interface with multiple addresses ?
Date: Thu, 13 Aug 2020 17:14:15 -0400
Message-ID: <rh4af8$66g$1@ciao.gmane.io>
References: <rh12jg$1392$1@ciao.gmane.io>
 <20200812205705.GA1660@breakpoint.cc> <rh1n0o$163n$1@ciao.gmane.io>
 <20200812220305.GB1660@breakpoint.cc> <20200813005444.GA1272@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200813005444.GA1272@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 8/12/20 8:54 PM, Pablo Neira Ayuso wrote:
> On Thu, Aug 13, 2020 at 12:03:05AM +0200, Florian Westphal wrote:
>> sean darcy <seandarcy2@gmail.com> wrote:
>>> On 8/12/20 4:57 PM, Florian Westphal wrote:
>>>> sean darcy <seandarcy2@gmail.com> wrote:
>>>>> I have an interface with 2 ip addresses:
>>>>>
>>>>> ip a
>>>>> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group
>>>>> default qlen 1000
>>>>> ............
>>>>> 2: enp1s0f1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state
>>>>> UP group default qlen 1000
>>>>>       link/ether 98:29:a6:48:49:8e brd ff:ff:ff:ff:ff:ff
>>>>>       inet 10.0.0.61/24 brd 10.0.0.255 scope global noprefixroute enp1s0f1
>>>>>          valid_lft forever preferred_lft forever
>>>>>       inet 10.0.0.2/32 scope global noprefixroute enp1s0f1
>>>>>          valid_lft forever preferred_lft forever
>>>>>
>>>>> When I try to add a chain on ingress hook, nft is unhappy:
>>>>>
>>>>> nft list table netdev foo
>>>>> table netdev foo {
>>>>> 	set allowlist {
>>>>> 		type ipv4_addr
>>>>> 		flags interval
>>>>> 		auto-merge
>>>>> 		elements = { 10.0.0.0/8, 127.0.0.1 }
>>>>> 	}
>>>>> }
>>>>>
>>>>>
>>>>> nft 'add chain netdev foo dev0filter { type filter hook ingress device
>>>>> enp1s0f1 priority 0 ; }'
>>>>> Error: Could not process rule: No such file or directory
>>>>> add chain netdev foo dev0filter { type filter hook ingress device enp1s0f1
>>>>> priority 0 ; }
>>>>
>>>> works fine for me on 5.7.11 kernel (with adjusted interface name).
>>>>
>>>>> Can you have a chain on ingress hook for an interface that has multiple
>>>>> addresses ?
>>>>
>>>> Its not relevant how many addresses are assigned.
>>>>
>>> I'm on Fedora 32:
>>>
>>> 5.7.14-200.fc32.
>>> rpm -q nftables libnftnl
>>> nftables-0.9.3-3.fc32.x86_64
>>> libnftnl-1.1.5-2.fc32.x86_64
>>
>> Exact same versions here:
>> libnftnl-1.1.5-2.fc32.x86_64
>> nftables-0.9.3-3.fc32.x86_64
>>
>> I will do a kernel update and see if that breaks it.
>> I get the same error message if I mistype the device name, but it looks
>> like thats not it as per your "ip a" output.
> 
> Probably this patch is missing in nftables-0.9.3-3.fc32.x86_64 ?
> 
> commit 78bbe7f7a55be48909067e25900de27623d8fa6a
> Author: Pablo Neira Ayuso <pablo@netfilter.org>
> Date:   Wed Feb 19 21:05:26 2020 +0100
> 
>      mnl: do not use expr->identifier to fetch device name
>      
>      This string might not be nul-terminated, resulting in spurious errors
>      when adding netdev chains.
> 

That may be. In any event, I made rpm packages of :

nftables-0.9.6-0.fc32.x86_64
libnftnl-1.1.7-3.fc32.x86_64

And now it works !!!

