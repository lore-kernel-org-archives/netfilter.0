From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: squid + masquerade/nat + pptp problem
Date: Thu, 29 May 2003 08:19:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D27@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Thierry ITTY <thierry.itty@besancon.org>, netfilter@lists.netfilter.org

All this on a single nic!!?? I'd have to see a diagram or something..

pptp through a masquerade would need the pptp helper.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Thierry ITTY [mailto:thierry.itty@besancon.org]
Sent: Thursday, May 29, 2003 12:54 AM
To: netfilter@lists.netfilter.org
Subject: squid + masquerade/nat + pptp problem


Hello

I have a linux machine which does various things for my corporate users =
:
- running squid and squidGuard with ncsa auth for http/https/ftp =
outgoing
traffic=20
- running xinetd to redirect some incoming traffic to private ip servers
- running iptables to do some snat/dnat on some outgoing traffic that =
can't
be masqueraded (proprietary protocols)
- running iptables to do general masquerading for a few users

this machine has a single nic with several vlans, some vlans have =
aliases
to handle several IPs

thought not simple, it works fine

now I added a PoPToP server on it and things are going bad :
- when pptpd runs, people on one of the internal vlans can hardly =
sign-on,
whereas people on the other vlans have no problems. squid just doesn't =
ask
for authentification, then the client browser just can't connect to any
external site. sometimes after relaunching the browser several times the
client can get the signon box and gains access to the outer world again,
but often he doesn't get it and can't go out.
- when the pptp traffic goes throught the masqueraded interface (only =
one
is masqueraded among all) it's very hard to sign-on, there are very =
often
LCP time-out errors (on the poptop side) and error 678 on the windows =
side,
whereas when the pptp traffic only goes throught non masqueraded =
interfaces
there are no access problems (actually I start the pptpd daemon so it
listens only on one ip). Nevertheless, the first problem above happens
whatever interface the pptp traffic goes throught.

I understand quite well that my iptables rules should get refined to =
solve
the second problem, to ensure outgoing pptp traffic doesn't get nated or
masqueraded or something like that. anyway I can get it solved by using
another interface for a while.=20
What I really can't understand is why and how having pptpd running can
compromise squid's ncas authentification. and really it does : if a stop
pptpd for say a hour, then anybody gets auth'd at the first try and can
connect to any site, and as soon as i restart it, i get calls from =
people
who don't receive their signon box and get blocked.

Any idea how I could investigate such a problem, before i give up and =
put
another machine beside with just pptpd ?

tia
			- * - * - * - * - * - * -
Bien s=FBr que je suis perfectionniste !
Mais ne pourrais-je pas l'=EAtre mieux ?
	Thierry ITTY
eMail : Thierry.Itty@Besancon.org		FRANCE


