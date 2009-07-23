From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: MASQUERADE MAIL SERVER
Date: Thu, 23 Jul 2009 20:29:05 +0200
Message-ID: <4A68ABF1.5030908@unipex.it>
References: <4A6897BD.8000805@ideay.net.ni>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A6897BD.8000805@ideay.net.ni>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Wilbert J. Rojas O." <sysadmin@ideay.net.ni>
Cc: netfilter@vger.kernel.org

Wilbert J. Rojas O. wrote:
>  Hello,
> 
> My Network configuration is that:
> 
> 
> ISP
> |
> |
> |
> |  *eth0 200.9.190.20* *eth0:1* 200.9.190.21 *eth0:2* 200.9.190.23 
> *eth0:3* 200.9.190.24 *eth0:4* 200.9.190.25
> LINUX BOX


why this on not only a unque network card with more than one address and 
not more than one alias?

for i in 21 22 23 24 25 ; do
   ip addr add 200.9.190.$i/? dev eth0
done

> |  *eth1 10.24.54.1/32*
> |
> |
> LAN  10.24.54.0/24  gw 10.24.54.1
> |
> |
> MAIL SERVER 10.54.24.96/32  gw 10.24.54.1
> 

you cannot have 10.54.24.96/32. this is an host-only network!

Before start, show us an "ip route sh" and "ip addr sh" of the linuxbox.
