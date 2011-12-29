From: Andrew Stone <andrew@stonie.net>
Subject: Re: NAT WAN IP to internal range?
Date: Thu, 29 Dec 2011 22:10:48 +1100
Message-ID: <CANSq30v-QabkFg3OYGqrRDJ_Jir5=eFiw43hjF7iA-aUeyTTRA@mail.gmail.com>
References: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com>
	<1324458449.4269.49.camel@steve-pc>
	<CANSq30tNeT5AUD+Veq5qhxWgTXmqhy01Tyh5a1NYLSe1u4FXOA@mail.gmail.com>
	<4EFC46CE.8010202@atc.tcs.com>
	<4EFC49F3.2040009@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EFC49F3.2040009@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter@vger.kernel.org

>> """
>> In Kernels up to 2.6.10 you can add several --to-destination options=
=2E
>> For those kernels, if you specify more than one des=E2=80=90
>> tination address, either via an address range or multiple
>> --to-destination options, a simple round-robin (one after another
>> in cycle) load balancing takes place between these addresses. Later
>> Kernels (>=3D 2.6.11-rc1) don't have the ability to NAT
>> to multiple ranges anymore.
>> """

Yeah I read that... It does not describe what I=E2=80=99m trying to
accomplish=E2=80=A6 hence the confusion on my part=E2=80=A6
I=E2=80=99m trying to configure a one to many NAT.  (One WAN address to=
 a
range of internal addresses)

So=E2=80=A6 Looks like I=E2=80=99m trying an incorrect approach... how =
is one to
configure a one to many NAT? Is there a different approach I can take
to achieve this?

Any pointers appreciated.

Kind regards,
Andrew.
