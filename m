From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: dns server
Date: Thu, 6 Jun 2002 15:37:28 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061537.28204.raymondl@knowledgefactory.co.za>
References: <1420507267.20020606152231@gmx.de> <007501c20d5e$7ddfefb0$d700677d@7jbkbszj019>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <007501c20d5e$7ddfefb0$d700677d@7jbkbszj019>
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
To: Francois Peyron <lists@peyron.nom.fr>, netfilter@lists.samba.org

What are you trying to accomplish?

Allow clients internally to query your DNS server?
Allow your DNS server to query root servers and forwarders?
Allow external people to query your DNS server?
Allow updates to slave zones on your DNS server from external DNS =
servers?

You should create specific rules for these situations rather than =
generic=20
rules.

Ray

On Thursday 06 June 2002 15:31, Francois Peyron wrote:
> Hi,
>
> I think you have to add the same line for the tcp protocol, I can't
> remember why: I think some requests are made with udp while others =
with
> tcp. iptables -A INPUT -p tcp --destination-port 53 -j ACCEPT
>
> hope this will help,
>
> Francois
> ----- Original Message -----
> From: "Corin Langosch" <corinl@gmx.de>
> To: "IP-Tables Maillingliste" <netfilter@lists.samba.org>
> Sent: Thursday, June 06, 2002 3:22 PM
> Subject: dns server
>
> > Hi,
> >
> > im running a dns server here and i'm not sure if the following rule =
is
>
> enough to
>
> > allow dns queries from everywhere:
> >
> > $IPTABLES -A INPUT -p udp --destination-port 53 -j ACCEPT
> >
> > all other packets are reject or dropped.
> >
> > Thanks,
> > Corin

--=20
----------------------------------------

Ray Leach (Technical Network Specialist)

Knowledge Factory

www: http://www.knowledgefactory.co.za

Tel: +27-11-445-8100 Direct: 445-8263

Fax: +27-11-445-8101

"No matter where you go, there you are."

----------------------------------------

