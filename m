From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrack is bad during DDoS?
Date: Thu, 04 Oct 2007 11:22:52 +0200
Message-ID: <4704B0EC.2030802@trash.net>
References: <4702BDCB.3060102@andrei.myip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4702BDCB.3060102@andrei.myip.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Florin Andrei wrote:
> [...]
> I am testing the firewall with pktgen, running on another machine. It's
> pretty much a DDoS test, random source IP, random source UDP port, small
> packets.
> 
> 
> While pktgen is blasting the firewall, I am downloading a 2GB file
> through the firewall in an infinite loop.
> 
> The problem: pretty soon after starting pktgen, the HTTP download stops.
>  It appears to happen only when using random source IP addresses for the
> DoS. If all UDP packets have the same source IP, the firewall works fine.


Please try 2.6.23 once its out (or the current -rc), it should behave
better.

> I suspect it might be related to conntrack. Is there a way to disable
> that module while still having that set of rules loaded up?
> 
> I don't need stateful filtering, all I need to do is:
> - 1:1 NAT for each server behind the firewall (each server gets its own
> public IP on the outside interface of the firewall)


2.6.24 will include stateless NAT again for 1:1 mappings.


