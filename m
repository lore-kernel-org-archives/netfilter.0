From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Using interface name as a command line option to create a iptables
 rule
Date: Mon, 20 Jun 2011 14:01:51 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106201359080.12967@frira.zrqbmnf.qr>
References: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: Adishesh M <adisheshsm@gmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2011-06-20 13:55, Adishesh M wrote:

>Hi,
>
>Is it mandatory (or recommended) to use interface as option to enable
>a particular port using iptables filter table.
>
>If we don=E2=80=99t use interface name while forming a rule, then are =
we
>compromising anything with respect to security?

They do different things, and hence there is no universal answer.
At times you want all packets of one given interface,
at other times, you want packets with one address on all interfaces.

The two sets certainly can be different (mathematically), so choose=20
wisely. Especially since addresses can occur on any interface.
