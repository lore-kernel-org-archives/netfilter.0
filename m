From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: iptables not forwarding port 443
Date: Tue, 06 Jul 2010 19:26:47 +0200
Message-ID: <4C336757.5080100@freemail.hu>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C336248.8060700@freemail.hu> <BAY145-w1402AA6231A6B64AC93F23F3B20@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY145-w1402AA6231A6B64AC93F23F3B20@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Webster" <webster_jack@hotmail.com>
Cc: netfilter@vger.kernel.org

Hi,
> Hi
> It is a TCP connection.
>    
I prefer UDP... :D
It is usually not filtered...
Maybe your problem is that a "proxy-in-the-middle" tries to set up an 
https connection...
Or just simply drops the "unknown"/"not-https" packets...
It is a bit dangerous to use 443/tcp for vpn...
> I could set up the server on port 443 but there are existing clients with 1194 configurations so I had hoped instead to only use 443 when necessary and avoid resending out new client configurations.
> OpenVPN can only listne on 1 port.
>    
But you can set up 2 services on the same host...
