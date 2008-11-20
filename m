From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: "excessively large" library built in standalone ipset build
Date: Thu, 20 Nov 2008 23:56:09 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0811202352550.25790@fbirervta.pbzchgretzou.qr>
References: <7259d7020811201429p2b83a4a5h88c46331cfbbf449@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811201429p2b83a4a5h88c46331cfbbf449@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Thursday 2008-11-20 23:29, JC Janos wrote:

>(splitting this out -- more appropriately -- from a separate thread;
>Thanks, Jan)
>
>I'm building ipset from src (svn r7576) on Opensuse 11.
>
>It builds & installs without error.
>
>ls -al /usr/local/lib/ipset
> -rwxr-xr-x 1 root root   15253 2008-11-20 13:28 libipset_ipportiphash.so
> -rwxr-xr-x 1 root root 2112524 2008-11-20 13:28 libipset_ipportnethash.so
> -rwxr-xr-x 1 root root   15042 2008-11-20 13:28 libipset_setlist.so
>
>one of my libraries (libipset_ipportnethash.s) is *excessively* larger.
>Looking above, that's the only one that's so large ...
>Is this size in fact unexpectedly/problematically too large?
>If it is, what do I need to correct in my build?

I wonder. Can you give a dump of the following command?

	readelf -S libipset_ipportnethash.so

I have a premonition... and it is related to the GNU linker :-/
