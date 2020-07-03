From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: IP masquerading not applied in TCP retransmission packets
Date: Fri, 3 Jul 2020 14:04:54 +0200
Message-ID: <2c0b4cea-003d-75e9-b78e-b43993d30c36@thelounge.net>
References: <86a0fca6-4ac9-84e6-47d8-5911ee8ffbdb@aleksander.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <86a0fca6-4ac9-84e6-47d8-5911ee8ffbdb@aleksander.es>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aleksander Morgado <aleksander@aleksander.es>, netfilter@vger.kernel.org



Am 03.07.20 um 13:54 schrieb Aleksander Morgado:
> I'm trying to debug an issue found on an old Ubuntu 14.04 system running kernel 3.13.0-53 with iptables v1.4.21. The system acts as a router providing access to the Internet to several subnets, with the usual NAT rules:
> 
>   $ sudo iptables -t nat -S
>   -P PREROUTING ACCEPT
>   -P INPUT ACCEPT
>   -P OUTPUT ACCEPT
>   -P POSTROUTING ACCEPT
>   -A POSTROUTING -o eth0 -j MASQUERADE
> 
> The FORWARD chain rules in the main table look like this:
>   $ sudo iptables -S
>   ...
>   -P FORWARD ACCEPT
>   -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
> 
> The problem I am seeing is that TCP retransmissions originated in the subnet clients end up WITHOUT the IP masquerading applied, i.e. the original client IP of the subnet is found in the IP packets instead of the IP address of the outgoing interface in the router. I saw this issue in a system in production, and I attempted to reproduce the problem with some iptables DROP rules that trigger it

i would guess that it ended as "ctstate INVALID" because the network
layer on the firewall machine saw no reason that this re-transmit
happened at all

out-of-order packages typically are INVALID and nat only applies to NEW

it could be a bug but also that the re-transmit was not needed at all
because the ACK came back and there was a race between re-transmit and ACK
