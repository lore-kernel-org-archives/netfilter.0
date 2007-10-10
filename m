From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Firewall br0
Date: Wed, 10 Oct 2007 12:24:52 +0200
Message-ID: <470CA874.4040604@freemail.hu>
References: <470C99D8.1030109@bortal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470C99D8.1030109@bortal.de>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "ml@bortal.de" <ml@bortal.de>
Cc: netfilter@vger.kernel.org

ml@bortal.de =EDrta:
> Hello List,
>
> i have a linux box with 3 interfaces.
> - Internet
> - 2nd Company Network
> - Internal Network
>
> Physically it looks like this:
> --------------------------------
> ppp0 (Internet), eth0 (plugged into DSL Modem)
> eth1 (External-Network, 10.10.10.1/24)
> eth2 (Internal-Network, 10.10.10.2/24)
>
> I thought of setting up a bridge with eth1 and eth2, which would=20
> "merge" the two networks together and i would get br0.
>
> Now I have the problem that I still want to firewall eth1 and eth2!
> E.g. I only want to allow traffic going to 10.10.10.100-200 (on=20
> serveral ports) to leave interface eth1.
>
> Can someone point me to the right place for more infos or examples?
Check the physdev match...

Swifty
>
> Thanks, Mario
>

