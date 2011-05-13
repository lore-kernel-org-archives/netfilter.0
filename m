From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Timestamping in nfqueue
Date: Fri, 13 May 2011 21:06:10 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105132105340.29990@obet.zrqbmnf.qr>
References: <1305297156.9902.41.camel@compot-mob>  <1305297833.2013.16.camel@tiger.regit.org> <1305308056.11480.1.camel@hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305308056.11480.1.camel@hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

On Friday 2011-05-13 19:34, Nikolay S. wrote:

>=D0=92 =D0=9F=D1=82=D0=BD, 13/05/2011 =D0=B2 16:43 +0200, Eric Leblond=
 =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hello,
>>=20
>> On Fri, 2011-05-13 at 18:32 +0400, nowhere wrote:
>> > Hello,
>> >=20
>> > What is the purpose of nfq_get_timestamp() in libnfnetlink_queue i=
f
>> > skbs, entering nfnetlink_queue, are not timestamped?
>>=20
>> If I remember correctly, skb are timestamped when catch in the FORWA=
RD
>> chain. This is not the case in some other chains.
>
>Thanks for the tip. Looks like timestamping happens for forwarded fram=
es
>only.

I guess you can force timestamping by feeding the packet(s) through=20
-m time in the ruleset. Doing so would be a hack, though probably a=20
working one :)

