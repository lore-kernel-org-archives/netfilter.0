From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: tftp clients not working on ip masquerading
Date: 08 Nov 2004 14:06:21 +0100
Message-ID: <1099919180.16891.2.camel@nostromo.bgsecm.com>
References: <58373.202.138.166.130.1099649776.squirrel@202.138.166.130>
	<49569.202.138.166.130.1099903221.squirrel@202.138.166.130>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49569.202.138.166.130.1099903221.squirrel@202.138.166.130>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 08 de 11 de 2004 a las 09:40, Wesley Jay Deypalan escribi=C3=B3:
> >>On Fri, 2004-11-05 at 05:16, Wesley Jay Deypalan wrote:
> >> hi,
> >>
> >> I have installed TFTP server and working good. Later I found out tha=
t it
> >> work only on public ip address what I mean is the TFTP Server has a =
public
> >> ip address and the client also has a public ip address. But when the
> >> client is being ip masquerading it will not connect with the server =
the
> >> error message in the server is WRQ from x.x.x.x filename 43434.doc
> >>                          tftpd: read: Connection refused
> >> the client is being masqueraded from a linux os.The masquerading use=
d is
> >> from tldp.org - rc.firewall-2.4-stronger. What is wrong with my setu=
p?
> >>
> >> TIA,
> >>
> >>
> >> Wesley
> >
> >ave you:
> >
> >  modprobe ip_conntrack_tftp
> >  modprobe ip_nat_tftp
> >
> >-j
> >
> >--
> >"Well, I'm not calling you a liar, but... I can't think of a way to
> > finish that sentence."
> >	--The Simpsons
> >
> hi,
>=20
> i tried modprobe ip_conntrack_tftp
>  but it says:
>=20
>   - Verifying that all kernel modules are ok
>     Loading kernel modules: ip_tables, ip_conntrack, ip_conntrack_ftp,
>                              ip_conntrack_irc, ip_conntrack_tftp,
> modprobe: Can't locate module ip_conntrack_tftp
> iptable_nat, ip_nat_ftp
> ip_nat_irc
>=20
>  It seems that it cant locate the module. Is there anything that i miss=
ed?
>=20
> TIA
>=20
> Wesley

You probably don't have the nat and conntrack support for tftp compiled
in your kernel. You should recompile your kernel and activate this
options in your config.

--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


