From: Unknown <unknown@unknown.invalid>
Subject: Re: Major NAT Problem
Date: Tue, 10 Feb 2004 19:56:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12771.4804759764$1076465359@news.gmane.org>
References: <Sea2-F19kyCKDkb9pPF00000901@hotmail.com> <008c01c3f036$90067b70$0200000a@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <008c01c3f036$90067b70$0200000a@heretic>
Content-Disposition: inline
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
To: Alexis <alexis@attla.net.ar>, netfilter <netfilter@lists.netfilter.org>

> From: "Ted Erickson" <tederickson7582@hotmail.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, February 05, 2004 11:54 PM
> Subject: Major NAT Problem
>
> > I am somewhat new to IPTables but not to linux.  I have a major problem.
> > Some background first... I have a PPoA SDSL connection with Qwest running
>
> at
>
> > 640k/up/down.  I have a static block of 8 addresses.....I have a
>
> connection
>
> > from the DSL modem to eth0 on my Redhat 9.0 box and I have my local
>
> network
>
> > pluged into eth1.  The only thing running on the linux box is IPTables
> > nothing else.  I turned on echo 1 > /proc/sys/net/ipv4/ip_forward and
> > enabled MASQ in several different ways..... no problem.  I can surf the
> > internet just fine on my local network machine but I have ONE BIG
>
> PROBLEM!!!
>
> >   I can't view a handfull of websites.  If I take the linux box out of
> > the picture and throw a cheap Linksys Router on the same DSL connection I
> > can see all the web sites i want.  IPTables is blocking something but I
> > don't know what? I can't find any info on the web with this problem.  I
> > need to fix this ASAP or I will have to go with something else, but I
> > want to stay with linux.
> >
> > theo
> >

	This could convievably also be TCP ECN active on the linux box ... it has been known
	to cause problesms with certain firewall configurations.  Although TCP ECN is a wonderful
	concept the standard has yet to completely catch on and can cause problems .. 
	you might try 

	echo "0" > /proc/sys/net/ipv4/tcp_ecn
	which will turn it off ... (i rebuilt my second kernel with tcp_ecn on, since it sounded like such
	a wonderful idea ... had to turn if off when the other half couldn't get to two of her fav websites.)

	Alistair

