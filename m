From: Stephen Satchell <list@satchell.net>
Subject: ip[6]tables implementation of rf_filter
Date: Sun, 18 Jul 2021 11:25:16 -0700
Message-ID: <c934e627-af1c-370d-cf3b-c1e45eb4290d@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

I'm in the process of updating everything in my little to support 
dual-stack IPv4/IPv6.  The firewall for the bridge between LAN and 
Internet needs to be updated. A working draft of the firewall generator 
specification may be found at:

> https://www.satchell.net/firewall_v2_specification.txt

for those who need more context understanding my questions. For example, 
details about the interface names can be found there.

I had a question about using the iptables(8) and ip6tables(8)  extension 
rp_filter.  Using the shorthand schematic form that is in my firewall 
generator specification, I think I have the inbound test just fine. I think.

> -t raw PREROUTING
>   -i enp1s0 -m rpfilter --loose --invert -j DROP

What I'm questioning is whether I have the outbound test also working. 
My goal is to prevent any packet being sent from my system that has a 
non-local IP address as the source.  So this is what I thought I would try:

> -t mangle POSTROUTING                            (ip6tables only)
>   -o enp1s0 -m rpfilter --loose --invert -j DROP
> -t nat POSTROUTING                               (iptables only)
>   -o enp1s0 -j MASQUERADE
>   -o enp1s0 -m rpfilter --loose --invert -j DROP

In the case of ip6tables, the test would be in the common output path in 
the mangle table.  In the case of iptables, either the MASQUERADE target 
would stop processing of the chain, or the source test would come after 
the packet source address has been updated.  In either case, BCP38 would 
be effected for all outgoing packets.

RATIONALE:  Looking at the packet path diagrams I have found on the 
Internet, the only common tables for locally generated packets and 
forwarded packets are:
      mangle POSTROUTING
      nat    POSTROUTING

For IPv6, we aren't supposed to use NAT.  That's why the difference.

Now, if I could put the rule in the nat POSTROUTING table for both IPv4 
and IPv6, then the question becomes moot.

Yes, yes, yes, I know, I should be using nftables(8) so things like this 
would be easier to deal with.  Ubuntu programs still use iptables(8) at 
its foundation.  (UFW and OpenVPN are the two examples I know; there may 
be others.)


FUTURE ISSUE:

I have the problem of how to handle OpenVPN on IPv6.  Out of the box, 
OpenVPN (using the Ubuntu script) is IPv4 only.  The OpenVPN version 
2.4.7, as the script I used to install, has these rules added to the 
firewall:

> From /etc/systemd/system/openvpn-iptables.service:
> -t filter INPUT
>   -p tcp --dport 443 -j ACCEPT
> -t filter FORWARD
>   -s 10.8.0.0/24 -j ACCEPT
>   -m state --state RELATED,ESTABLISHED -j ACCEPT
> -t nat POSTROUTING
>   -s 10.8.0.0/24 -d 10.1.1.0/24 -o enp2s0 -j MASQUERADE
>   -t nat -A POSTROUTING -s 10.8.0.0/24 ! -d 10.8.0.0/24 -j SNAT --to 76.209.1.165

Of course, these are IPv4 rules only, nothing for IPv6.  That's a 
conundrum for a later time, though.
