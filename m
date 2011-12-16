From: Marius Nicolae <marius.e.nicolae@gmail.com>
Subject: Filtering pppoed frames
Date: Fri, 16 Dec 2011 18:53:59 +0200
Message-ID: <CAKEn5-J95Qu_Hx8bHk3F-Kde7BhGjg6W9hK=7p8CA5uOMujgRQ@mail.gmail.com>
References: <CAKEn5-LiE2Dv0zw_8JREHoyT1DHwQ17EirqGPsykU3GkX9XfvA@mail.gmail.com>
	<4EEA61F1.9020709@ukfsn.org>
	<CAKEn5-Kmc=OUcThwX8DeZGNzfQ-C6Zj-=siF0okA87Fb25=FxQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=gbwUe78fpxk5hBiTpjvQnU3v2YKLMmZvGvrOaiCtrQ4=;
        b=JQipJg69bnQaFz74xQYXzeBg6x8s+KyYuLS45M5cvpQS6wC+mXdVUdWqcBRS1G8eBw
         88xiue8MFhNCAYRi65aeWvx31YYVqkk4aMsS67ASayTeOWQOKiA9MFdbMzwDjIB1Uowo
         juxqAX8nIwgo2aV7ubtmaYJy/AVsL/BTT9iMc=
In-Reply-To: <CAKEn5-Kmc=OUcThwX8DeZGNzfQ-C6Zj-=siF0okA87Fb25=FxQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Sorry I was replying only to Andy and forgot the rule about unchanged
subject :(.


---------- Forwarded message ----------
From: Marius Nicolae <marius.e.nicolae@gmail.com>
Date: Fri, Dec 16, 2011 at 10:16 AM
Subject: Re: Filtering pppoed frames
To: Andy Furniss <andyqos@ukfsn.org>


Hi Andy,

Thanks for your response.

On Thu, Dec 15, 2011 at 11:09 PM, Andy Furniss <andyqos@ukfsn.org> wrote:
> Marius Nicolae wrote:
>>
>> Hi,
>>
>> Im not sure if this is the right list but here we go. In our small ISP
...
>> Before doing that:
>> 1. Is there a better and easier way of matching pppoed frames and
>> limit them in the way just described?
>> 2. If not, do you know an open source project on which I might involve
>> and contribute with such functionality?
>
>
> I don't know pppoe so am not sure it will help in this case, but you can
> match/drop/limit non ip with tc and a policer - though it's not going to be
> as sophisticated as you describe doing with iptables.
While contemplating the ebtables packet flow picture from here
http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png I was first
considering using ebtables for matching the frames but since the
server has no bridge the packets they where not hitting any ebtables
table. I was assuming the frames where traversing network stack
without any interest from ebtables or then iptables. Probably ebtables
sees the frame is coming from a interface which is not part of any
bridge and iptables sees isn't an IP frame; I don't know. Also from
that picture, since it's hit first, I was thinking to match or mark
them within tc ingress phase but again I saw no way of filtering or
sending them to userland for further investigations but simply
policing such frames I think is a no go.

>
> If it's possible to identify a naughty frame just from the macs and or
> contents of the frame alone, then dropping them should be quite easy.
>
> If you can't identify from the frame alone and need state from the pppoe
> server or some statistics then it's going to be trickier.
Yes, is possible to identify the frames alone from macs and ethernet
protocol only, in a stateless manner, but it must be rejected only the
"noisy" macs. As a very simplistic description the pppoed protocol is
used to create and terminate pppoe sessions (frames with 0x8864
ethernet protocol) which encapsulates IP frames by signing and even
encrypting them. Thus is very important to let the good and legitimate
macs to send/receive such frames in order to create/terminate pppoe
sessions.

>
>

--
Best regards,
Marius Nicolae
