From: Eric Leblond <eric@regit.org>
Subject: Re: ulogd2, netfilter, and link-layer information
Date: Fri, 25 Jul 2014 03:35:42 +0200
Message-ID: <6bc3c4df-fbfb-48a4-9fd1-ccea193b4ada@email.android.com>
References: <CAKrqPw_gn1g4b6AQ3hq6xzKKyRuYHB_zubeRv9ETtHDaWHarxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKrqPw_gn1g4b6AQ3hq6xzKKyRuYHB_zubeRv9ETtHDaWHarxQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Laurent Parenteau <laurent.parenteau@gmail.com>, netfilter@vger.kernel.org

Hello Laurent,

On 24 juillet 2014 15:24:43 CEST, Laurent Parenteau <laurent.parenteau@=
gmail.com> wrote:
>Hi,
>
>I have recently used ulogd2 & netfilter to capture some traffic and
>create a pcap file.
>
>In the resulting pcap file, there is no link-layer information.
>Everything else is pretty much the same as what I get from a tcpdump
>capture; the only missing information is the link-layer (layer 2)
>information.
>
>In wireshark, that missing information is displayed as a "Raw packet
>data" section, with the content being "No link information available".
>That sits between the Frame information and the IPv4 information.
>
>So my question is, is it possible to capture the link-layer (layer 2)
>information as well using ulogd2 & netfilter, or is this a limitation
>of the tools?

Ulogd2 has to handle the generic case: logged packets can come from mul=
tiple interfaces and encapsulation can vary on these different interfac=
es. So logging raw data is the only setup that will always work in ulog=
d2 case.

A possible solution would be to add an option to use pcapng storage for=
mat (when libpcap is recent enough on system). This should allow to spe=
cify the layer 2 interface for each packets.

I'm currently away from a computer with wireshark so I don't know how I=
 can test if it does handle correctly this type of files.

Another solution would be to add an options forcing the layer2 type for=
 all logged packets of given pcap output. This would allow to use kerne=
l provided layer2 information and write fully qualified packets for enc=
apsulation like Ethernet.

This second solution looks far easier to implement and should be enough=
 for you. Feel free to open a ticket on bugzilla if you are interested =
in that.

BR,

>
>Thanks,
>Laurent
>--
>To unsubscribe from this list: send the line "unsubscribe netfilter" i=
n
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
Envoy=C3=A9 de mon t=C3=A9l=C3=A9phone Android avec K-9 Mail. Excusez l=
a bri=C3=A8vet=C3=A9.
