From: "Jesus M. Salvo Jr." <jesus.salvo@optusnet.com.au>
Subject: Re: Two interfaces - question
Date: Thu, 5 Jan 2006 06:35:31 +1100
Message-ID: <200601050635.31254.jesus.salvo@optusnet.com.au>
References: <200601041103.12130.marcin.giedz@eulerhermes.pl>
	<43BBAE9F.9080307@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43BBAE9F.9080307@saysnetsoft.com>
Content-Disposition: inline
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

On Wednesday 04 January 2006 22:16, vikrant wrote:
> Marcin Giedz wrote:
> >Hello,
> >
> >In my INtel Blade server I have two ethernet interfaces: eth0, eth1. Now
> > only one is working, the another one is not configured. However I'd like
> > to have something like dynamic routing: if one interfaces is down the
> > second one if
>
> i am getting little confused when u say interface goes down please
> explain .
> what do u mean from interface does down whether interface card become
> inactive or network cable get damage or ISP connection goes down please
> clarify it .
>
> >up. If first returns up the second one goes down.
> >
> >Does anyone know how can I do this?
> >
> >Thx,
> >Marcin
>
> Thanks
> Vikrant

What you are looking for is the bonding driver / interface.
Have a look in your filesystem for the file:

/usr/src/<kernel>/Documentation/networking/bonding.txt



