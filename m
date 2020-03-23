From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: TCP and UDP dport in the same rule
Date: Mon, 23 Mar 2020 13:43:45 +0100
Message-ID: <ad3e251f-8453-efc4-5c9e-c167a8989e20@thelounge.net>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
 <477be69c-1afd-233c-1126-b081aab6a244@thelounge.net>
 <0b44d0eb-5d52-d0c8-fe6c-ccbe6ba88e01@fhmtech.com>
 <7f1b28fa-faeb-c89d-b94f-74e412c02e8f@thelounge.net>
 <20200323114606.y4mudsebactsddkn@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200323114606.y4mudsebactsddkn@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Frank Myhr <fmyhr@fhmtech.com>, Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Am 23.03.20 um 12:46 schrieb Pablo Neira Ayuso:
> On Sun, Mar 22, 2020 at 05:36:47PM +0100, Reindl Harald wrote:
>>
>>
>> Am 22.03.20 um 15:43 schrieb Frank Myhr:
>>> nftables has its own concept of sets:
>>> https://wiki.nftables.org/wiki-nftables/index.php/Sets
>>>
>>> I don't know of a way to use ipset with nftables
>>
>> well, that's a showstopper for even consider switch to nftables given
>> the amount of code maintainig ipsets from shell scripts *because* they
>> live outside of the ruleset
> 
> Probably you can keep your set configuration in a separated file, e.g.

no, i spent hundrets to thousands of hours for a setup which runs
unaltered on a rsync clone within a nested ESXi for a 100% simulation
for autotests and there is way more magic than "put them in seperated files"

no way that i ever touch nftables when i have to a full year work again
and hopefully "iptables" stays for a long time

{LAN_BASE_IPV4} depends on a shell variable which depends on $HOSTNAME
and so on......

[root@firewall:/scripts/firewall]$  cat ipset_ADMIN_CLIENTS.txt
# Supported:
#  - Single IP   (192.168.1.1)
#  - CIDR-Ranges (192.168.1.0/24)
#  - From-To     (192.168.1.10-192.168.1.20)
#
# Substitution:
#  - {LAN_BASE_IPV4}
#  - {WAN_BASE_IPV4}
#  - {IPV6_PREFIX}

{LAN_BASE_IPV4}.244
{LAN_BASE_IPV4}.103
