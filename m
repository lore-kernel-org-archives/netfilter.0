From: Javier Sanchez <sjllera@ya.com>
Subject: Re: Linux kernel module and -m owner match
Date: Thu, 16 Sep 2004 14:43:33 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095338613.27900.1045.camel@cluster>
References: <20040916113433.35523.qmail@web21003.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040916113433.35523.qmail@web21003.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Nicolas Boiteux <nicolas_boiteux@yahoo.fr>
Cc: netfilter@lists.netfilter.org


Ok, the owner match option is experimental so it was probably not
included in previous kernel versions. Adding the line to the old .config
file should do the trick but i recommend you loading the old config file
onto de kernel config utility and add any new options you need, this way
you will be sure that the config file is correct.

Cheers

?A
> yep , i use the kernel of kernel.org . But, in fact
> since the 2.4.23, i use the same .config file .=20
>=20
> I copy the oldone it in the /usr/src/linux-2.4.x and
> override the new one . Is it a bad way to do like that
> ?
>=20
> here what i have in my .config file:
>=20
> CONFIG_IP_MULTICAST=3Dy
> # CONFIG_IP_ADVANCED_ROUTER is not set
> # CONFIG_IP_PNP is not set
> # CONFIG_IP_MROUTE is not set
> CONFIG_IP_NF_CONNTRACK=3Dy
> CONFIG_IP_NF_FTP=3Dy
> # CONFIG_IP_NF_AMANDA is not set
> # CONFIG_IP_NF_TFTP is not set
> CONFIG_IP_NF_IRC=3Dy
> CONFIG_IP_NF_IPTABLES=3Dy
> CONFIG_IP_NF_MATCH_LIMIT=3Dy
> CONFIG_IP_NF_MATCH_MAC=3Dy
> CONFIG_IP_NF_MATCH_PKTTYPE=3Dy
> CONFIG_IP_NF_MATCH_MARK=3Dy
> CONFIG_IP_NF_MATCH_MULTIPORT=3Dy
> CONFIG_IP_NF_MATCH_TOS=3Dy
> CONFIG_IP_NF_MATCH_RECENT=3Dy
> CONFIG_IP_NF_MATCH_ECN=3Dy
> CONFIG_IP_NF_MATCH_DSCP=3Dy
> CONFIG_IP_NF_MATCH_AH_ESP=3Dy
> CONFIG_IP_NF_MATCH_LENGTH=3Dy
> CONFIG_IP_NF_MATCH_TTL=3Dy
> CONFIG_IP_NF_MATCH_TCPMSS=3Dy
> CONFIG_IP_NF_MATCH_STEALTH=3Dy
> # CONFIG_IP_NF_MATCH_HELPER is not set
> CONFIG_IP_NF_MATCH_STATE=3Dy
> CONFIG_IP_NF_MATCH_CONNTRACK=3Dy
> CONFIG_IP_NF_FILTER=3Dy
> CONFIG_IP_NF_TARGET_REJECT=3Dy
> CONFIG_IP_NF_NAT=3Dy
> CONFIG_IP_NF_NAT_NEEDED=3Dy
> CONFIG_IP_NF_TARGET_MASQUERADE=3Dy
> CONFIG_IP_NF_TARGET_REDIRECT=3Dy
> # CONFIG_IP_NF_NAT_LOCAL is not set
> CONFIG_IP_NF_NAT_IRC=3Dy
> CONFIG_IP_NF_NAT_FTP=3Dy
> CONFIG_IP_NF_MANGLE=3Dy
> CONFIG_IP_NF_TARGET_TOS=3Dy
> CONFIG_IP_NF_TARGET_ECN=3Dy
> CONFIG_IP_NF_TARGET_DSCP=3Dy
> CONFIG_IP_NF_TARGET_MARK=3Dy
> CONFIG_IP_NF_TARGET_LOG=3Dy
> CONFIG_IP_NF_TARGET_ULOG=3Dy
> CONFIG_IP_NF_TARGET_TCPMSS=3Dy
> # CONFIG_IP_NF_ARPTABLES is not set
> # CONFIG_IP_VS is not set
> # CONFIG_IPX is not set
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_IPMI_PANIC_EVENT is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> # CONFIG_IPMI_KCS is not set
> # CONFIG_IPMI_WATCHDOG is not set
>=20
>=20
>=20
>  --- Javier Sanchez <sjllera@ya.com> a =E9crit :=20
> >=20
> > No, im using it on fresh vanilla kernels 2.4.27, and
> > it should appear on
> > the config file, no matter if you selected it or
> > not.
> >=20
> > In your kernel (menuconfig -> networking options ->
> > Netfilter
> > Configuration) you should see this.
> >=20
> >=20
> >    [*]   Unclean match support (EXPERIMENTAL)
> >    [*]   Owner match support (EXPERIMENTAL)
> >    [*]   Packet filtering       =20
> >=20
> > Did you download the kernel form kernel.org ???
> >=20
> > Cheers
> >=20
> > ?A
> > > I just look in my kernel .config, and i don t see
> > it .
> > >=20
> > >=20
> > > Do i have a patch to apply to enable this feature
> > like
> > > ng, or does it a normal feature in the kernel ?
> > >=20
> > > If it is, can i add this line directly in my
> > .config ?
> > >=20
> > > thanks ;)
> > > Nicolas
> > >=20
> > >=20
> > >  --- Javier Sanchez <sjllera@ya.com> a =E9crit :=20
> > > >=20
> > > > This one ???
> > > >=20
> > > > CONFIG_IP_NF_MATCH_OWNER
> > > >=20
> > > > Cheers
> > > >=20
> > > > ?A
> > > > > Hello,
> > > > >=20
> > > > > What is the module required into the linux
> > kernel
> > > > to
> > > > > enable the use of the -m owner match ? The
> > name of
> > > > > this module isn t write into the howto ;(
> > > > >=20
> > > > > I have parse all the modules in netfilter
> > > > > configuration section of the kernel 2.4.27,
> > and i
> > > > didn
> > > > > t see anything about this rule .
> > > > >=20
> > > > > Greetings,
> > > > > Nicolas
> > > > >=20
> > > > >=20
> > > > > =09
> > > > >=20
> > > > > =09
> > > > > 	=09
> > > > > Vous manquez despace pour stocker vos mails ?=20
> > > > > Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
> > > > > Cr=E9ez votre Yahoo! Mail sur
> > > > http://fr.benefits.yahoo.com/
> > > > >=20
> > > > > Le nouveau Yahoo! Messenger est arriv=E9 !
> > D=E9couvrez
> > > > toutes les nouveaut=E9s pour dialoguer
> > instantan=E9ment
> > > > avec vos amis. A t=E9l=E9charger gratuitement sur
> > > > http://fr.messenger.yahoo.com
> > > > --=20
> > > > GPG Key id: 0x0EF8926E
> > > > GPG: Server - gpg.rediris.es
> > > >=20
> > > >=20
> > > > =20
> > >=20
> > >=20
> > > =09
> > >=20
> > > =09
> > > 	=09
> > > Vous manquez despace pour stocker vos mails ?=20
> > > Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
> > > Cr=E9ez votre Yahoo! Mail sur
> > http://fr.benefits.yahoo.com/
> > >=20
> > > Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez
> > toutes les nouveaut=E9s pour dialoguer instantan=E9ment
> > avec vos amis. A t=E9l=E9charger gratuitement sur
> > http://fr.messenger.yahoo.com
> > --=20
> > GPG Key id: 0x0EF8926E
> > GPG: Server - gpg.rediris.es
> >=20
> >=20
> > =20
>=20
>=20
> =09
>=20
> =09
> 	=09
> Vous manquez despace pour stocker vos mails ?=20
> Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
> Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/
>=20
> Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez toutes les nouve=
aut=E9s pour dialoguer instantan=E9ment avec vos amis. A t=E9l=E9charger =
gratuitement sur http://fr.messenger.yahoo.com
--=20
GPG Key id: 0x0EF8926E
GPG: Server - gpg.rediris.es



