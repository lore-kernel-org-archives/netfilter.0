From: Ed W <lists@wildgooses.com>
Subject: Re: Status of iptables target support in ipset
Date: Mon, 12 Nov 2012 12:27:46 +0000
Message-ID: <50A0EB42.20806@wildgooses.com>
References: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?B?IkNzb3Jkw6FzIENzYWJhIElmai4i?= <cscsordas@gmail.com>
Cc: netfilter@vger.kernel.org

On 26/10/2012 14:58, Csord=C3=A1s Csaba Ifj. wrote:
> Dear Reader,
>
> I would like to ask when will it possible writing such rules as
> mentioned in $SUBJECT.
>
> For example:
>
> ipset new foo hash:ip
> ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG ... -t nat -A
> POSTROUTING -j SNAT ... -t mangle -A PREROUTING -j MARK ...
>

At this point haven't you re-implemented almost the whole of netfilter=20
inside ipset? (Or is that the point?).

Where do we draw the line?

Seems like an interesting idea anyway!

Ed W

