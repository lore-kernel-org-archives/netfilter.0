From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 18:00:37 +0200
Message-ID: <425D4225.2030706@lopsch.com>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>	<20050413145846.GA30293@bender.817west.com>
	<1113407151.4244.9.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113407151.4244.9.camel@fly.in.iantel.com.uy>
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

Eduardo Spremolla schrieb:
> How can I know if the patches are in my version:
>=20
> kernel 		2.6.10-1.771_FC2
> iptables 	1.2.9-2.3.1
> ipsec-tools 	0.5-2.fc2
>=20
> I will test it. I did not set the POSTROUTING SNAT rule, since I
> understand make no sense in the ESP packet.
>=20
> Thanks for the clue.
>=20
> LALO
>=20
> On Wed, 2005-04-13 at 10:58 -0400, Jason Opperisano wrote:
>=20
>>On Tue, Apr 12, 2005 at 03:08:12PM -0300, Eduardo Spremolla wrote:
>>
>>>I have 2 local networks 10.2.2.0/24 and 10.37.130.0/24 interconnected =
by
>>>a ipsec tunnel running on kernel 2.6 native ipsec. So far so good.
>>>
>>>Now the admin of 10.37.130.0 wants me to NAT my network to 10.3.3.0
>>>because he had a ip conflict. I cant SNAT because when the packet goes
>>>to nat post it has been encapsulated in ESP and had the firewalls
>>>address, as you can see in the bottom log snipe.I try to use NETMAP in
>>>mangle PREROUTING, but it changes the dest ip , not the source.
>>>
>>>Is this possible?
>>>
>>>Thanks in advance for any clue.
>>
>>dunno if this will help or not; as i have lost my test lab, but have yo=
u
>>applied the ipsec patches from PoM:
>>
>>  ipsec-01-output-hooks
>>  ipsec-02-input-hooks
>>  ipsec-03-policy-lookup
>>  ipsec-04-policy-checks
>>
>>it is my understanding that these patches make packets traverse the
>>netfilter hooks twice:  once clear, and again encrypted.
>>
>>-j
>>
>>--
>>"Peter: I call it... Petoria. I was going to call it Peterland,
>> but that gay bar by the airport took it."
>>        --Family Guy
>>
>=20
>=20
>=20
> Este e-mail y cualquier posible archivo adjunto est=E1 dirigido =FAnica=
mente al destinatario del mensaje y contiene informaci=F3n que puede ser =
confidencial. Si Ud. no es el destinatario correcto por favor notifique a=
l remitente respondiendo este mensaje y elimine inmediatamente el e-mail =
y los posibles archivos adjuntos al mismo de su sistema. Est=E1 prohibida=
 cualquier utilizaci=F3n, difusi=F3n o copia de este e-mail por cualquier=
 persona o entidad que no sean las espec=EDficas destinatarias del mensaj=
e. ANTEL no acepta ninguna responsabilidad con respecto a cualquier comun=
icaci=F3n que haya sido emitida incumpliendo nuestra Pol=EDtica de Seguri=
dad de la Informaci=F3n.
> . . . . . . . . .
> This e-mail and any attachment is confidential and is intended solely f=
or the addressee(s). If you are not intended recipient please inform the =
sender inmediately, answering this e-mail and delete it as well as the at=
tached files. Any use, circulation or copy of this e-mail by any person o=
r entity that not is the specific addressee(s) is prohibited. ANTEL is no=
t responsible for any communication emitted without respecting our Inform=
ation Security Policy.
>=20
>=20

Yes try the patches that should. Because in my understandig normally the=20
  packets pass a chain only once encrypted or plain. This is so because=20
of the IPSec hooks within the Netfilter hooks and how they work. So=20
patching could also it complicates the IPSec handling for the kernel but=20
as long as it is transparent to the user ;).

