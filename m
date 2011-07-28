From: Michal Soltys <soltys@ziu.info>
Subject: Re: iptables and virtual NIC
Date: Thu, 28 Jul 2011 17:04:42 +0200
Message-ID: <4E317A8A.4000508@ziu.info>
References: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <65C6A498BB5BF245BD7195255041FA2E04C751C4A5@bn-scl-be03.Cudanet.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kumar Swamy <kswamy@barracuda.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 11-07-28 12:05, Kumar Swamy wrote:
> Hello folks,
>
> I am a newbie to iptables and experimenting some stuff.  So please excuse me, if this has already been discussed.
>
> I have a linux gateway which has a physical interface (eth0 ) and multiple virtual interfaces ( eth0:1, eth0:2), each has dynamic IP configured.
> I want to create an iptables rule for  IP masquerading on eth0 , but packets going out on other interfaces should be left untouched. Is this possible?
>
> I tried
> -A POSTROUTING -o eth0 -j MASQUERADE
> But it seems packet going out on virtual NICs ( aliases) are also hitting this rule.
> Is there any way to solve this problem without using SNAT? Since I have IP address configured dynamically, there is no easy way to do SNAT.
>
> Thanks

In addition to what Jan said about eth:N

MASQUERADE target picks only a primary addresses with global scope. Make 
sure during address assignment (you can adjust what dhclient or dhcpcd 
does with shell scripting) that only one of the addresses have global 
scope (and it's the primary address).
