From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ip_net_ftp  message !
Date: Mon, 3 Jun 2002 14:39:50 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206031432120.4790-100000@blackhole.kfki.hu>
References: <3CFB5ED0.1020204@inbox.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFB5ED0.1020204@inbox.lv>
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

Hi,

On Mon, 3 Jun 2002, Arindam Haldar wrote:

> 1)i am getting these messages in my /var/log/messages..
>
>   iptables v1.2.7-20020423 with  kernel 2.4.18 & patched htb3.3-020512 &
> imq-2.4.18...
> May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840
> &ip_conntrack_lock not readlocked
>
> this pattern message is being received every minute. !.. this system is
> on RH-7.2 with 512mb ram & has been running for a month now but the
> mesages started coming since may 30 !...
>
> 2) while insmod ip_nat_ftp(after ip_conntrack_ftp) & i got this message
> on RH-7.3(using RH-7.3 for 1st time !).. the kernel was downloaded from
> ftp.kernel.org & iptables v1.2.7-2002528 -->
> ASSERT ip_conntrack_core.c:541 & ip_conntrack_lock not read locked !
>
> i have similar configuration done on different pc(with rh7.2) with
> various iptables veriosn but didnt get any of the errors mentioned above !

The iptables version is irrelevant in these cases - only the kernel and
its version counts. I can think of two possibilities (therefore stressed
the question on from where did you get the source of the running kernel):

- you run a vendor-provided kernel, compiled from vendor-provided source
- the additional patches you applied break some internal mechanism in
  netfilter

I know it's not much help for you.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


