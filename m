From: Arif Hossain <aftnix@gmail.com>
Subject: Re: concatenate udp payloads of multiple packet
Date: Fri, 20 Apr 2012 17:43:19 +0600
Message-ID: <CAGuaRCv927U1=XoucxxSnRk44q76F7ayLAkQRc9BMpohF8Yv8g@mail.gmail.com>
References: <CAGuaRCt0Jmj4_prCZVvXi2oijOTprTqUntphjx_9cQqk-nqhCQ@mail.gmail.com>
	<4F90555B.7070306@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=w1wluz3PaVMo7Lk5EqBHFMHDjelQILGfzX8QafTOfs8=;
        b=Ttgt2KaPnmBMHfZ7PoXpAUFWf9xFQUFWfahOmIhQtY6CKjb+sGMyrFe4L7tyaBAW0w
         VA0pp/lu5NL4SMsrG+RYFK20UBnTM5WInC6bRel+7VNks6+vKOxOzkv5B/tgXXGvn7AO
         EUcGrTa8L+v5sgba+f8tFWgC8o8KbutMEp5pQo4n0UKwqRl1K34QFbLRulmM4BhYRvSQ
         hg5dePhcA29BSo4xkezURMxDy/xgU9CpblQ7g9hXF0JWmMqDhg1q+o+/NVYe/Xf899Zf
         Egj+SZMWpXtF9BiYLy5KSwU7zYKHd8vhcGEa7v4SVShdHwCewcODs94lL0m4bFjOjXkZ
         URXQ==
In-Reply-To: <4F90555B.7070306@hp.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rick Jones <rick.jones2@hp.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

> It isn't clear you can. =A0An application using UDP is expecting mess=
age
> boundaries to be preserved. =A0That is a fundamental part of the sema=
ntics of
> UDP. =A0So if an application has sent three, 128 byte messages via UD=
P, the
> receiving side is expecting to receive three, 128 byte messages, not =
one 384
> byte message. =A0If the receiver can indeed deal with just one, 384 b=
yte
> message, that is what the sending side should have sent in the first =
place.
>

Ok i'm explaining it a bit more so no confusion about what i'm trying
to achieve.

In our application, we are send
RTP(http://en.wikipedia.org/wiki/Real-time_Transport_Protocol)
packets. These RTP packets have encoded voice data as their payload.
When a voice communication
occurs its quiet bandwidth consuming. Thousands of udp packets are
transmitted in a matter of seconds.
So when a client is in low bandwidth area, its more logical to send
large udp packts with multiple rtp packets
concatenated.

Take for instance G729 codec has a 10ms frame. which is encoded as 10
bytes of voice data. every rtp packets has
12 bytes of header. its totally wasteful of bandwidth that to send
only 10 bytes of voice data as a payload of 12 bytes of header.
If 5 RTP frames are concatenated then we are transmitting 50 bytes
with a single 12 byte header. then payload to header ratio
is 50/12 which far less than 10/12. The more bigger packet we send the
more this ratio increase and so our bandwidth
consumption reduced. But there is also a trade off. the more frames we
send in packet the quality of voice decreases slightly.

After some testing we have come to conclusion that sending 10 packets
in a single udp datagram is a optimum choice.

We use our existing netfilter_queue app to encryption/obfuscation of
voice data to escape certain firewall and telecom operators
malpractices. For improving our service we have decided that we will
increase our payload size.

Problem is different SIP servers vary in their capability of repack
RTP packets.  some can do a lot but other's do not. we do not want to
select a
telephony  server based on this property because lot of other
variables are involved in the selection process. And for different
services we use several
Telephony platform.

So we want our application to be capable of repack rtp packets so that
we can use whatever telephony platforms we want without thinking about
this.
This way our service implementation will be more robust and will not
create unnecessary dependencies.

Thank you for your reply



--=20
-aft
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
