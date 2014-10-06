From: =?iso-8859-1?Q?Andr=E9_Paulsberg?= <Andre.Paulsberg@evry.com>
Subject: RE: Basic routing
Date: Mon, 6 Oct 2014 09:41:43 +0000
Message-ID: <838AB161BE491743AE3CA3A916CF1CC63AAB6EE3@ccdex004>
References: <m0nhf2$oqq$1@ger.gmane.org>
 <201410032134.59160.neal.p.murphy@alum.wpi.edu> <m0nncm$t77$1@ger.gmane.org>
 <542F9BEE.9070802@kickstone.com> <m0okc1$g5m$1@ger.gmane.org>
 <542FFCA2.3010208@bringe.com> <m0p2g0$clr$1@ger.gmane.org>
 <m0pbme$ifl$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m0pbme$ifl$1@ger.gmane.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Smithee <for-gmane@mutluit.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

: If someone knows a simpler solution pls let me know, thx.

SHORT answer , I think you forgot return routing !
I am not sure what you are doing here , but I am sure from your last po=
st you are "doin' it wrong" .
If I understand your solution , you have now "eliminated the need" for =
routing by using NAT !

Since I cannot see your complete setup I will explain some BASIC "issue=
s" you might encounter .
( And I believe this might be your issue for this case too )=20


NET A  --- A side GW-X (ROUTER) B side GW-X --- NET B  --- B side GW-Y =
(ROUTER) C side GW-Y  --- Internet/or further networks
SWITCH                                          SWITCH =20
  |                                               |
PC-A1                                           PC-B1
PC-A2                                           PC-B2


To start on the solution , the first thing we focus on is ROUTING is al=
ways 2 ways .
In any setup like above , making a route from GW-X is useless ,
unless all units "after" GW-X know a route back to side A for the NET A=
 .

When GW's already have routing enabled , they normally only have 1 rout=
e entry added .
This is default GW going towards outside world , additionally they also=
 have automatic
"routing" for all local interfaces .
When you have this traffic will only go from "left to right" , meaning =
when you send packets from
A to B , the B will send any reply out to C , because it will follow de=
fault route going "right" .
MINIMUM to solve this is to make a route for NET A on GW-Y to GW-X .

Now A will send to B and B return packets to A through GW-Y router ,
this is somewhat suboptimal since only unit on NET B with route to A IS=
 GW-Y .
( meaning all traffic to NET A must initially go through GW-Y , making =
an extra HOP for PC's in NET B )
Next step is to solve this by either adding a route for all units , her=
e seen as PC-B1 and PC-B2 ,
So that they send traffic directly to GW-X for NET-A and have default r=
oute to GW-Y .
( This can also be done via routing protocols like RIP , OSPF or IS-IS =
, but for home use you will likely add one more route )

Your next issue will be fix RFC1918 ( private address space ) when goin=
g to Internet ( or any other outside network )
This is usually fixed by adding NAT for all networks to the address of =
GW-Y's IP on NET C when leaving GW-Y towards outside .
This must include in this examples NET A and NET B , if not no one on t=
he outside will be able to return packets=20
( this also means that GW-Y IP on NET C needs to be public and also rou=
ted , which is normaly the responsibility of your ISP )


Hope this explains how to start your setup from scratch again , if not =
please ask if you need more info .


Best regards
Andr=E9 Paulsberg
Senior Network Engineer=20
Core Network
Operation, Network, Nordic Operations
andre.paulsberg@evry.com
M +47 9070 5988

