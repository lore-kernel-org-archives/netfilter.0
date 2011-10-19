From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: Regarding iptable rules for SNAT
Date: Wed, 19 Oct 2011 16:43:38 -0700
Message-ID: <4E9F60AA.8090500@arpa.org>
References: <CADAe=+Lo46K956EAdtBchVUPkLs-aLoDk7p8HGC5-Bd4PGKy3Q@mail.gmail.com> <4E9DC674.3050607@arpa.org> <CADAe=++EOD5mLsVO2o3W85uLo2DWxBsdeyn8b=6UT9w0OAPYMA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADAe=++EOD5mLsVO2o3W85uLo2DWxBsdeyn8b=6UT9w0OAPYMA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Ajith Adapa <adapa.ajith@gmail.com>

On 10/18/2011 8:15 PM, Ajith Adapa wrote:
> I am sorry I am not able to get you ..
>
> Since we are using the MASQUERADE rule in POSTROUTING .. all the traffic
> from 192.168.*.* subnet will be Source natted to 10.12.*.* subnet right
> ? Why we have to again add rule in POSTROUTING chain to just say accept .. ?

The addition of the ACCEPT rule (before the masq rule) for traffic from 
192.168.1.x to 10.12.3.x will make it so those packets don't get 
masqueraded.  Unless there's a specific reason you would really want 
packets from 192.168.1.x to a host on the 10.12.3.x network to be 
masqueraded, you should let that type of traffic go through without 
translation.

Conventionally, you'd only want to masquerade traffic that's coming from 
an internal network and destined to a remote network (for example, 
anything on the internet, beyond your local gateway)

> On Wed, Oct 19, 2011 at 12:03 AM, Erik Schorr <erik-lists@arpa.org
> <mailto:erik-lists@arpa.org>> wrote:
>
>     On 10/17/2011 8:42 PM, Ajith Adapa wrote:
>
>         I have a following setup. GW eth1 (private ip) is connected to
>         the ISP
>         router. For host H1 I have set the DNS server as 10.12.3.10.
>
>         H1 (eth0) --- (eth0) GW (eth1) ---
>         H1 eth0 = 192.168.1.2
>         GW eth0 = 192.168.1.1
>         GW eth1 = 10.12.3.12
>         DNS = 10.12.3.10
>
>         I have added a rule in GW saying iptables -A POSTROUTING -t nat -o
>         eth1 -j MASQUERADE
>
>         Now when I am trying to access internet from host H1, DNS
>         queries are
>         being sent to 10.12.3.10 which are masqueraded in GW. Once replies
>         come back from DNS server then GW is replying back to DNS server
>         with
>         icmp destination unreachable.
>
>
>     If there's no reason to SNAT/masquerade traffic from eth0 to a host
>     on eth1 (10.12.3.*), you can try inserting an ACCEPT rule in the
>     POSTROUTING table just before the MASQUERADE rule, to prevent the
>     traffic from 192.168.1.* to 10.12.3.* having its source address
>     changed in flight:
>
>     # iptables -A POSTROUTING -t nat -o eth1 -m comment --comment "dont
>     masq stuff from private net to DMZ net" -s 192.168.1.0/24
>     <http://192.168.1.0/24> -d 10.12.3.0/24 <http://10.12.3.0/24> -j ACCEPT
>     # iptables -A POSTROUTING -t nat -o eth1 -m comment --comment "masq
>     everything else" -j MASQUERADE
>
>
>         Ideal cases once the reply comes back GW has to send it to the
>         host H1 right ?
>
>         Sorry if I am wrong or missed any steps down here ?
>
>         Regards,
>         Ajith
>
>

