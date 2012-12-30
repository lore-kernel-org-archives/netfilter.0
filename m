From: Michael Ludvig <mludvig@logix.net.nz>
Subject: Re: How to use IPv6 SNPT?
Date: Sun, 30 Dec 2012 23:37:06 +1300
Message-ID: <50E01952.7040901@logix.net.nz>
References: <50D1ADEE.8010805@logix.net.nz> <50D47976.6090409@sophos.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50D47976.6090409@sophos.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ulrich Weber <ulrich.weber@sophos.com>
Cc: netfilter@vger.kernel.org

On 22/12/12 04:00, Ulrich Weber wrote:
> NAT table is only called once for each connection.
> Since you use stateless NAT better use the mangle table.

Hi Ulrich

thanks for the suggestion. I made the change and now all the pings are
translated, however I struggle with the ping replies reaching my VM.

What I now have:

ip6tables -t mangle -I POSTROUTING -s fd00::/64 \! -o vboxnet0 \
    -j SNPT --src-pfx fd00::/64 --dst-pfx 2001:e20:2000:40f::/64

ip6tables -t mangle -I PREROUTING -i wlan0 -d 2001:e20:2000:40f::/64 \
    -j DNPT --src-pfx 2001:e20:2000:40f::/64 --dst-pfx fd00::/64

And also these sysctl settings:
net.ipv6.conf.all.forwarding = 1
net.ipv6.conf.all.accept_ra = 2
net.ipv6.conf.default.forwarding = 1
net.ipv6.conf.default.accept_ra = 2

Now the ping goes to google and back...
23:18:01.915631 IP6 2001:e20:2000:40f:b5d0:27ff:feec:3987 >
2404:6800:4006:804::1012: ICMP6, echo request, seq 1, length 64

23:18:01.954867 IP6 2404:6800:4006:804::1012 >
2001:e20:2000:40f:b5d0:27ff:feec:3987: ICMP6, echo reply, seq 1, length 64

... but my laptop (the gateway) rejects it:
23:18:04.961643 IP6 2001:e20:2000:401:a11:ff:fe04:50cd >
2404:6800:4006:804::1012: ICMP6, destination unreachable, unreachable
address fd00::b00:27ff:feec:3987, length 112

This is from the external wlan0 (wifi) interface. Nothing with regards
to the reply appears on the internal vboxnet0 interface.

What am I doing wrong?

Thanks!

Michael




>
> Cheers
> Ulrich
>
> On 12/19/12 13:07, Michael Ludvig wrote:
>> Hi guys
>>
>> I did some experimenting with the new NAT support for IPv6 and was quite
>> impressed how smoothly MASQUERADE and SNAT work.
>>
>> However I didn't have any success with IPv6 SNPT. As I understand it
>> SNPT is meant for 1:1 address translation and should simply replace src
>> prefix with dst prefix.
>>
>> For testing I use fd00::/64 address range in my VirtualBox network with
>> SLAAC addresses.
>>
>> ip6tables -t nat -I POSTROUTING -s fd00::/64 \
>>      -j SNPT --src-pfx fd00::/64 --dst-pfx 2001:e20:2000:xx::/64
>>
>> The strange thing is that only the first ping6 packet to google is
>> translated, the subsequent ones on the external interface are still in
>> fd00::/64:
>>
>> Seq 1 - translated:
>> 00:49:25.699206 IP6 2001:e20:2000:xx:b5d0:27ff:feec:3987 > \
>>      2404:6800:4006:804::1017: ICMP6, echo request, seq 1, length 64
>>
>> Seq 2&3 - untranslated source:
>> 00:49:26.699498 IP6 fd00::a00:27ff:feec:3987 > \
>>      2404:6800:4006:804::1017: ICMP6, echo request, seq 2, length 64
>> 00:49:27.699436 IP6 fd00::a00:27ff:feec:3987 > \
>>      2404:6800:4006:804::1017: ICMP6, echo request, seq 3, length 64
>>
>> Once I remove the SNPT rule and replace it with a simple -j MASQUERADE
>> it begins to work. Forwarding is obviously enabled and no other firewall
>> rules are in place (neither in 'nat' table nor elsewhere). My kernel is
>> 3.7.0-rc8, iptables from the current git checkout.
>>
>> What am I doing wrong?
>>
>> Thanks!
>>
>> Michael
>>
>>
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>

