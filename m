From: Eric Leblond <eric@regit.org>
Subject: Re: NFQNL_COPY_META not working?
Date: Wed, 26 Oct 2011 15:00:21 +0200
Message-ID: <dec0d22e-3d9b-4ab4-8d80-56bb09382971@email.android.com>
References: <76B3922156AB24469E781F6224C2239F0151D1@ly-ex-02.thrane.tt.ad>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76B3922156AB24469E781F6224C2239F0151D1@ly-ex-02.thrane.tt.ad>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-1?Q?Andreas_Birkj=E6r_=28ABI=29?= <abi@thrane.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello


"Andreas Birkj=C3=A6r (ABI)" <abi@thrane.com> a =C3=A9crit=C2=A0:

>Hello.
>
>I have been trying to get the the netfilter queue working, everything
>is seemingly allright as long as I pass the entire packet to userspace=
=2E
>(nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xfffff)).
>It should be noted that I am testing this on the nfqnl_test.c which is
>found here:
>http://svn.netfilter.org/netfilter/trunk/libnetfilter_queue/utils/nfqn=
l_test.c

Copy Meta will not send the payload to userspace. If you want a partial=
 transfer of payload use copy packet and put the size as second paramet=
er of nfq-set-mode.

BR

>
>As long as I copy the entire packet to userspace, everything seems to
>be running smoothly, I can retrieve whatever I want from the packet.
>
>However, I do not want to pass the entire packet to userspace - I just
>need to check/modify the IP and/or TCP header and then pass the packet
>along. When I try to use the NFQNL_COPY_META mode, then the program
>fails. (I am testing this on the beforementioned nfqnl_test.c file wit=
h
>no modifications beside the META mode.
>
>Apparently the nfq_get_payload() function always returns -1.
>
>I have tried searching for an answer, but almost everywhere I look,
>people are happy passing the entire packet, does the nfqnl_test.c need
>additional modifications in order to run in NFQNL_COPY_META mode or
>what?
>When using NFQNL_COPY_META mode, I still get some output from the queu=
e
>(hw_protocol, hook, packet id etc) but as stated, the nfq_get_payload
>returns -1.
>
>I have not found anything on the official site stating that additional
>modifications are needed when running in META mode, but I might be
>overlooking something?
>
>Another small question, I am a little unclear as to exactly what
>information is passed in META mode. As far as I can understand, the
>content of the headers are passed to userspace right? Meaning
>IP/TCP/HTTP... headers are passed but payload is not?
>
>I hope someone is able to help me get to the bottom of this.
>
>Kind regards
>Andreas
>
>
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" i=
n
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Envoy=C3=A9 de mon t=C3=A9l=C3=A9phone Android avec K-9 Mail. Excusez l=
a bri=C3=A8vet=C3=A9.
