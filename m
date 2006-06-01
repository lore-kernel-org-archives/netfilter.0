From: "Stephan Higuti" <higuti.sam@gmail.com>
Subject: Re: Help!
Date: Thu, 1 Jun 2006 09:34:24 -0300
Message-ID: <3da957060606010534x7f0c15fcs676c0bc29d24c6a2@mail.gmail.com>
References: <3da957060606010453h6488c763xcb4be5b81c8945bf@mail.gmail.com>
	<02BB8A4AC86C564C89C7F14CF98CE0C4012783@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C4012783@knowledge.wizdom.nu>
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

thankz for help guys!
So , its right my rule?
Anyway... look this image:
http://img180.imageshack.us/my.php?image=3Dfirewallsemip2ok.jpg

My eth0 reply for 4 reals ip's...
And forward the packs to my servers......... so , PREROUTING its the
right way to do this?

Thank's a lot!

On 6/1/06, Sietse van Zanen <sietse@wizdom.nu> wrote:
> You are doing it exactly as it should be done.
>
> DNAT rules go to PREROUTING CHAIN (as you first want to set the new desti=
nation and the do routing)
> SNAT rules go to POSTROUTING (usually, as it wouldn't really matter where=
 they go, unless you do source routing).
>
> Ofcourse you will need to ACCEPT the connections in your filter table too=
.
>
> -Sietse
>
> ________________________________
>
> From: netfilter-bounces@lists.netfilter.org on behalf of Stephan Higuti
> Sent: Thu 01-Jun-06 13:53
> To: netfilter@lists.netfilter.org
> Subject: Help!
>
>
>
> Hello guys....
> I have a question about PREROUTING and POSTROUTING.
> I'm making a new firewall script.....
> In this script, i put some PREROUTING rules , ex:
>
> ####################### Apache ##########################
> iptables -t nat -A PREROUTING -d 200.xxx.yyy.zzz -p tcp --dport 80 -j
> DNAT --to-destination 192.168.23.7:80
>
> But i need to put some POSTROUTING rules to this?
> My situation: My firewall will reply for 4 differents Ip's (reals) ,
> one for apache , other for e-mail server, etc............
> This PREROUTING rule get a pack that come from internet to a IP "x" ,
> and i want that all that incoming to this ip , to be forward to my
> internal ip.
> So , i think that PREROUTING rules its right... but i dont if i need
> to create a POSTROUTING for this.....
> Waiting Help....
>
> p.s.:* Sorry for my bad, bad english   =3DD
>
> Cheers
>
> --
> ---------------------------------------------------------------------
> Stephan Higuti
> MSN: higutisam@hotmail.com
> Email: higuti@fai.com.br
> ---------------------------------------------------------------------
>
>
>
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

