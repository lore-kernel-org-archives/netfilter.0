From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Disable port translation in SNAT
Date: Sun, 27 Jul 2014 09:53:13 +0200
Message-ID: <53D4AFE9.70603@plouf.fr.eu.org>
References: <2F6A61C9-C112-4C17-9BE7-9B6438B19893@warp2biz.com> <53D153B7.6000302@plouf.fr.eu.org> <53D159D5.3090904@warp2biz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53D159D5.3090904@warp2biz.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: James Lamanna <james@warp2biz.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

James Lamanna a =E9crit :
> Hi,
> I have one device (an IP phone) on an AirRouter (based on linux, uses=
 iptables).
> it still is translating ports in the 16000 range all the way down to =
1025,
> which breaks RTP (it apparently doens't have very good SIP/SDP=20
> conn-tracking on it).

Can you indicate the kernel version running on that router, and the
exact SNAT rule ?
