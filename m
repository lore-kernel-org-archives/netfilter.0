From: MOUDARIR Mohamed <moudarir@Richbond.ma>
Subject: RE: MSN throught Linux
Date: Mon, 6 Oct 2003 09:04:29 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14C5057BC852D611BAC400E0299AA10F02043F@MAILSERV>
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
To: 'Thierry ITTY' <thierry.itty@besancon.org>, Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org

Thank you, but i try linux-igd and doesn't work.
After few seconde, upnpd stop being runing without any  reason !
I can see 4 process of upnpd eth0 eth2, when i run it the first time.
But stoped quickly less than one minute !
I have no probleme compiling and installing the source ( upnp-sdk and
linux-igd )

-----Message d'origine-----
De : Thierry ITTY [mailto:thierry.itty@besancon.org]
Envoy=E9 : lundi 6 octobre 2003 08:40
=C0 : Harald Welte; MOUDARIR Mohamed
Cc : netfilter@lists.netfilter.org
Objet : Re: MSN throught Linux


Use linux internet gateway device (aka linux-igd) from sourceforge
It relies on netfilter

I already posted some answers on this list about msn, have a look at =
the
archives

I intend to write a micro (don't dare say mini) howto on msn/netfilter =
very
soon

hth


A 12:43 03/10/2003 +0200, Harald Welte a =E9crit :
>On Fri, Sep 26, 2003 at 06:48:34PM -0000, MOUDARIR Mohamed wrote:
>> Hi
>> Can we use MSN voice conversation behind a Linux firwall ( redhat )=20
>
>No.  I think they are using SIP (no idea, I haven't used windofs for 8
>years) for which you would need a conntrack+nat helper on the linux
>firewall.  Since nobody has written such a helper yet, it doesn't =
work.
>
>--=20
>- Harald Welte <laforge@netfilter.org>
http://www.netfilter.org/
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
=3D
>  "Fragmentation is like classful addressing -- an interesting early
>   architectural error that shows how much experimentation was going
>   on while IP was being designed."                    -- Paul Vixie
>
>Attachment Converted: "d:\app\net\eudora\attach\ReMSNthr"
>


