From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_net_ftp  message !
Date: Mon, 3 Jun 2002 13:52:02 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206031349460.4790-100000@blackhole.kfki.hu>
References: <3CFB573C.7070406@inbox.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFB573C.7070406@inbox.lv>
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
To: Arindam Haldar <arindamhaldar@inbox.lv>
Cc: netfilter@lists.samba.org

On Mon, 3 Jun 2002, Arindam Haldar wrote:

> this time while insmod ip_nat_ftp(after ip_conntrack_ftp) & i got this
> message-->
> ASSERT ip_conntrack_core.c:541 & ip_conntrack_lock not read locked !
>
> this time i tried for the first time rh7.3. i have complied the kernel
> 2.4.18(downloaded & not from rh7.3) with iptables v1.2.7-2002528.

You mean, (sorry, I have difficulties in understanding your sentences)
that you downloaded the kernel source from ftp.kernel.org, compiled it,
installed both the kernel image and the modules and then got the message
above?

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


