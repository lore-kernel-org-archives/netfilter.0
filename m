From: "Hanz F." <hanz852@yahoo.com>
Subject: Re: =?unknown-8bit?q?R=E9f=2E=5F=3A=5FHow=5Fto=5Fblock=5FYahoo=5FMessenger=5Fthrough=5FIP?= Tables
Date: Sun, 6 Oct 2002 01:52:22 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021006085222.69643.qmail@web40011.mail.yahoo.com>
References: <OF2A444FE1.14BE65F7-ONC1256C49.0059E806-C1256C49.005A5A00@synetics.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF2A444FE1.14BE65F7-ONC1256C49.0059E806-C1256C49.005A5A00@synetics.fr>
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
Content-Transfer-Encoding: quoted-printable
To: alexander.swann@synetics.fr
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,
blocking yahoo messenger on iptables is not enough,
becoze users will still be able to connect through a
proxy, u have to block it on the proxy as well.

Concerning my email of 10/01/02 it was not very
accurate, but unfortunately nobody warned me, I had to
discover the error by myself: there's a missing line ,
when I added it, yahoo messenger and ICQ worked (as
well as IRC after loading related modules)
this line is:
iptables -A FORWARD -i eth0 -o eth1 -m state --state
ESTABLISHED, RELATED -j ACCEPT

If u don't insert this line yahoo messenger will not
work but also most applications.


--- alexander.swann@synetics.fr wrote:
>=20
> Hello
> I just did a quick search in the mails I received
> ;-)
>=20
>  =20
>
-----------------------------------------------------
>    Daryl Martin wrote on the 08/16/02 :
>=20
>       Just block outgoing traffic on port 1863 to
> block messenger traffic.
>  =20
>
http://support.microsoft.com/default.aspx?scid=3Dkb;EN-US;q278887
>=20
>       To block Yahoo it seems that's a little bit
> tricker.  To block yahoo
>    you will have to block ports 5000-5010 for voice
> chat, 5100 for video.
>    Yahoo messenger scans ports 5050 then 80 then any
> available port.  You
>    will probably most likely have to block the yahoo
> messenging IP.
>  =20
> http://help.yahoo.com/help/us/mesg/use/use-17.html
>=20
>  =20
>
-----------------------------------------------------
>=20
>    See also the message of "Hanz F." on the 10/01/02
> (4 days ago)
>=20
>  =20
>
-----------------------------------------------------
>=20
> Hope this will help
>=20
> Swann ;-)
>=20
>=20
>=20
>=20
> |---------+----------------------------------->
> |         |           Alok Shukla             |
> |         |           <alokshukla@yahoo.com>  |
> |         |           Envoy=E9 par :            |
> |         |           netfilter-admin@lists.ne|
> |         |           tfilter.org             |
> |         |                                   |
> |         |                                   |
> |         |           05/10/2002 17:59        |
> |         |                                   |
> |---------+----------------------------------->
> =20
>
>--------------------------------------------------------------------------=
------------------------------------------------------------------------|
>   |                                                =20
>                                                    =20
>                                            |
>   |       Pour :    netfilter@lists.netfilter.org  =20
>                                                    =20
>                                            |
>   |       cc :                                     =20
>                                                    =20
>                                            |
>   |       Objet :   How to block Yahoo Messenger
> through IP Tables                                  =20
>                                                |
> =20
>
>--------------------------------------------------------------------------=
------------------------------------------------------------------------|
>=20
>=20
>=20
>=20
> Hi ,
>=20
> Sorry for asking this newbie question first.
>=20
> I am running a network with a Linux Server as a
> gateway. I am using IPtables as to masquerade
> internal
> IPs for Internet usage. I want to block the uses of
> my
> intranet for using yahoo messenger. I needed help
> for
> this. In general i wanted to know how to block a
> particular port.
>=20
> Thanks in Advance
>=20
> Alok Shukla
>=20
> __________________________________________________
> Do you Yahoo!?
> Faith Hill - Exclusive Performances, Videos & More
> http://faith.yahoo.com
>=20
>=20
>=20
>=20
>=20
>=20


__________________________________________________
Do you Yahoo!?
Faith Hill - Exclusive Performances, Videos & More
http://faith.yahoo.com

