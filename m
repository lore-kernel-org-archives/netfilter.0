From: "Rikunj" <Rikunj@raha.com>
Subject: Re: How to stop the flood?
Date: Thu, 28 Apr 2005 20:54:34 +0300
Message-ID: <03dc01c54c1b$5609fbd0$3b3429c4@rp>
References: <20050428154656.AA0188EDCEB@smtp.sterenborg.info>
Reply-To: Rikunj <Rikunj@raha.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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


I really don't want them to do this and they are blocked as soon as
discovered.

All the clients are from DHCP IP's of 4 subnets of /24. Blocking them one by
one will eat up IP's.

Moreover they change the attacking src and dst ports making it hard to
pinpoint them.

My real problem is to identify the culprits.
How can I differentiate a genuine traffic and a infected attack? What should
I look for?

Regards,
Rikunj Patel


----- Original Message -----
From: "Dwayne Hottinger" <dhottinger@harrisonburg.k12.va.us>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, April 28, 2005 6:54 PM
Subject: RE: How to stop the flood?


> Im confused.  Why would you allow someone on your network (subnet or net)
do
> such a thing.  Cant you just not give them access, either via dhcp or some
> other way.  Sounds almost like an issue for management ie someone needs to
> start looking for employment elsewhere.
>
> ddh
>
> Quoting Rob Sterenborg <rob@sterenborg.info>:
>
> > netfilter-bounces@lists.netfilter.org <> scribbled on Thursday, 28 April
> > 2005 16:48:
> >
> > > Thankyou for the reply.
> > >
> > > This was the log from one of my client who was attacked from a client
> > > on other subnet.
> > >
> > > My network consist of clients from different subnets of /24.
> > >
> > > The attacks from one subnet travels through my linux router
> > > and hits the client on other subnet.
> > >
> > > I tried few rules as below but seems not to be working.
> >
> > The script doesn't block any packets from 192.168.25.208.
> > If 192.168.25.208 isn't allowed passing your router, you should block it
> > :
> >
> > $IPT -A FORWARD -s 192.168.25.208 [-d <destination_ip>] \
> >   -j [DROP|REJECT --reject-with-tcp-reset]
> >
> > Or something like that.
> >
> > The real solution is like Jason said : track down the person at
> > 192.168.25.208 and kick his/her ass !
> >
> >
> > Gr,
> > Rob
> >
> >
>
>
> --
> Dwayne Hottinger
> Network Administrator
> Harrisonburg City Public Schools
>




----- Original Message -----
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, April 28, 2005 6:47 PM
Subject: RE: How to stop the flood?


> netfilter-bounces@lists.netfilter.org <> scribbled on Thursday, 28 April
> 2005 16:48:
>
> > Thankyou for the reply.
> >
> > This was the log from one of my client who was attacked from a client
> > on other subnet.
> >
> > My network consist of clients from different subnets of /24.
> >
> > The attacks from one subnet travels through my linux router
> > and hits the client on other subnet.
> >
> > I tried few rules as below but seems not to be working.
>
> The script doesn't block any packets from 192.168.25.208.
> If 192.168.25.208 isn't allowed passing your router, you should block it
> :
>
> $IPT -A FORWARD -s 192.168.25.208 [-d <destination_ip>] \
>   -j [DROP|REJECT --reject-with-tcp-reset]
>
> Or something like that.
>
> The real solution is like Jason said : track down the person at
> 192.168.25.208 and kick his/her ass !
>
>
> Gr,
> Rob
>
>


