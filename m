From: David Favro <netfilter@meta-dynamic.com>
Subject: Re: Selectively routing packets through different links
Date: Fri, 11 Jun 2010 08:13:39 -0400
Message-ID: <4C122873.2080909@meta-dynamic.com>
References: <AANLkTikbalU3OXYS8Bqc1ZfP79HjluILJY-5kXMI0UBs@mail.gmail.com> <4C1147B7.9030805@kickstone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C1147B7.9030805@kickstone.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Diego Lima <lists@diegolima.org>
Cc: netfilter@vger.kernel.org

John Lister wrote:
> I suspect you need to save the mark in the conntrack table so that it 
> is applied to every related packet - I've got a similar configuration 
> except I route out of multiple interfaces depending upon load and took 
> a while to get working reliably.
You shouldn't need to use CONNMARK because all of the outbound packets 
will have the same destination port and thus get marked by MARK, and the 
inbound packets don't typically need to get marked for a special routing 
table; however it might be a good idea to use CONNMARK anyhow, it may 
help with reverse-path filtering -- but alternatively, I would recommend 
turning RPF off anyhow:
echo "2" > /proc/sys/net/ipv4/conf/bnep0/rp_filter
Also,
echo "1" > /proc/sys/net/ipv4/conf/bnep0/log_martians
You can then check your kernel log to see if reverse-path filtering is 
causing you problems, which is a good possibility.  If you see martian 
packets in your log after setting rp_filter for the interface to 2 per 
above (but you shouldn't), then you could RPF entirely:
echo "0" > /proc/sys/net/ipv4/conf/all/rp_filter
echo "0" > /proc/sys/net/ipv4/conf/bnep0/rp_filter
... but I don't think that should be needed.

Also check your filter rules in iptables, are you explicitly dropping 
the packets?

> Diego Lima wrote:
>> 1 - Edit /etc/iproute2/rt_tables and add this:
>> 10 bluez
>>
>> 2 - Add the route and rule:
>> # ip route add via 192.168.21.1 dev bnep0 table bluez
>> # ip rule add fwmark 10 lookup bluez
>>
>> 3 - Add the iptables rules:
>> iptables -t mangle -I PREROUTING -i wlan0 -s 192.168.0.0/24 -p tcp -m
>> multiport --dports 80,443,8080 -j MARK --set-mark 10
>> iptables -t nat -I POSTROUTING ! -o lo -j MASQUERADE
Your masquerading looks to me to be overly aggressive, why masquerade 
packets going out to wlan0?
iptables -t nat -A POSTROUTING -o bnep0 -j MASQUERADE

If you have externally-originated incoming connections on bnep0 (I guess 
not, your message sounds like all of your traffic on bnep0 is 
connections that are originating from the LAN) -- but if so, you need 
more routing rules or iptables fwmark to make sure than inbound 
connections from bnep0 go back out through bnep0.

Hope that helps,
-- David

