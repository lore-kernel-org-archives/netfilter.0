From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: VoIP conntrack issue
Date: Wed, 14 Nov 2012 16:54:19 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211141648280.17446@nerf07.vanv.qr>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com> <alpine.LNX.2.01.1211140225280.4653@nerf07.vanv.qr>
 <CABY2qi8BmP4t1=4gj4iW1niTJWNagTbeVu=C+t6S2WvfyRttBg@mail.gmail.com> <alpine.LNX.2.01.1211141055040.4653@nerf07.vanv.qr> <50A3BB0A.9070301@ngtech.co.il>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50A3BB0A.9070301@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>, netfilter <netfilter@vger.kernel.org>

On Wednesday 2012-11-14 16:38, Eliezer Croitoru wrote:

>Or instead just use DNAT with specific ports that will allow any other 
>traffic from this host to others based on basic NAT what called 
>"port-forwarding"

Port forwarding is a terrible misnomer, because the port itself is an 
entity belonging to the host, and as such static. NA(P)T, or "port 
mapping" if you have to, is just fine and catches the spirit properly. 
If you need a car analogy, you can't move the piers/ports either, only 
the ships.

That said, DNAT is exactly what I gave as one way of resolution. From 
there, one can use --dport(s) as needed, but then that's not a full 1:1 
NAT anymore.
(I get the feeling my mail was ignored, perhaps you should go through 
the text and bottom post like everybody else.)

>>  iptables -t nat -A PREROUTING -i internet [-d 114.XX.234.123] \
>>           -j DNAT --to 192.168.1.38
