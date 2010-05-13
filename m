From: Mistick Levi <gmistick@gmail.com>
Subject: Re: iptables NEW or SYN
Date: Thu, 13 May 2010 22:23:23 +0300
Message-ID: <AANLkTilx7Gimy8RwVszEx1ijkR4mx2Q70HKJO72fAhTK@mail.gmail.com>
References: <hshbmv$547$1@dough.gmane.org>
	 <alpine.LSU.2.01.1005131916320.9398@obet.zrqbmnf.qr>
	 <hshf0k$ine$1@dough.gmane.org>
	 <AANLkTimpGd4uEnY5UiFQDs1oE6uEji6lbLnUej7eCXoX@mail.gmail.com>
	 <hshhcg$rl3$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9pYEBTphcTSHvjdrTr2f/sVEhZE4nb4e1PoVrApDMo0=;
        b=MbZsXfYJ/uSto9WT4f5OFfCEkok36llQ2RiYqdd0zpy+VPetFXPo9cAKPF5W2N2f2/
         28F3wg72ZFmmUcs42eX7DMyIptdjwQilWntQH1IMEUYKPUxc3jiPnJK4e/EoYGnf/t+g
         dB1SNBHjK0qFQZQBMR23wpHNuQnd8iLjTANRs=
In-Reply-To: <hshhcg$rl3$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Markus Feldmann <feldmann_markus@gmx.de>
Cc: netfilter@vger.kernel.org

NEW is a packet which the firewall did not see before( Yes , meeting a
new person today)
ESTABLISHED - Is a connection that already exists ( an open session:
Meeting a girl in the way to the store ( NEW ) then meeting her in our
way back from the store ( ESTABLISHED - we are already familiar ).

SYN is a part of TCP (
http://en.wikipedia.org/wiki/Transmission_Control_Protocol- this could
help understand better ).
the 3-way handshake is done: "SYN" -> "SYN ACK" -> "ACK"
The reply of SYN-ACK Transfer the state to ESTABLISHED.

Kind regards
Levi Yechiel

On Thu, May 13, 2010 at 9:45 PM, Markus Feldmann <feldmann_markus@gmx.d=
e> wrote:
> Curby schrieb:
>>
>> On Thu, May 13, 2010 at 12:05 PM, Markus Feldmann
>> <feldmann_markus@gmx.de> wrote:
>>>
>>> What are CTs?
>>
>> Mebbe Conntrack? =A0The basic point that Jan's trying to make is tha=
t
>> NEW/ESTABLISHED/INVALID/RELATED describes packets as they're seen by
>> the connection tracking. =A0It is not necessarily related to whether=
 a
>> TCP packet has the SYN flag set.
>>
>> If a new and valid ICMP ping packet comes in, it's considered NEW by
>> conntrack because it's not associated with any other traffic, not is
>> it INVALID. =A0That's an example of NEW packets that don't have to b=
e
>> TCP SYN.
>
> I try an example and you say whether i am right.
>
> If i meet a girl, which i doesnt meet before, than she is NEW.
> When i meet a girl every day which, than she is only new at the first=
 meet
> but the meeting is every day a new experience (syn).
>
> Is that correct?
>
> So the state NEW is the sight view of my computer and the syn only me=
ans,
> there is a foreign computer which wants to establish a new connection=
=2E
>
> Ist that right?
>
> If that is right than i need the --syn argument not the state NEW for=
 my
> apache-server.
>
> regards Markus
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
