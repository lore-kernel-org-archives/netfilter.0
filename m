From: =?iso-8859-1?Q?Miguel_=C1ngel_=C1lvarez_Cabanes?=
	<ma.alvarez@usyscom.com>
Subject: Re: Embedded system and shared libs
Date: Mon, 20 Jun 2005 15:30:52 +0200
Message-ID: <1119274252.3521.70.camel@localhost.localdomain>
References: <ZIVCORREOybvQoG9Bvo00001d0e@correo.ziv.es>
	<1119009815.3521.33.camel@localhost.localdomain>
	<86is09rxfc.fsf@erwin.inf.tu-dresden.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <86is09rxfc.fsf@erwin.inf.tu-dresden.de>
Content-Class: urn:content-classes:message
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
To: Jean Wolter <jw5@os.inf.tu-dresden.de>
Cc: netfilter@lists.netfilter.org

I have tried placing the shared objects
in /usr/local/lib/iptables, /usr/local/lib, /lib, /lib/iptables... with
the same result.

Is there anything appart from the executable and the shared objects that
must be placed in the system to relate them?

About strace... I have not tried with it, because I do not have strace
on my embedded system, but I think it can be a good idea and I am going
to try to add it.

Thanks

Miguel =C1ngel


El lun, 20-06-2005 a las 15:05 +0200, Jean Wolter escribi=F3:
> Miguel =C1ngel =C1lvarez Cabanes <ma.alvarez@usyscom.com> writes:
>=20
> > - If I try to build iptables without NO_SHARED_LIBS and copy the
> > libipt*.so to /lib/iptables on my system, I can test the tables
> > (iptables -t nat -L), but I cannot do MASQUERADE or so... I obtain:
> >
> > "iptables v1.3.0: Couldn't load target `MASQUERADE':File not found
> >
> > Try `iptables -h' or 'iptables --help' for more information."
>=20
> The default location for the iptables shared objects is
> /usr/local/lib/iptables, did you change this? have you tried to use
> strace to find out where iptables looks for the shared object files?
>=20
> regards,
> Jean=20
=20
----------------------------------------- PLEASE NOTE =
-------------------------------------------
This message, along with any attachments, may be confidential or legally =
privileged.=20
It is intended only for the named person(s), who is/are the only =
authorized recipients.
If this message has reached you in error, kindly destroy it without =
review and notify the sender immediately.
Thank you for your help.
=B5SysCom uses virus scanning software but excludes any liability for =
viruses contained in any attachment.
=20
------------------------------------ ROGAMOS LEA ESTE TEXTO =
-------------------------------
Este mensaje y sus anexos pueden contener informaci=F3n confidencial y/o =
con derecho legal.=20
Est=E1 dirigido =FAnicamente a la/s persona/s o entidad/es rese=F1adas =
como =FAnico destinatario autorizado.
Si este mensaje le hubiera llegado por error, por favor elim=EDnelo sin =
revisarlo ni reenviarlo y notif=EDquelo inmediatamente al remitente. =
Gracias por su colaboraci=F3n. =20
=B5SysCom utiliza software antivirus, pero no se hace responsable de los =
virus contenidos en los ficheros anexos.

