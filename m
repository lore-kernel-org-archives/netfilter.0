From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Help NEEDED--sos !!
Date: Wed, 5 Jun 2002 12:59:47 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206051256000.8715-100000@blackhole.kfki.hu>
References: <3CFDEBAD.1080107@inbox.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFDEBAD.1080107@inbox.lv>
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

On Wed, 5 Jun 2002, Arindam Haldar wrote:

> > Sorry for the stupid question but are you definitely run the kernel you
> > are talking about?
>
> :) .. no probs for asking ur welcome !.. ys the running kernel is the
> one i complied . am not too good a C programmer but am doing
> administation for 3+ years now !.. & have been doing kernel, iptables,
[...]
> in hope for a solution tonight !

Impossible. We are still in dark what's going on your machine.

*Probably* it could help, if you would recompile the kernel modules with
netfilter debugging enabled. You mentioned that you had got such messages
by simply loading in the ip_conntrack_ftp module. Then please try to
reproduce the problem and post the kernel logs.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


