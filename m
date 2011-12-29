From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: NAT WAN IP to internal range?
Date: Thu, 29 Dec 2011 17:05:02 +0530
Message-ID: <4EFC5066.5060709@atc.tcs.com>
References: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com> <1324458449.4269.49.camel@steve-pc> <CANSq30tNeT5AUD+Veq5qhxWgTXmqhy01Tyh5a1NYLSe1u4FXOA@mail.gmail.com> <4EFC46CE.8010202@atc.tcs.com> <4EFC49F3.2040009@atc.tcs.com> <CANSq30v-QabkFg3OYGqrRDJ_Jir5=eFiw43hjF7iA-aUeyTTRA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANSq30v-QabkFg3OYGqrRDJ_Jir5=eFiw43hjF7iA-aUeyTTRA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Andrew Stone <andrew@stonie.net>
Cc: netfilter@vger.kernel.org

On Thursday 29 December 2011 04:40 PM, Andrew Stone wrote:
> Yeah I read that... It does not describe what I=E2=80=99m trying to
> accomplish=E2=80=A6 hence the confusion on my part=E2=80=A6
> I=E2=80=99m trying to configure a one to many NAT.  (One WAN address =
to a
> range of internal addresses)

What are you trying to achieve? Do you want to allow the the internal=20
machines to access Internet? If so, SNAT is sufficient.

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o $WANIF -j SNAT=20
--to-source a.b.c.241

Here I am assuming that 192.168.1.0/24 is your internal network and you=
=20
want to allow all the machines. If you want to allow only a few=20
machines, put a comma separated "address[/mask]" list.


Regards,
Vignesh
