From: Realos <realos@loftmail.com>
Subject: Re: iptables rules
Date: Fri, 21 Oct 2005 15:46:45 +0200
Message-ID: <20051021134645.GA11724@isw302>
References: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>
	<Pine.LNX.4.61.0508050832310.20623@yvahk01.tjqt.qr>
	<1123704837.3708.1.camel@ndspc131.p.n-dsi.com>
	<1126649450.4790.5.camel@ndspc131.p.n-dsi.com>
	<1126797736.4790.24.camel@ndspc131.p.n-dsi.com>
	<432992C0.2000404@mnemon.de>
	<1126798629.4790.26.camel@ndspc131.p.n-dsi.com>
	<4329A01B.4020300@mnemon.de>
Reply-To: Realos <realos@loftmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4329A01B.4020300@mnemon.de>
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
To: netfilter@lists.netfilter.org

J=F6rg Harmuth wanted us to know:


>I see. You are referring to -m mport --port*s* (by the way, there is a=20
>typo or are you referring to another module ?), which is different from=20
>-m multiport --port*s* port[...] - which I was referring to. Your rule was
>
>... -m multiport --ports 22,23,24,25 -j ACCEPT
>
>So I looked for multiport.

There seems to be an inconsistence between man pages J=F6rg Harmuth has ins=
talled
and of some other people (the original poster and myself at least).

man iptables:

mport
...
 --ports port[,port[,port...]]
	Match if the both the source and destination ports are
	equal to each other and to one  of  the  given
	ports.

multiport
...
	used in conjunction with -p tcp or -p udp.
	rts port[,port[,port...]]
	Match if the both the source and destination ports
	are equal to each other and to one  of  the  given
	ports.

Mar 09, 2002 IPTABLES(8)

BTW, what is the diffence between mport and multiport modules?


--=20
Realos

