From: "David Leangen" <dleangen@canada.com>
Subject: RE: /etc/sysconfig/iptables does not load on reboot
Date: Sat, 2 Jul 2005 15:43:23 +0900
Message-ID: <NEBBKBPLMLNABNADCIPAEECJBDAB.dleangen@canada.com>
References: <Pine.NEB.4.62.0507020637440.20364@ukato.freeshell.org>
Reply-To: dleangen@canada.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.NEB.4.62.0507020637440.20364@ukato.freeshell.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


> Well, in that case, I have no idea. Did you check the startup logs?
> Does the system display [ OK ] on the iptables line when booting?

Yep, the system displays [ OK ] and I don't see anything of interest in the
logs. That's exactly why I can't figure this out. If at least there were
some info in the logs, that would at least point me in some direction.
Unless, of course, I'm looking in the wrong place...


Cheers,
Dave




> -----Original Message-----
> From: Alexey Toptygin [mailto:alexeyt@freeshell.org]
> Sent: 2 July 2005 15:39
> To: David Leangen
> Subject: RE: /etc/sysconfig/iptables does not load on reboot
>
>
> On Sat, 2 Jul 2005, David Leangen wrote:
>
> > [root@sannomiya ~]# chkconfig --list iptables
> > iptables        0:off   1:off   2:on    3:on    4:on    5:on    6:off
> >
> > My /etc/rc.d/init.d/iptables script is the default script installed with
> > FC3.
>
> Well, in that case, I have no idea. Did you check the startup logs? Does
> the system display [ OK ] on the iptables line when booting?
>
>  			Alexey


