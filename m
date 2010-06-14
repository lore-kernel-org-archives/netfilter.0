From: Diego Lima <lists@diegolima.org>
Subject: Re: Selectively routing packets through different links
Date: Mon, 14 Jun 2010 14:02:51 -0300
Message-ID: <AANLkTik31uGEMd6yE2ZGmS7X47YrxAKn2UtmZFSf6OO0@mail.gmail.com>
References: <AANLkTikbalU3OXYS8Bqc1ZfP79HjluILJY-5kXMI0UBs@mail.gmail.com>
	<4C1147B7.9030805@kickstone.com>
	<4C122873.2080909@meta-dynamic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C122873.2080909@meta-dynamic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Favro <netfilter@meta-dynamic.com>
Cc: netfilter@vger.kernel.org

Hi David,

Thanks a lot for the tip! It worked like a charm after changing the
rp_filter parameter. What are the downsides of having it turned off?

Thanks!

2010/6/11 David Favro <netfilter@meta-dynamic.com>:
> John Lister wrote:
>>
>> I suspect you need to save the mark in the conntrack table so that i=
t is
>> applied to every related packet - I've got a similar configuration e=
xcept I
>> route out of multiple interfaces depending upon load and took a whil=
e to get
>> working reliably.
>
> You shouldn't need to use CONNMARK because all of the outbound packet=
s will
> have the same destination port and thus get marked by MARK, and the i=
nbound
> packets don't typically need to get marked for a special routing tabl=
e;
> however it might be a good idea to use CONNMARK anyhow, it may help w=
ith
> reverse-path filtering -- but alternatively, I would recommend turnin=
g RPF
> off anyhow:
> echo "2" > /proc/sys/net/ipv4/conf/bnep0/rp_filter
> Also,
> echo "1" > /proc/sys/net/ipv4/conf/bnep0/log_martians
> You can then check your kernel log to see if reverse-path filtering i=
s
> causing you problems, which is a good possibility. =A0If you see mart=
ian
> packets in your log after setting rp_filter for the interface to 2 pe=
r above
> (but you shouldn't), then you could RPF entirely:
> echo "0" > /proc/sys/net/ipv4/conf/all/rp_filter
> echo "0" > /proc/sys/net/ipv4/conf/bnep0/rp_filter
> ... but I don't think that should be needed.
>
> Also check your filter rules in iptables, are you explicitly dropping=
 the
> packets?
>
>> Diego Lima wrote:
>>>
>>> 1 - Edit /etc/iproute2/rt_tables and add this:
>>> 10 bluez
>>>
>>> 2 - Add the route and rule:
>>> # ip route add via 192.168.21.1 dev bnep0 table bluez
>>> # ip rule add fwmark 10 lookup bluez
>>>
>>> 3 - Add the iptables rules:
>>> iptables -t mangle -I PREROUTING -i wlan0 -s 192.168.0.0/24 -p tcp =
-m
>>> multiport --dports 80,443,8080 -j MARK --set-mark 10
>>> iptables -t nat -I POSTROUTING ! -o lo -j MASQUERADE
>
> Your masquerading looks to me to be overly aggressive, why masquerade
> packets going out to wlan0?
> iptables -t nat -A POSTROUTING -o bnep0 -j MASQUERADE
>
> If you have externally-originated incoming connections on bnep0 (I gu=
ess
> not, your message sounds like all of your traffic on bnep0 is connect=
ions
> that are originating from the LAN) -- but if so, you need more routin=
g rules
> or iptables fwmark to make sure than inbound connections from bnep0 g=
o back
> out through bnep0.
>
> Hope that helps,
> -- David
>
>



--=20
Diego Lima
