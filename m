From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: PLs HELP !
Date: Mon, 3 Jun 2002 11:38:59 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206031029580.4553-100000@blackhole.kfki.hu>
References: <3CF6F8A7.3010501@inbox.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CF6F8A7.3010501@inbox.lv>
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

On Fri, 31 May 2002, Arindam Haldar wrote:

> i am getting these messages in my /var/log/messages..
> can someone tell me whats hapenning here..
> iptables v1.2.7-2--2-423 with  kernel 2.4.18 & patched htb3.3-020512 &
> imq-2.4.18...
> May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840
> &ip_conntrack_lock not readlocked

The connection tracking part of netfilter does not fuction properly on
your system. Is it a vanilla 2.4.18 or shipped by some vendor?

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



