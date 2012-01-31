From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Concurrent netfilters
Date: Tue, 31 Jan 2012 10:27:34 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201311023390.21619@frira.zrqbmnf.qr>
References: <CAN9nwp7_EorcWaCuyHg64iuZf5_8EWYQ+kYFMkui3CK2k4rJRg@mail.gmail.com> <alpine.LNX.2.01.1201310127330.20597@frira.zrqbmnf.qr> <20120130163529.1f396148@nehalam.linuxnetplumber.net>
 <CAN9nwp6J-5k+YYdra0+Vih_p9q=Mi5CY96w2Nsc-KSOWVPs3zg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAN9nwp6J-5k+YYdra0+Vih_p9q=Mi5CY96w2Nsc-KSOWVPs3zg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Zage <djzage@gmail.com>
Cc: Stephen Hemminger <shemminger@vyatta.com>, netfilter@vger.kernel.org

On Tuesday 2012-01-31 04:05, David Zage wrote:

>If I understand correctly, looking at RPS and taking into account the
>elimination of locking on packets, actual processing of packets by
>netfilters is still inherently serial?

Of course not, that would starve out machines with increasing number of 
execution units rather fast.
