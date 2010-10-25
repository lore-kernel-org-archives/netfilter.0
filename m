From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Blocking machines by both Mac Address and IP address
Date: Mon, 25 Oct 2010 11:02:59 -0500
Message-ID: <4CC5AA33.7010400@riverviewtech.net>
References: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimE3DpKibaqKH53D9PEtt_AxSAimdaTiyTy1VZK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/23/10 17:19, Scott Mayo wrote:
> i.e.  If MAC address 00:11:22:33:44:55 is given IP address 
> 192.168.0.1 by DHCP then that should be the only combo that can get 
> to the outside world.  If the IP address is changed to something else 
> or if another machine that has a different MAC address is given the 
> IP address 192.168.0.1 statically, then in neither situation should 
> the machine be able to get out to the world.

I would suggest that you reverse your logic a bit.  Only allow the 
machines to access the internet if the MAC and IP address are correct. 
Any other combination should fail.

This is the old adage of "allow what you want and block the rest" not 
"block what you want and allow the rest".  It is too easy to change an 
IP and / or MAC address to get around the filters that selectively block.



Grant. . . .
