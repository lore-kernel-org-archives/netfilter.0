From: "kenn murrah" <kenn@thebytebusiness.com>
Subject: Re: newbie question about port blocking
Date: Thu, 17 Apr 2003 15:06:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c3051c$dc8a4c20$2d64a8c0@murrahboy>
References: <003901c304e8$24b56fa0$2d64a8c0@murrahboy> <200304171622.51239.kimj@dawn.dk> <004701c304ee$4176fb30$2d64a8c0@murrahboy> <1050591911.740.36.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

well, i DID try this idea from Cedric ..
----- Original Message -----
From: "Cedric Blancher" <blancher@cartel-securite.fr>

Le jeu 17/04/2003 =E0 16:33, kenn murrah a =E9crit :
> BTW, i *AM* using squid, and my iptables already includes:
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
> REDIRECT --to-port 3128
> so, will the setup you describe be the only thing i need to add in order
to
> block non-http ports?

You can also set FROWARD chain policy to DROP :

iptables -P FORWARD DROP

This way, everything is denied, unless you use HTTP proxy.



as well as THIS idea from Kim:

> Rules should be:
> $ iptables -t filter -A INPUT -i lo -j ACCEPT
> $ iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
> $ iptables -t filter -A INPUT -j DROP
> $ iptables -t filter -A FORWARD -p tcp --dport 80 -j ACCEPT
> $ iptables -t filter -A FORWARD -j DROP


but both of them resulted in my not being about to access HTTP, either ...
what am I doing wrong here?  Thanks again to both Cedric and Kim ... can you
or anybody else spot what I'm doing wrong ???

all replies appreciated.

Kenn




