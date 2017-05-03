From: Jeremy Hansen <jeremy@cigarsoul.com>
Subject: Re: middleman Raspberry Pi wired to wifi configuration
Date: Wed, 3 May 2017 12:26:02 -0700
Message-ID: <8A480EC2-6022-4516-8CAE-AAF08CEE44BB@cigarsoul.com>
References: <88D4348C-63A1-47FC-B096-9DB67B239098@cigarsoul.com>
 <07a314f2-9a70-566a-e6d7-d40e5f0bbe5b@trustiosity.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.subtraverse.net 6985265F88
In-Reply-To: <07a314f2-9a70-566a-e6d7-d40e5f0bbe5b@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: zrm <zrm@trustiosity.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Unfortunately I’m not able to connect directly to the router.  I have to do this in an isolated way.  The office is inside of an old dive bar.  I’m trying to be as non-intrusive as possible…plus I don’t trust my equipment inside of this drinking establishment. 

With that said, it seems the pi might be my limiting factor.  Only 100mb ethernet and its wifi only supports 2.4G.  I ordered USB replacements but I’m still limited by the bus on the pi, so … maybe using a pi here isn’t the best option.

Thanks
-jeremy

> On May 3, 2017, at 10:10 AM, zrm <zrm@trustiosity.com> wrote:
> 
> > -A FORWARD -i eth0 -j ACCEPT
> 
> The chain default policy is already ACCEPT, so that does nothing.
> 
> Get rid of it and add this as the last filter rule:
> 
> -A FORWARD -i wlan0 -j REJECT
> 
> > -A POSTROUTING -o eth0 -j MASQUERADE
> > -A POSTROUTING -o eth0 -j MASQUERADE
> 
> Duplicate rule, and you don't need either of them, because any NEW traffic from the outside should hit the REJECT rule so there is nothing to MASQUERADE.
> 
> But none of that should make things *slow*. It's probably some kind of wireless problem. Make sure the channels your two access points use are as far away from each other as possible and put the Pi as physically close to the office access point as you can.
> 
> The better solution if possible would be to connect your router to the office network with ethernet.
> 
> 
> On 05/03/2017 07:32 AM, Jeremy Hansen wrote:
>> 
>> I’m sharing a wifi connection in some office space.  I’d like to create my own internal network.  I have a raspberry pi, connected to the office wifi, a switch connected to the ethernet port of the pi, and a wifi AP connected to the switch.  DHCP and DNS running on the Pi…
>> 
>> The configuration works and I’m able to gateway to the public internet via the AP connected to the Pi.
>> 
>> It’s just very slow and I’m wondering if it has to do with my iptables rules and the fact that it’s basically NAT’ing twice, once at the pi for my internal network, and secondly at the office’s main internet connection...
>> 
>> Here’s my current rules:
>> 
>> *filter
>> :INPUT ACCEPT [73:5085]
>> :FORWARD ACCEPT [0:0]
>> :OUTPUT ACCEPT [72:6792]
>> -A FORWARD -i eth0 -j ACCEPT
>> -A FORWARD -i wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
>> COMMIT
>> *nat
>> :PREROUTING ACCEPT [43:2584]
>> :INPUT ACCEPT [2:278]
>> :OUTPUT ACCEPT [0:0]
>> :POSTROUTING ACCEPT [0:0]
>> -A POSTROUTING -o eth0 -j MASQUERADE
>> -A POSTROUTING -o eth0 -j MASQUERADE
>> -A POSTROUTING -o wlan0 -j SNAT --to-source 192.168.10.30
>> COMMIT
>> 
>> 192.168.10.30 is the IP of the wireless interface on the PI.  This wireless interface is connected to the office wifi…
>> 
>> Not sure what other details I’m missing.  If there’s something I’m obviously doing wrong, please let me know.  It’s just extremely slow compared to going direct to the office network.
>> 
>> Thank you
>> -jeremy--
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

