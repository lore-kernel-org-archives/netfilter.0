From: Pradeep Jindal <praddyjindal@gmail.com>
Subject: Re: Cannot go out the firewall from internal network (NAT)
Date: Wed, 15 Nov 2006 23:14:49 +0530
Message-ID: <455B5211.3060400@gmail.com>
References: <e8c943190611130715g6d88ccabu4d87bc6ecf3826d9@mail.gmail.com>	
	<4559A9B3.8080205@gmail.com>
	<e8c943190611141158x489ed2feh36fe6fad2cb2fdc8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e8c943190611141158x489ed2feh36fe6fad2cb2fdc8@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marco Nicoloso <nicolm@gmail.com>
Cc: netfilter@lists.netfilter.org

Marco Nicoloso wrote:
>> #Forward delle catene
>> iptables -A FORWARD -i eth1 -o eth0 -j laninet
>> iptables -A FORWARD -i eth0 -o eth1 -j inetlan
>>
>> Above shows eth1 is your LAN interface and eth0 is your WAN interface.
>>
>> but....
>>
>> #Setting up NAT
>> iptables -t nat -A POSTROUTING -o eth1 -s 192.168.7.0/24 -j SNAT --to
>> xxx.xxx.xxx.xxx
>>
>> this shows eth1 is your WAN interface, please clarify on this thing.
>>
>> Pradeep
>>
>
> Yes, thnk you very much Pradeep, I was wrong, I corrected it but...
>
> ...anyway still it doesn't work as I want. For now it is acting only
> like a NAT, I want to understand how NAT + Packet Filtering work
> together, I read the howtos provided by netfilter.org. And
> particularly I didn't understand:
>
> 1) POSTROUTING chain is processed after the FORWARD chain, isn't it?
> But do I really need the FORWARD chain? If yes, do I need to setup my
> rules for filtering the packets coming from my LAN which I want to
> pass through the firewall (using a DROP policy) in the FORWARD or just
> in the INPUT chain, or in both of them?
firewall machine = the machine where you are setting up the iptables rules.

Packet filtering rules should always be in filter table (if there is no 
special case).
Filter table doesn't have POSTROUTING chain, that is FORWARD is required.
INPUT chain sees only those packets which are destined for the firewall 
machine.
FORWARD chain sees the packets which the firewall machine routes either from
LAN to WAN or from WAN to LAN.
OUTPUT chain sees the packets which the firewall machine generates.

Assuming you how the routing works. (I mean operations related to that).
PREROUTING chain of nat table sees the packets before the routing decision
has been done.
POSTROUTING chain of nat table sees the packets after the routing decision
has been done.

So, ultimately this is all about which packets you want to act upon
and where (in kernel network stack). Further which operation you want to 
do. Either filtering or
network address translation (NAT).
>
> 2) Which is the right place for the NATting rules in my script? That
> is, NAT rules must be placed before or after PF rules (for me after,
> but as NAT controls different chains because `nat' is a different
> table... maybe it's the same)
I think the above description answers this also.
>
> 3) Someone can verify the following sentence if I understood
> correctly: "Packet coming from any network connected to the firewall
> enters the chain INPUT: rules are processed from the first in order to
> the end, if a suiting rule for it is found, then the faith of the
> packet depends only on that rule; if not packet is either dropped or
> accepted, depending on the general policy of the chain above
> mentioned"
>
> Thanks.
>
> Marco Nicoloso
>

All in all, netfilter framework is all about hooks in the kernel's 
network stack.

Regards,
Pradeep


