From: Olivier Sessink <lists@olivier.pk.wau.nl>
Subject: Re: conntrack INVALID packets
Date: Thu, 08 Nov 2007 08:47:37 +0100
Message-ID: <4732BF19.1090607@olivier.pk.wau.nl>
References: <000401c81bd0$c0080e00$40182a00$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000401c81bd0$c0080e00$40182a00$@net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roman Ledovskiy <roman@usonyx.net>
Cc: netfilter@vger.kernel.org

Roman Ledovskiy wrote:
> Hi,
> 
> I have linux firewall in between internet and my network, diagram is
> following:
> 
> Upstream
>    |
> Firewall server
>    |
> my network
> 
> "My network" hosts many different email/web servers.
> 
> Firewall server is not a bridge, it has 2 interfaces (one to upstream, one
> to internal network)
> Not much kernel configuration, kernel is default kernel from Centos5 x64
> repo: 2.6.18-8.1.10.el5
> 
> On this server I get quite a lot of INVALID packets, about 0.07% of all and
> I can't figure out why..

same thing here. most of the INVALID packets seem to have RST or FIN ACK
set. So what I did, I increased the timeouts to setup a connection, and
I increased the timeouts for connection closing. That helped a lot.

echo "240" >
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close_wait
echo "60" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_close
echo "240" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_fin_wait
echo "60" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_last_ack

regards,
	Olivier
