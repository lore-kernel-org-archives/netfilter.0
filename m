From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: ipv6 link local address
Date: Tue, 7 Jun 2011 18:50:11 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106071849240.19995@frira.zrqbmnf.qr>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>  <1307429067.7853.1.camel@hakkenden>  <92A9C99A1E5FF14F8538DDEE14996A5203365A@chp-exg.coxhp.com> <1307456633.23737.11.camel@hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1307456633.23737.11.camel@hakkenden>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "Nikolay S." <nowhere@hakkenden.ath.cx>
Cc: bmcdowell@coxhealthplans.com, netfilter@vger.kernel.org

On Tuesday 2011-06-07 16:23, Nikolay S. wrote:

>=D0=92 =D0=92=D1=82=D1=80, 07/06/2011 =D0=B2 12:44 +0000, bmcdowell@co=
xhealthplans.com =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Please understand that I do want to be able to use ip6tables to filt=
er forwarded traffic.  I just do not want the interfaces speaking to an=
yone while they're doing their job.
>>=20
>> Perhaps this example can explain it better than I have:  http://www.=
sjdjweis.com/linux/bridging/
>>=20
>>=20
>> Thanks again.
>>=20
>
>You won't. skb's are passed to ip6tables from bridge based on ipv6-
>header, not the state of the protocol on slave device. And bridge itse=
lf
>does not filter incoming frames by L3-header.

Usually does not, but can (ebtables --ip6-source ...).
