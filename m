From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: netfilter and IPsec?
Date: Sat, 2 Oct 2010 22:51:03 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010022245280.13529@obet.zrqbmnf.qr>
References: <20101002201135.20008i4gzdc62t3s@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20101002201135.20008i4gzdc62t3s@webmail.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Anton Mitterer <christoph.anton.mitterer@physik.uni-muenchen.de>
Cc: netfilter@vger.kernel.org


On Saturday 2010-10-02 20:11, Christoph Anton Mitterer wrote:
>
> What I want to do is:
> 1) allow key negotiation
> 2) reject any traffic from hostA to hostB that is NOT secured with esp,
> otherwise (e.g. in case strongswan crashes or so). Packets which are secured
> using esp, should not automatically be accepted however.
> 3) optionally, allow exceptions from 2, when e.g. the protocol is already
> secured (e.g. TSIG with DNS).
>
> So I started with about this (rules from hostA):
> *filter
>
> #allow IKE to/from these hosts without IPsec
> -A ipsec-only   --protocol udp  -m udp  --source-port isakmp
> --destination-port isakmp -j ACCEPT
> -A ipsec-only   --protocol udp  -m udp  --source-port isakmp-nat
> --destination-port isakmp-nat -j ACCEPT

But in the NAT scenario, the source port may no longer be 4500.
I think you want --dport here in both cases.

> #otherwise, deny all non IPsec ESP to/from these hosts
> -A ipsec-only   --protocol !esp -j REJECT  --reject-with icmp-admin-prohibited
>
> #other rules e.g.
> # Allow incomming packets for the nameserver
> -A INPUT        --destination eth0.localhost  --protocol udp  -m udp
> --destination-port domain         -j ACCEPT
> -A INPUT        --destination eth0.localhost  --protocol tcp  -m tcp
> --destination-port domain  --syn  -j ACCEPT
>
>
> 1) As you see, I tried to first allow from/to hostB: udp/500 and udp/4500 for
> the key negotiations.

4500 is also used for espinudp transport, not just IKE.

>2) Reject then everything !esp from/to hostB.
>3) Next I wanted to accept incomming packets "just normal" (as without IPsec)
>based on e.g. destination address and dport (given the fact that those packages
>should be already authenticated/decrypted).
>And outgoing packets should simply pass out (as they're esp, and my OUTGOING
>policy is ACCEPT).
>
>But that doesn't work like this, does it?

Well where's your rule to it?

>So when during netfilter are packets still esp, and when are they
>authenticated/decrypted, and I see (and can match) the "normal" IP packet?

The normal ones with -m policy.

>Does the INPUT/OUTPUT queues even ever see esp packets?

Of course.
