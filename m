From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Help NEEDED--sos !!
Date: Tue, 4 Jun 2002 10:10:28 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206041007010.6390-100000@blackhole.kfki.hu>
References: <3CFC3D2A.9030409@inbox.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFC3D2A.9030409@inbox.lv>
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

On Tue, 4 Jun 2002, Arindam Haldar wrote:

> > yes..:)... sorry for being a little cryptic ;)... but u guessed it right
> > !..so i will summarize my 2 Question in this listing-->
> > 1)i am getting these messages in my /var/log/messages..
> >
> >  iptables v1.2.7-20020423 with  kernel 2.4.18 & patched htb3.3-020512 &
> > imq-2.4.18...
> > May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840
> > &ip_conntrack_lock not readlocked
>
> can someone tell me whats wrong ?..how can i solve this problem??

I'd suggest to start with a new 2.4.18 kernel, without the htb3 and imq
patches applied. Check out that it works, without emitting such messages.

If the problem persists, then it might be a netfilter related problem
(there still can be bad hardvare...). If the problem disappears then
it is related to the two additional extra patches.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


