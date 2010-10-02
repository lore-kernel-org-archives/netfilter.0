From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: netfilter and IPsec?
Date: Sun, 3 Oct 2010 00:50:09 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010030033340.20011@obet.zrqbmnf.qr>
References: <20101002201135.20008i4gzdc62t3s@webmail.physik.uni-muenchen.de> <alpine.LNX.2.01.1010022245280.13529@obet.zrqbmnf.qr> <20101002233657.50131qtofq9apla8@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20101002233657.50131qtofq9apla8@webmail.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Anton Mitterer <christoph.anton.mitterer@physik.uni-muenchen.de>
Cc: netfilter@vger.kernel.org

On Saturday 2010-10-02 23:36, Christoph Anton Mitterer wrote:

>Quoting Jan Engelhardt:
>>>#allow IKE to/from these hosts without IPsec
>>>-A ipsec-only   --protocol udp  -m udp  --source-port isakmp
>>>--destination-port isakmp -j ACCEPT
>>>-A ipsec-only   --protocol udp  -m udp  --source-port isakmp-nat
>>>--destination-port isakmp-nat -j ACCEPT
>>
>>But in the NAT scenario, the source port may no longer be 4500.
>>I think you want --dport here in both cases.
>
>Ah,.. good point, but why in both cases? With the non-NAT scenario, 
>aren't both ports 500?

I cannot be certain of it, but it could certainly happen when two IKE 
clients behind a NAT establish an exchange at the same time.

Just like many other protocols such as HTTP, what really is consistent 
most of the time is the dport.

>>>1) As you see, I tried to first allow from/to hostB: udp/500 and 
>>>udp/4500 for the key negotiations.
>>
>>4500 is also used for espinudp transport, not just IKE.
>
>Mhh,... what's that? Is this the encapsulation in UDP packet 
>(forceencaps in strongswan)?

Yeah whichever (it's called espinudp in the kernel); not only is it used 
when forceencaps is on, but whenever there is a NAT sitation that 
demands it.

>Are there any other ports or so I have to open?

No.

>> Well where's your rule to it?
>
>I've not yet done one, because I didn't knew how policy work, and with 
>just adding a normal rule like (e.g. I want to allow tcp/4369 from 
>hostB (but ONLY when encrypted) to do erlang/ejabberd clustering) like: 
>-A INPUT --destination eth0_ip --protocol tcp -m tcp --destination-port 
>4369 -j ACCEPT it would be filterd out by above rules, as the source 
>address is that of hostB, and proto != esp, right?
>
>
>>> So when during netfilter are packets still esp, and when are they
>>> authenticated/decrypted, and I see (and can match) the "normal" IP packet?
>>
>>The normal ones with -m policy.
>
>Is there some more elaborate description on this, than that of the manpage?
>I must admit that I don't understand how to use it, an what it actually 
>matches :/

It allow to check for the tunnel parameters when a packet has 
already been decrypted and decapsulated.
(-m policy --dir in --tunnel-src 134.76.83.5 --tunnel-dst 188.40.89.202 
-s 192.168.100.0/24 -d 192.168.200.0/24 for example)

For outgoing, something different is needed- but I don't have it at 
hand.

>>>Does the INPUT/OUTPUT queues even ever see esp packets?
>>
>>Of course.
>
>How does this conceptually work, when I have encapsulated protocols 
>like with ESP/AH where I have IP within IP. Is first the ESP packet 
>going through netfilter/IP stack, then it's decrypted authenticated and 
>the resulting IP packet goes through it again?

Exactly; as per the graph in http://en.wikipedia.org/wiki/Iptables
