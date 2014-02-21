From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: checksum issue with xtables-addons RAWNAT
Date: Fri, 21 Feb 2014 10:51:37 +0100
Message-ID: <530721A9.9030901@chello.at>
References: <C64F36CD7E08D64DBEF606F50981DC8E0CCE2F3B58@SERVER02.circadence.local>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C64F36CD7E08D64DBEF606F50981DC8E0CCE2F3B58@SERVER02.circadence.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Randy Thornton <randy@circadence.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 06.02.2014 17:31, Randy Thornton wrote:
>
> I'm trying to use RAWSNAT and RAWDNAT commands to route traffic through a proxy.  It works correctly for IPV4 traffic, but fails on IPV6 traffic.  The IP addresses are modified correctly, but the IP checksum is incorrect and the destination refuses the packets.
>
> Command that redirects the outgoing packets:
> ip6tables -t raw -A OUTPUT  -p tcp -d fd00:192:168:200::100 --dport 80  -j RAWDNAT --to-destination fd00:172:168:0::11
>
> I'm running xtables-addons-1.47.1 on Centos 6 with the latest kernel 2.6.32-431.3.1.el6.x86_64.
>
> Has anyone used these commands successfully with IPV6 connections?
> Has this been fixed in a later release of xtables-addons?  If so, can anyone point me to the fix?

Afaik, RAW[DS]NAT has been removed from latest xta.

Best regards
Mart

