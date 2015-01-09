From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Stateless NAT with iptables
Date: Sat, 10 Jan 2015 00:54:16 +0100 (CET)
Message-ID: <alpine.LSU.2.11.1501100027160.13352@nerf60.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glen Miner <shaggie76@hotmail.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>, Kristian Evensen <kristian.evensen@gmail.com>


> What we're trying to do is set up UDP NAT proxy for a pair of
> clients on demand. The mappings are preceded by some application
> layer traffic used to figure out where the mapping should go --
> we're essentially trying to use the netfilter stack to do a blazing
> fast STUN/TURN server with no packet overhead.
>
> In my prototype this works but there's a problem: nf_conntrac gets
> in the way of the hand-off between the application layer socket and
> the NAT rule. I've tried telling iptables to go stateless: 
> iptables -t raw -F
> iptables -t raw -I PREROUTING -j NOTRACK
> iptables -t raw -I OUTPUT -j NOTRACK

Rules are rather static, but your described scenario requires
rather dynamic changes. There is a much more targeted solution:

Once your application decides it is time to switch, it needs to
change the conntrack entry for the UDP session. conntrack(8)
can be used, and there is also a C interface with
libnetfilter_conntrack.

(With the conntrack command line utility, updating certain parameters is 
not possible because of the program's way of option parsing. This 
limitation may be gone in the C interface. With the command-line 
utility, one could however recreate the entry, if the lack of atomicity 
between the operations is bearable.)

conntrack -D -p udp \
	--src client_addr --dst stun_addr \
	--sport client_port --dport stun_port
conntrack -I -p udp \
	--src client_addr --dst stun_addr \
	--sport client_port --dport stun_port \
	--reply-src real_server_addr --reply-dst client_addr \
	--reply-src-port real_server_port \
	--reply-dst-port client_port

At least, that is the general idea.. whether it works, or if it needs
additional commands, I have not tried.
