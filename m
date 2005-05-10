From: Albrecht =?unknown-8bit?q?Dre=DF?= <albrecht.dress@arcor.de>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Tue, 10 May 2005 13:02:59 +0200 (CEST)
Message-ID: <4448571.1115722979939.JavaMail.ngmail@webmail-06.arcor-online.net>
References: <42808D9C.2000603@dsl.pipex.com>
	<1115397393l.3864l.0l@antares.localdomain>	<427C5C41.3010407@riverviewtech.net>	<1115496014l.3549l.0l@antares.localdomain>	<427EFB7D.8010503@riverviewtech.net>	<1115663859l.3308l.0l@antares.localdomain>
	<427FAF51.9000102@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42808D9C.2000603@dsl.pipex.com>
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
To: andy.furniss@dsl.pipex.com, gtaylor@riverviewtech.net
Cc: netfilter@lists.netfilter.org

> One thought - the tcpdump is incomplete by just looking at port 80 you=20
> can't see what ICMP are being sent.

Well, the idea was to reduce the amount of data reported by tcpdump. My nai=
ve assumption was that running the two tcpdump's on eth0 and ppp0, I would =
see the request packet coming from eth0, the masqueraded one on ppp0, and t=
he same process in the opposite direction for the reply.

Why do you think it would be important to see the icmp's, too?

Cheers, Albrecht.

Machen Sie aus 14 Cent spielend bis zu 100 Euro!
Die neue Gaming-Area von Arcor - =FCber 50 Onlinespiele im Angebot.
http://www.arcor.de/rd/emf-gaming-1

