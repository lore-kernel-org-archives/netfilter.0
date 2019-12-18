From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: trying to duplicate udp packets destined for port 67 to port
 6767 on same host
Date: Wed, 18 Dec 2019 17:04:02 +1100
Message-ID: <20191218060402.GA11444@dimstar.local.net>
References: <ba39eeef-6fa0-10de-e45d-8b121f1c37e5@mdabbs.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ba39eeef-6fa0-10de-e45d-8b121f1c37e5@mdabbs.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike <mike@mdabbs.org>
Cc: Netfilter <netfilter@vger.kernel.org>, Netfilter Development <netfilter-devel@vger.kernel.org>

Hi Mike,

On Mon, Dec 09, 2019 at 09:22:30PM -0600, Mike wrote:
> I have a DHCP server on a host but also want to run openHAB which has the
> ability to listen on port 6767 for DHCP requests. The docs say to execute
> the following commands to replicate the packets on to port 6767:
>
> iptables -A PREROUTING -t mangle -p udp ! -s 127.0.0.1 --dport 67 -j TEE
> --gateway 127.0.0.1
> iptables -A OUTPUT -t nat -p udp -s 127.0.0.1/32 --dport 67 -j DNAT --to
> 127.0.0.1:6767
>
> When I do this though, I see the mangle rule packet count start to skyrocket
> and the nat rule never sees any packets. When I try a slight variation
> below, I prevent the skyrocketing packet count but the nat rule still never
> kicks in.
>
> iptables -A PREROUTING -t mangle -p udp ! -i lo --dport 67 -j TEE --gateway
> 127.0.0.1
>
> I have tried various combinations of ip_forward and route_localnet
>
>
> I hope this is the right mailing list and someone could offer some help. I
> can provide nf trace logs if needed, or any other kind of info.
>
> Thanks,
>
> Mike
>
You should be able to achieve this using the NFQUEUE target. Your nfq
application opens a udp socket to port 6767 and duplicates incoming packets to
port DHCP to this socket, using regular sendto() calls. Then it accepts the
packet, so DHCP gets to see it.

Cheers ... Duncan.
