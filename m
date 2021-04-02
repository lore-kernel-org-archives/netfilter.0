From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: nft show counter
Date: Fri, 02 Apr 2021 19:42:19 +0200
Message-ID: <3A06821B-F0D1-4925-9E89-25C279EDA979@public-files.de>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62> <20210331214053.GB13699@breakpoint.cc> <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com> <trinity-e144cb32-0c89-44a6-b0f6-5b9edcf5e457-1617264512699@3c-app-gmx-bap06> <20210401164247.ng3na2sbvrsqzcti@nisshoku.fritz.box> <7fe793ae-1474-883e-1f75-4746ee7a9070@fhmtech.com>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617385345;
        bh=mJ2t9qqWDhxTm73ul3toAlD9g8jWJ6sw5MGvFFri1wI=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=SPZwuJH8rBmPl9nyeIlaefK/NluTd6FYLACcN1sTM4m9LuQNLQvqzeOzrgdXP2GEQ
         u18kgrGoytD7iW09RN7XdfjhK61ewrxAoYCbqPoG1un+mprBtHVeQ2w1SceErmN7QZ
         QvP59FLMq8hwAmCqtog9ka+dpX9jcrYKqqd0K65k=
In-Reply-To: <7fe793ae-1474-883e-1f75-4746ee7a9070@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Frank Myhr <fmyhr@fhmtech.com>, netfilter@vger.kernel.org
Cc: rieger@jikken.de

Am 2=2E April 2021 19:16:50 MESZ schrieb Frank Myhr <fmyhr@fhmtech=2Ecom>:
>On 2021/04/01 12:42, Anton Rieger wrote:
>> On Thu, Apr 01, 2021 at 10:08:32AM +0200, Frank Wunderlich wrote:
>>> made a little python-script (not yet with error-handling) to read
>out=20
>>> the bytes:
>>>
>>> import os
>>> import json
>>>
>>>
>>> def getCounter(countername):
>>> =C2=A0=C2=A0 stream =3D os=2Epopen('nft list counter filter '+countern=
ame+' -j')
>>> =C2=A0=C2=A0 output =3D stream=2Eread()
>>> =C2=A0=C2=A0 #print(output)
>>> =C2=A0=C2=A0 j=3Djson=2Eloads(output)
>>> =C2=A0=C2=A0 return j["nftables"][0]["counter"]["bytes"]
>>>
>>> print(getCounter("voip1"),"bytes")
>>> print(getCounter("voip2"),"bytes")

>
>Nice!
>Anton & Frank W=2E, is it OK with you if I include your examples in the=
=20
>nftables wiki?

My part is ok to include in wiki=2E=2E=2Ei have posted to share :) maybe i=
n combination with the rules (old version commented out and with map) to ha=
ve full example

define ipvoipbox=3D192=2E168=2E0=2E8

table ip filter {
     map voipcounters {
         type inet_service : counter
         elements =3D { 5160 : "voip1", 5161 : "voip2" }
     }
    chain FORWARD {
         #ip saddr $ipvoipbox udp dport 5160 counter name voip1 comment "c=
ounting packets for SIP1"
         #ip daddr $ipvoipbox udp dport 5160 counter name voip1 comment "c=
ounting packets for SIP1"
         #ip saddr $ipvoipbox udp sport 5161 counter name voip2 comment "c=
ounting packets for SIP2"
         #ip daddr $ipvoipbox udp dport 5161 counter name voip2 comment "c=
ounting packets for SIP2"
         ip saddr $ipvoipbox counter name udp sport map @voipcounters
         ip daddr $ipvoipbox counter name udp dport map @voipcounters
     }
    counter voip1 {
     }
     counter voip2 {
     }
 }

regards Frank
