From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Failed to compile libnetfilter_queeu 1.0.1 under Centos 6.2
Date: Mon, 16 Jan 2012 13:18:15 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201161312560.4466@frira.zrqbmnf.qr>
References: <BLU162-W1607A553582A18B27146E4F6830@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BLU162-W1607A553582A18B27146E4F6830@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Cc: netfilter@vger.kernel.org

On Monday 2012-01-16 12:22, Andres Velasco Garcia wrote:

>I could not find=C2=A0a netfilter_queue RPM for Centos 6.2


As major contributor to iptables and opensuse maintainer for their
security:netfilter subproject, I also try keeping around builds for
other distros.
http://dl.medozas.de/repos/netfilter/CentOS_6/

>../include/libnetfilter_queue/linux_nfnetlink_queue.h:8:42: error:=20
>libnfnetlink/linux_nfnetlink.h: No such file or directory
>solved using
>//#include <libnfnetlink/linux_nfnetlink.h>
>#include <linux/netfilter/nfnetlink.h>
>Am I missing something?

Are you missing libnfnetlink, perhaps?
