From: "J. Webster" <webster_jack@hotmail.com>
Subject: RE: iptables not forwarding port 443
Date: Tue, 6 Jul 2010 18:10:07 +0100
Message-ID: <BAY145-w1402AA6231A6B64AC93F23F3B20@phx.gbl>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C336248.8060700@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C336248.8060700@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: swifty@freemail.hu
Cc: netfilter@vger.kernel.org


Hi
It is a TCP connection.
I could set up the server on port 443 but there are existing clients with 1194 configurations so I had hoped instead to only use 443 when necessary and avoid resending out new client configurations. 
OpenVPN can only listne on 1 port.

----------------------------------------
> Date: Tue, 6 Jul 2010 19:05:12 +0200
> From: swifty@freemail.hu
> To: webster_jack@hotmail.com
> CC: netfilter@vger.kernel.org
> Subject: Re: iptables not forwarding port 443
>
> Just a few questions:
> Why do you redirect the incoming packets?
> Why do not you set up the VPN server to accept connections on port 443?
> Is it UDP or TCP the protocol you are using with VPN?
>
> Swifty
>
 		 	   		  
_________________________________________________________________
http://clk.atdmt.com/UKM/go/195013117/direct/01/
