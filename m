From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Packet duplication
Date: Fri, 19 Oct 2007 13:25:29 +0200
Message-ID: <003801c81242$c160fec0$0b0ffe0a@NS006819>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47188A9A.2080604@netsys.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Tiaan Wessels =EDrta:
> thanks,
> i have located patch-o-matic snapshot for yesterday on netfilter ftp
> server. so i did a runme extra but it never asks me to apply the
> ROUTE/--tee patch. is this correct ? must I recompile my
> kernel in any case ?

Yes you have to supply the kernel source-path and compile your own
kernel. While you're at it, also download the new iptables source and
let POM-ng also patch that source. Compiling the kernel isn't that hard=
,
iptables is easier, just supply the iptables source path and when the
kernel is done, compile and install iptables. Remember to remove the
existing iptables package from your distribution.

Perhaps you can find the kernel-config from the distro you're using to
import when running "make menuconfig", so you automatically have all
options selected that you currently have (unless you choose another
kernel version than what you are using now). That way you only have to
select the extra's you want.


Grts,
Rob


