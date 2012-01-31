From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: Concurrent netfilters
Date: Mon, 30 Jan 2012 16:35:29 -0800
Message-ID: <20120130163529.1f396148@nehalam.linuxnetplumber.net>
References: <CAN9nwp7_EorcWaCuyHg64iuZf5_8EWYQ+kYFMkui3CK2k4rJRg@mail.gmail.com>
	<alpine.LNX.2.01.1201310127330.20597@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1201310127330.20597@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: David Zage <djzage@gmail.com>, netfilter@vger.kernel.org

On Tue, 31 Jan 2012 01:28:21 +0100 (CET)
Jan Engelhardt <jengelh@medozas.de> wrote:

> On Tuesday 2012-01-31 00:46, David Zage wrote:
> 
> >Has there been work on netfilter to take advantage of multiple cores
> >(e.g., concurrent packet processing)?
> 
> Filtering runs on the same core as networking gives us. Therefore, 
> consult with General Networking for RPS and RFS.

Lots of work has gone into eliminating locking when processing packets
on multiple cores. This makes multi-queue NIC's and RPS more efficient.

Also the semantics of rule evaluation are sequential.
