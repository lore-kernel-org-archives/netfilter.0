From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables related
Date: Mon, 8 Dec 2003 11:57:27 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679078@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

Wow! This must be a record!

8 Responses to the same question, and ALL of them are right!!!

-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
Sent: Monday, December 08, 2003 11:42 AM
To: netfilter@lists.netfilter.org
Subject: Re: iptables related


On Monday 08 December 2003 7:35 pm, Jeffrey Laramie wrote:

> On Monday 08 December 2003 14:19, Jeffrin wrote:
> > hello all,
> >
> > iptables -A INPUT -sport 80 -j ACCEPT
> >
> > shows error ...
> >
> >  msservices:~# iptables -A INPUT --sport 80 -j ACCEPT iptables=20
> > v1.2.9: Unknown arg `--sport' Try `iptables -h' or 'iptables --help'

> > for more information.
> >
> > please help me ...
>
> There are 2 dashes before sport:  --sport 80

2 dashes and a protocol :)

Antony.

--=20
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the
list;
                                                           please don't
CC me.



