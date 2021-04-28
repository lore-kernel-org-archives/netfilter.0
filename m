From: R C <cjvijf@gmail.com>
Subject: Re: nftables equivalent for iptable rules.
Date: Wed, 28 Apr 2021 17:20:32 -0600
Message-ID: <a2a7475a-56cf-6d5b-afa6-54a6a7e1de9a@gmail.com>
References: <2ddec11e-b22f-39ef-c8c0-fc08438aa26a@gmail.com>
 <YInrQ/AMEaeWqwf+@egarver.remote.csb>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=oRbPnDFLMs7W/Mu14/UzSoIrsLhR8P+Ondj0U9zcCSc=;
        b=hzzAUGR6675zEtdeFaEHrscs2kkiu6mdvu1tYL2Fyv8ZJk2JR4pm2xHCMlr4dZOxal
         QoPEpP9y3LZMVplnPNE/0emBWGD4WUk84w2AExiQniayqYeL5fmd+O7YZMgd7JkbEIaB
         EOW+F+/RiZvylbnQgERzl+ye3rE/JscnbSPp9ciHaNeyc1YNQ3Bfi35slOlC/qN/w4Ll
         Rh6XuBNmp7+/JeOUiFm7yWwU69+AVaaHSHNqIwrbC7OENVOSlyStgIJyeEE8ic9ARr3p
         dIxQhb9GQEG7bK9PAogv9EVkitCk3EWgQqBjQU72m6RaTrfXIkU9cmjalSHKDzvtmYQW
         Ld3w==
In-Reply-To: <YInrQ/AMEaeWqwf+@egarver.remote.csb>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Eric Garver <eric@garver.life>, netfilter@vger.kernel.org


On 4/28/21 5:09 PM, Eric Garver wrote:
> On Wed, Apr 28, 2021 at 03:12:14PM -0600, R C wrote:
>> Hello,
>>
>>
>> I have a machine I am running RHEL 8 on. there are two interfaces and I want
>> to forward all traffic between those interfaces (for the src and dst in the
>> subnet a wireless device is on).
>>
>> One interface is connected to a switch, WAN side. The other ethernet port
>> has an access point, connected wired.
>>
>> I did turn on ipforwarding, and thought I needed only two firewall rules.
>>
>>
>> sysctl -w net.ipv4.ip_forward=1
>> firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -o eno1 -i
>> enp0s20u4u1 -j ACCEPT
>> firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -o enp0s20u4u1 -i
>> eno1 -j ACCEPT
>>
>>
>> However,  when I try to do a DNS lookup, it looks like it is being
>> blocked/stopped by the firewall, because when I stop the firewall, it just
>> seems to work. With the firewall up and running, however I can ping an ip
>> address.
> Makes sense. firewalld is using the nftables backend and you're adding
> direct iptables rules. The packet must pass through both iptables and
> nftables.  The forwarding between interfaces is not enabled in nftables
> (firewalld).

ah wait,  I also saw a msg from you on the firewalld list where I asked 
the same question

>> for example; if I do "ping www.google.com"  I get a "ping www.google.com:
>> Name or service not known"  If I use  an IP address (from www.google.com),
>> it just works.
>>
>> from what I understand is that iptables lets traffic through that way, but
>> bftables does not.  One solution suggested was to  change the firewalld
>> backend to iptables, which works, but since at some point I'd need to have
>> it work with the nftables back end, I might as well look into that now.
> IMO, you have two choices:
>
>    1. upgrade to a newer firewalld (v0.9.0 or later) that has native
>       forward filtering
>       - https://firewalld.org/2020/04/intra-zone-forwarding
>       - https://firewalld.org/2020/09/policy-objects-introduction
>       - these features should appear in RHEL-8.5
>
>    2. Use the firewalld iptables backend
>       - set FirewallBackend=iptables in /etc/firewalld/firewalld.conf
>
> Any other solution will be out-of-band of firewalld and will likely
> break in the future.

Ok, so it is better for me to wait until rhel 8.5 is out, 8.4 beta is 
out now I believe, and use the iptables backend  until then


>
>> So; how do I  set up the firewal effectvely with the same result as  with
>> iptables?
> There is a tool called iptables-translate [1] that can do a rough
> translation. However, firewalld does not support adding direct nftables
> rules. So you would have to inject the rules out-of-band of firewalld -
> which is not recommended.

I tried to play with that, on a test machine, I noticed that didn't work 
well.


>
> Hope that helps.
> Eric.

it does,  thanks.


Ron


>
> [1]:
> https://wiki.nftables.org/wiki-nftables/index.php/Moving_from_iptables_to_nftables
>
