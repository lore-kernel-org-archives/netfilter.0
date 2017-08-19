From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Why can't we use DNAT in the INPUT Chain?
Date: Sat, 19 Aug 2017 19:07:41 +0200
Message-ID: <8980c2d3-8a82-651f-2553-8e15fbebfec8@plouf.fr.eu.org>
References: <5c984fa5-a2a5-340d-7cb6-6b21c3768e45@gmail.com>
 <20170819132827.GY2027@harrier.slackbuilds.org>
 <6ae93686-46d2-416e-b736-ca6e7fa45231@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6ae93686-46d2-416e-b736-ca6e7fa45231@gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org
Cc: khawar shehzad <shehzad.khawar@gmail.com>

Le 19/08/2017 à 16:16, khawar shehzad a écrit :
> 
> 3- Once the packet is accepted by the FILTER chain (i.e. there is a 
> mapping in the verdict map), I want to do DNAT (i.e. changing the 
> destination address of the packet)

DNAT makes sense only before the decision routing (so that the routing 
can be adapted to the new destination). So iptables allowed it only in 
the PREROUTING and OUTPUT chains.

> My solution is like the following, which is not working.
> 
> table ip6 natcap {
>          map natcap_vmap {
>                  type ipv6_addr . ipv6_addr : verdict
>                  elements = { 2001::20 . 2001::1:0:0:2 : accept}
>          }
>          chain prerouting_filter {
>                  type filter hook prerouting priority -101; policy drop;
>                  ip6 saddr . ip6 daddr vmap @natcap_vmap
>          }
(...)

What is this syntax ? This is not iptables.
