From: "Alexis" <alexis@attla.net.ar>
Subject: Fw: Iptables rules
Date: Wed, 14 Jan 2004 22:35:12 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00fd01c3db07$d1afcfc0$0200000a@heretic>
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
To: netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Alexis" <alexis@attla.net.ar>
To: "Minh Cao" <caom@statsus.com>
Sent: Wednesday, January 14, 2004 10:08 PM
Subject: Re: Iptables rules


> echo 1 > /proc/sys/net/ipv4/ip_forward
>
>
>
>
> ----- Original Message ----- 
> From: "Minh Cao" <caom@statsus.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, January 14, 2004 10:04 PM
> Subject: Help: Iptables rules
>
>
> > Hi,
> >
> > I am new to iptables.
> > Please help me to create a rules, which allows everything in and out
both
> > interfaces.
> >
> > What I have but not worked:
> > iptables -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> > iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> >
> > iptalbles -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> >
> >
> > Thanks
> > Minh
> >
> >
> >
> >
>



