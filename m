From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Re: Two interfaces - question
Date: Wed, 4 Jan 2006 12:36:45 +0100
Message-ID: <200601041236.45830.marcin.giedz@eulerhermes.pl>
References: <200601041103.12130.marcin.giedz@eulerhermes.pl>
	<43BBAE9F.9080307@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="utf-8"
To: vikrant <vikrant@saysnetsoft.com>
Cc: netfilter@lists.netfilter.org

Dnia =C5=9Broda, 4 stycznia 2006 12:16, vikrant napisa=C5=82:
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
OK - very spimle. Let's say that network cable is damage or someone has=20
disconnected cable from the card. If one cable is unplagged (eth0) the seco=
nd=20
one (eth1) becames master.


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

