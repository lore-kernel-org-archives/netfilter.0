From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Broken fwmark
Date: Mon, 3 Jun 2002 12:22:21 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206031218260.4553-100000@blackhole.kfki.hu>
References: <Pine.LNX.4.33.0206022311320.10014-100000@shaun.sheddy.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.33.0206022311320.10014-100000@shaun.sheddy.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve <steve@sheddy.net>
Cc: netfilter@lists.samba.org

Hi,

On Sun, 2 Jun 2002, Steve wrote:

> I've had watermark routing working fine for sometime. However, recently it
> has stopped working and I'm not having much luck getting it to function
> again. The machine has gone through several kernel revisions and has had
> an additional network card fitted (PCNet32 based) and I'm not exactly sure
> when fwmark ceased to work.

Actually, I'm surprised that at some time it worked.

According to the manpage:

   MARK
       This  is  used  to set the netfilter mark value associated
       with the packet.  It is only valid in  the  mangle  table.
            ^^^^^^^^^^
You don't mark the reply packet as well by marking a packet, even if the
reply packet is generated on the machine itself.

What you want to achieve can be done by using Henrik Nordstrom's CONNMARK
patch from patch-o-matic.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


