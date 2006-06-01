From: "Stephan Higuti" <higuti.sam@gmail.com>
Subject: Re: Help!
Date: Thu, 1 Jun 2006 09:05:59 -0300
Message-ID: <3da957060606010505x2744ca27x85a51e9f1961ae36@mail.gmail.com>
References: <3da957060606010453h6488c763xcb4be5b81c8945bf@mail.gmail.com>
	<a919cbc70606010501r73a6f23ds5405eeb94a4b1942@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a919cbc70606010501r73a6f23ds5405eeb94a4b1942@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

thank'z Manish!

But i dont understant what you mean here:

> In ur scenario u will require only PREROUTING rule, but if want to
> access internet behind ur friewall, then need the POSTROUTING rule
> also. Choice is URs.

If i want that my servers access internet?

On 6/1/06, manish Jamwal <manish.jamwal@gmail.com> wrote:
> Hi
> When the server's r behind the firewall, u only need PREROUTING rule
> with target as DNAT.
> The POSTROUTING rule is required when ur traffic will be outwards,
> means u access the server's which are on ur WAN side.
> In ur scenario u will require only PREROUTING rule, but if want to
> access internet behind ur friewall, then need the POSTROUTING rule
> also. Choice is URs.
> This information is as per my knowledge. :)
> Manish
>
> On 6/1/06, Stephan Higuti <higuti.sam@gmail.com> wrote:
> > Hello guys....
> > I have a question about PREROUTING and POSTROUTING.
> > I'm making a new firewall script.....
> > In this script, i put some PREROUTING rules , ex:
> >
> > ####################### Apache ##########################
> > iptables -t nat -A PREROUTING -d 200.xxx.yyy.zzz -p tcp --dport 80 -j
> > DNAT --to-destination 192.168.23.7:80
> >
> > But i need to put some POSTROUTING rules to this?
> > My situation: My firewall will reply for 4 differents Ip's (reals) ,
> > one for apache , other for e-mail server, etc............
> > This PREROUTING rule get a pack that come from internet to a IP "x" ,
> > and i want that all that incoming to this ip , to be forward to my
> > internal ip.
> > So , i think that PREROUTING rules its right... but i dont if i need
> > to create a POSTROUTING for this.....
> > Waiting Help....
> >
> > p.s.:* Sorry for my bad, bad english   =3DD
> >
> > Cheers
> >
> > --
> > ---------------------------------------------------------------------
> > Stephan Higuti
> > MSN: higutisam@hotmail.com
> > Email: higuti@fai.com.br
> > ---------------------------------------------------------------------
> >
> >
>


--=20
---------------------------------------------------------------------
Stephan Higuti
MSN: higutisam@hotmail.com
Email: higuti@fai.com.br

T=E9cnico em Inform=E1tica
Adm servidores Linux
FAI - Faculdades Adamantinenses Integradas
---------------------------------------------------------------------

