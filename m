From: Jeff <Jeff.Meyers@gmx.net>
Subject: Re: Accept clients that were seen at least twice only
Date: Wed, 26 Aug 2015 14:51:50 +0200
Message-ID: <55DDB666.60709@gmx.net>
References: <55DDAF52.3090507@gmx.net>
 <838AB161BE491743AE3CA3A916CF1CC648C8D8E2@CCDEX015.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <838AB161BE491743AE3CA3A916CF1CC648C8D8E2@CCDEX015.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Andr=c3=a9_Paulsberg-Csibi?= <Andre.Paulsberg-Csibi@evry.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Could be 2x SYN or 2x UDP or 2x ICMP. Any of that kind shall allow the=20
2nd packet to pass since I can - at least for now - assume, that this i=
s=20
not a random flood with spoofed IPs. Of course only within a certain=20
time frame like 10-30 seconds and not infinite.


Best,
Jeff

Am 26.08.2015 um 14:46 schrieb Andr=C3=A9 Paulsberg-Csibi:
> One short question , do you mean clients that send you 2 or more SYN =
packets in the same session ?
>
> Or just send ANY 2 packets in the same "session" , or even "worse" 2 =
times whatever the packet type ?
>
>
> Best regards
> Andr=C3=A9 Paulsberg-Csibi
> Senior Network Engineer
> Fault Handling
> EVRY Nordic Operations AS
> andre.paulsberg-csibi@evry.com
> M +47 9070 5988
>
>
>
>
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.ke=
rnel.org] On Behalf Of Jeff
> Sent: 26. august 2015 14:22
> To: netfilter@vger.kernel.org
> Subject: Accept clients that were seen at least twice only
>
> Hello everybody,
>
> I am looking for a way to accept traffic from clients only if they we=
re
> seen at least twice. This shall be part of a firewall concept which
> protects the target from random floods where source IPs are usually o=
nly
> seen once since they are random.
> I cannot use the --state ESTABLISHED here because this requires a
> complete handshake (for TCP). I'm okay with the first packet not
> matching this rule as long as the 2nd one does. I'm looking forward t=
o
> reading your ideas!
>
>
> Best,
> Jeff
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

