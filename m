From: "louie miranda" <lmiranda@chikka.com>
Subject: Re: managing another network route, can't connect to it! Pls see!
Date: Thu, 27 Feb 2003 15:20:44 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01ce01c2de30$be8a3400$0b00000a@nocpc3>
References: <030f01c2dd88$2f277140$0b00000a@nocpc3> <20030226150447.435f450b.arnt@c2i.net> <002a01c2ddfe$67e0e9a0$0b00000a@nocpc3>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: louie miranda <lmiranda@Chikka.com>, Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

hi thanks 2 everyone! :) all is working now..



--
thanks,
louie miranda



----- Original Message -----
From: "louie miranda" <lmiranda@Chikka.com>
To: "Arnt Karlsen" <arnt@c2i.net>; <netfilter@lists.netfilter.org>
Sent: Thursday, February 27, 2003 9:20 AM
Subject: Re: managing another network route, can't connect to it! Pls see!


> Arnt,
>
> Hi..
>
> I already add another ip over my gw w/c is 192.168.129.50 and point the
> route to 10.0.0.2. On my WS there's still no response when i go to
> 192.168.129.x block. But i can ping 192.168.129.50 ip.
>
> What else could be possibly be missing?
>
>
> --
> thanks,
> louie miranda
>
>
>
> ----- Original Message -----
> From: "Arnt Karlsen" <arnt@c2i.net>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, February 26, 2003 10:04 PM
> Subject: Re: managing another network route, can't connect to it! Pls see!
>
>
> >
> > ..'info ifconfig', you wanna do 'ifconfig eth1:0 192.168.129.254 up'
> > or somesuch, on your gw.  The new boxes on that net needs to know
> > where to go, too.
> >
> > --
> > ..med vennlig hilsen = with Kind Regards from Arnt... ;-)
> > ...with a number of polar bear hunters in his ancestry...
> >   Scenarios always come in sets of three:
> >   best case, worst case, and just in case.
> >
> >
> >
> >
>
>
>


