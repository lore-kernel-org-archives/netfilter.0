From: "David Vogt" <mail@davidvogt.de>
Subject: Re: [libnetfilter_queue]
Date: Wed, 5 Apr 2006 17:03:19 +0200
Message-ID: <859616420604050803s7e4fb7bcv27db8ba810861624@mail.gmail.com>
References: <859616420604050556t39a5e7eeled57a3e25ed5d10a@mail.gmail.com>
	<1144248241.4406.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1144248241.4406.11.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@inl.fr>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

2006/4/5, Eric Leblond <eric@inl.fr>:
> Le mercredi 05 avril 2006 =E0 14:56 +0200, David Vogt a =E9crit :
> > Dear all,
> >
> > I would like to send different packets to different userland
> > applications using libnetfilter_queue. As far as I understand,
> > different queues can be distingusihed using some kind of queue number.
> > How does the appropriate iptables command look like that sends packets
> > to a specific queue?
>
> This is :
>
> iptables -A .... -j NFQUEUE --queue-num $ID

That was pretty much exactly what I am looking for. Thanks, Eric.

