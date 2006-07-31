From: varun <varun_saa@rediffmail.com>
Subject: Re: no ssh on eth0
Date: Mon, 31 Jul 2006 20:59:27 +0530
Message-ID: <1154359768.4902.1.camel@nirvana.aurokruti.in>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>
	<200607301241.29820.weinert@sys2.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200607301241.29820.weinert@sys2.de>
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
To: Michael Weinert <weinert@sys2.de>
Cc: netfilter@lists.netfilter.org

And why not Michael ?

Can you explain a little.

Thanks

Varun

On Sun, 2006-07-30 at 12:41 +0200, Michael Weinert wrote:
> Am Sonntag, 30. Juli 2006 08:01 schrieb varun:
> 
> Hello
> 
> how about editing the:
> 
> /etc/ssh/sshd_config
> 
> ListenAddress <your-ip-from-eth1>
> 
> I personally wouldn't do this with iptables.
> 
> Michael
> 
> > Hello,
> >
> > I a internet server with :
> >
> > eth0 as WAN and eth1 as LAN.
> >
> > I want to prevent ssh on eth0.
> >
> > Howto do it ?
> >
> > Thanks
> >
> > Varun
> 

