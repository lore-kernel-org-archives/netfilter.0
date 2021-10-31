From: Jelle de Jong <jelledejong@powercraft.nl>
Subject: Re: how to mark a prerouting package so it will go through my ip
 route rule
Date: Sun, 31 Oct 2021 21:43:57 +0100
Message-ID: <992cb9e1-f330-4450-6c12-2581372c1fb0@powercraft.nl>
References: <11bdb458-222c-ebe8-f1ca-c8414da66020@powercraft.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <11bdb458-222c-ebe8-f1ca-c8414da66020@powercraft.nl>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 10/31/21 8:24 PM, Jelle de Jong wrote:
> Hello everybody,
> 
> I got the problem that I got multiple interfaces and routing and I got a 
> nat subnet and the packages coming back from the nat network go trough 
> my default routing table instead of one for the interface the package 
> entered the nftable, so I need to have a way to have the package coming 
> back in from the nat network to be marked.
> 
> I found the following wiki page and tried the following:
> https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_metainformation 
> 
> 
> # ip rule show from all fwmark 0x1 lookup 100
> 32762:    from all fwmark 0x1 lookup 100
> 
> table ip nat {
>      chain prerouting {
>          type nat hook prerouting priority 0; policy accept;
>          iifname "enp8s0" ip daddr 123.45.67.89 icmp type echo-request 
> mark set 0x00000001 ct mark set mark dnat to 192.168.25.25
>      }
>      chain postrouting {
>      }
> }
> 
> But the icmp reply coming back from 192.168.25.25 is not being picked by 
> my ip rule fwmark.
> 
> Can somebody give me an example how to track prerouting nat with an 
> fwmark for ip rule?

I managed to get the following working!!

# ip rule show from all fwmark 0x1 lookup 100
32762:  from all fwmark 0x1 lookup 100

table ip mangle {
         chain prerouting {
                 type filter hook prerouting priority -150; policy accept;
                 counter meta mark set ct mark
                 mark != 0x0 counter accept
                 iifname "enp8s0" ip daddr 185.40.94.87 counter meta 
mark set 0x1
         }

         chain postrouting {
                 type filter hook postrouting priority -150; policy accept;
                 counter ct mark set mark
         }
}

Is this the most optimal way of configuring this?

Kind regards,

Jelle de Jong
