From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: DHCP works but iptables should have dropped
Date: Sun, 14 Oct 2007 21:22:30 +0000 (UTC)
Message-ID: <slrnfh5249.8cf.petr.pisar@album.ics.muni.cz>
References: <E1IgS7N-0000Jz-Kg@www3.emo.freenet-rz.de>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2007-10-12, pockiman@freenet.de <pockiman@freenet.de> wrote:
>
> i have a debian (etch) server/firewall with dhcp-server and iptables
[...]
> -I've set the default policy of both ipv4 and ipv6 for all chains to
> DROP (debian server)
[...]
> if i boot the Laptop, there are 4 Packet registered to be dropped by
> the INPUT-default-policy, but the Laptop gets the ip-address.
> In the syslog of the server, there are entries from the dhcp-deamon
> for the request and the answers., but the OUTPUT - chain
> - Packet-Counter is already at 0.
>
> How are the packets (i thought it would be UDP) transmitted.
>
Use "netstat -lnp |grep dhcp". You can see that dhcpd has open 2 sockets.
One is UDP socket for reply packet transmission, the second one is raw
socket for request recieving.

The raw socket has one important attribute: it recieves packets before
netfilter. The same mechanism is used by tcpdump/libcap.

Therefore dhcpd can recieve packet even if they are blocked by
netfilter. This is feature, not a bug. I have not idea why ISC' DHCP
sever is implemented in this manner, but it is. (May be because of indirect
broadcast destination IP address in DISCOVERY client request.)

-- Petr


