From: "Tim" <twr@bellsouth.net>
Subject: Re: forwarding
Date: Sun, 7 Jul 2002 21:03:24 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003d01c22634$82a59600$1606d6d1@nebuchadnezza>
References: <003101c2262f$33ff1a30$1606d6d1@nebuchadnezza> <20020708003031.PFFP23840.mta03-svc.ntlworld.com@there> <003801c22632$521c93a0$1606d6d1@nebuchadnezza> <20020708005322.KPDJ4119.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: iptables-list <netfilter@lists.samba.org>

give me a second and I will get this all for you

Tim
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Sunday, July 07, 2002 5:53 PM
Subject: Re: forwarding


> On Monday 08 July 2002 4:47 am, Tim wrote:
>
> > yes...it does say echo 1 > /proc/sys/net/ipv4/ip_forward  .... and when
I
> > look in file is has the number 1 on it as it should according to this
> > command.
>
> Okay, what's the output of
> iptables -L -n -v -x
> iptables -L -n -v -x -t nat
>
> after you've tried to send some packets through the machine ?
>
> Oh, and just to be sure - how do yu know your machine isn't forwarding
> packets ?   What happens / doesn't happen to tell you it's not working ?
>
> Oh, and by the way - what are the addresses / netmasks on your Internal /
DMZ
> interfaces, and what's your routing table ?
>
>
>
> Antony.
>
> > ----- Original Message -----
> > From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> > To: "iptables-list" <netfilter@lists.samba.org>
> > Sent: Sunday, July 07, 2002 5:30 PM
> > Subject: Re: forwarding
> >
> > > On Monday 08 July 2002 4:25 am, Tim wrote:
> > > > Well, it looks like my netfilter rules/commands are not forwarding
even
> > > > though I have
> > > >
> > > > ## Routing packets (traffic) between INTERNAL and DMZ
> > > > "echo "1" /proc/sys/net/ipv4/ip_forward"
> > >
> > > That really says
> > > echo 1 >/proc/sys/net/ipv4/ip_forward
> > > or
> > > echo "1" >/proc/sys/net/ipv4/ip_forward
> > > doesn't it ?
> > >
> > > (Note specifically the > sign)
> > >
> > >
> > >
> > > Antony.
>
>


