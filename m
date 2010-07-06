From: "J. Webster" <webster_jack@hotmail.com>
Subject: RE: iptables not forwarding port 443
Date: Tue, 6 Jul 2010 18:40:42 +0100
Message-ID: <BAY145-w19572F836A9A64C0737FC2F3B20@phx.gbl>
References: <BAY145-w560F4D16A39DD1B39B1A1FF3B20@phx.gbl>,<4C336248.8060700@freemail.hu>
 <BAY145-w1402AA6231A6B64AC93F23F3B20@phx.gbl>,<4C336757.5080100@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C336757.5080100@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: swifty@freemail.hu
Cc: netfilter@vger.kernel.org


Hi
Thanks.
No, there is no proxy in the middle in this testing case, I believe that's why the packets are received at port 443 on the server but then somehow dropped.
Is there anything wrong with the iptables rules that might stop this?

> It is a bit dangerous to use 443/tcp for vpn...
It was recommended by the OpenVPN users list.

> But you can
 set up 2 services on the same host...
Yes, I could but that makes an administration problem to do with status logs and other stuff I think.



----------------------------------------
> Date: Tue, 6 Jul 2010 19:26:47 +0200
> From: swifty@freemail.hu
> To: webster_jack@hotmail.com
> CC: netfilter@vger.kernel.org
> Subject: Re: iptables not forwarding port 443
>
> Hi,
>> Hi
>> It is a TCP connection.
>>
> I prefer UDP... :D
> It is usually not filtered...
> Maybe your problem is that a "proxy-in-the-middle" tries to set up an
> https connection...
> Or just simply drops the "unknown"/"not-https" packets...
> It is a bit dangerous to use 443/tcp for vpn...
>> I could set up the server on port 443 but there are existing clients with 1194 configurations so I had hoped instead to only use 443 when necessary and avoid resending out new client configurations.
>> OpenVPN can only listne on 1 port.
>>
> But you can set up 2 services on the same host...
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
 		 	   		  
_________________________________________________________________
http://clk.atdmt.com/UKM/go/197222280/direct/01/
Do you have a story that started on Hotmail? Tell us now