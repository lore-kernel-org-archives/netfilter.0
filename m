From: "Michael Hudin" <hudin@zoetrope.com>
Subject: Re: Outgoing SMTP Mystery
Date: Wed, 5 Jun 2002 10:58:43 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001601c20cba$a1ad3a50$5227a8c0@michael>
References: <013601c20c15$cba57520$52cfd3cf@michael> <200206042346.g54NksA14771@Networker.rockstone.co.uk>
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
To: netfilter@lists.samba.org

Yeah, I was assuming that there were no default drop rules.  I'll make sure
to implement those.

I did realize that my /etc/hosts file was still set to the old subnet.  I
corrected that, but it still is having the same problem.  The gateway on the
mail machine is set correctly and remember that I can POP in and out and
SMTP out.  I just can't get SMTP in for some mind boggling reason.

-michael

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Tuesday, June 04, 2002 4:46 PM
Subject: Re: Outgoing SMTP Mystery


> On Tuesday 04 June 2002 11:18 pm, Michael Hudin wrote:
>
> >  I've always assumed that the numbers in the brackets were port
allowances
>
> No, they're not (although I can't say what they are - I don't use
> iptables-save).   If you look at the numbers, many of them are larger than
> 65535, so they're certainly not port numbers :-)
>
> > Here are my tables:
> >
> > *nat
> >
> > :PREROUTING ACCEPT [241:88600]
> > :POSTROUTING ACCEPT [0:9862]
> > :OUTPUT ACCEPT [68:4275]
> >
> > *mangle
> >
> > :PREROUTING ACCEPT [18365:3221456]
> > :INPUT ACCEPT [10886:760348]
> > :FORWARD ACCEPT [7269:2438049]
> > :OUTPUT ACCEPT [8009:752540]
> > :POSTROUTING ACCEPT [15177:3182145]
> >
> > *filter
> >
> > :INPUT ACCEPT [0:229546]
> > :FORWARD ACCEPT [363:1553786]
> > :OUTPUT ACCEPT [2:619341]
>
> I find this interesting - you have a default ACCEPT policy on all your
chains
> - specifically on FORWARD, and I cannot see any rules you have included
which
> DROP or REJECT packets..... so is there really any filtering going on in
your
> firewall, or is it in fact just an open router doing some network address
> translation !?
>
> I know this doesn't exactly solve your problem, but I wonder if it means
the
> problem isn't on your firewall ?
>
> Perhaps you could check the routing table on your SMTP server - what does
it
> have for a default gateway address ?
>
>
> Antony.
>
>
>


