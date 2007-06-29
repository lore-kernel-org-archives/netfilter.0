From: "Ric Messier" <kilroy@WasHere.COM>
Subject: RE: NAT 1:N
Date: Fri, 29 Jun 2007 14:33:50 -0600
Message-ID: <007201c7ba8c$cd856e10$68904a30$@COM>
References: <A9413ED3DA1D5A47ADDF30EC379CEDA207670F@inepmail.inep.gov.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A9413ED3DA1D5A47ADDF30EC379CEDA207670F@inepmail.inep.gov.br>
Content-Language: en-us
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
To: "'Gustavo L. P. dos Santos'" <gustavo.santos@inep.gov.br>, 'Eljas Alakulppi' <Buzer@buzer.net>, netfilter@lists.netfilter.org

Are you looking for redirect rules?
-A PREROUTING -d w.x.y.z -p tcp -m tcp --dport 80 -j DNAT =
--to-destination 172.16.0.2


You can't have two Web servers redirected through one IP address because =
there is only one port 80. You'd have to move the other Web server to =
another port. If you are looking for load balancing, you may need to =
look elsewhere.

Ric


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Gustavo L. =
P. dos Santos
Sent: Friday, June 29, 2007 2:29 PM
To: Eljas Alakulppi; netfilter@lists.netfilter.org
Subject: RES: NAT 1:N

Maybe I wasn=C2=B4t clear enought with my question, the two machines are =
web servers visible on the Internet, and I can=C2=B4t use MASQUERADE for =
this. If it was the basics i wouldn=C2=B4t bother you all. And sorry for =
the annoyance.

Cheers.,

-------------------------------------------------
 ,=3D ,-_-. =3D.  Gustavo Lima Peres dos Santos
(( /)0 0(\_)) Security Analyst - INEP=20
 `-'(. .)`-'  <gustavo.santos@inep.gov.br>
     \_/      Tel.: +55-61-2104-7684/9080
-------------------------------------------------

Esta mensagem eletr=C3=B4nica pode conter informa=C3=A7=C3=B5es =
privilegiadas e/ou confidenciais, portanto fica o seu receptor =
notificado de que qualquer dissemina=C3=A7=C3=A3o, =
distribui=C3=A7=C3=A3o ou c=C3=B3pia n=C3=A3o autorizada =C3=A9 =
estritamente proibida. Se voc=C3=AA recebeu esta mensagem indevidamente =
ou por engano, por favor, informe este fato ao remetente e a apague de =
seu computador imediatamente.

This e-mail message may contain legally privileged and/or confidential =
information, therefore, the recipient is hereby notified that any =
unauthorized dissemination, distribution or copying is strictly =
prohibited. If you have received this e-mail message inappropriately or =
accidentally, please notify the sender and delete it from your computer =
immediately.=20

-----Mensagem original-----
De: Eljas Alakulppi [mailto:Buzer@buzer.net]
Enviada em: sexta-feira, 29 de junho de 2007 17:19
Para: Gustavo L. P. dos Santos; netfilter@lists.netfilter.org
Assunto: Re: NAT 1:N


First I recomend you to read some basic documentation about iptables =
(this =20
is covered in about every iptables howto). Anyway, the command is (of =20
course, make sure you have the required modules loaded/compiled in =
kernel):
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

Gustavo L. P. dos Santos <gustavo.santos@inep.gov.br> kirjoitti Fri, 29  =

Jun 2007 23:01:41 +0300:

> Hi,
>
> 	I=C2=B4m new on the list, so don=C2=B4t get mad if my question was =
posted before. =20
> I need some help to configure a NAT 1:N with iptables. I need some =20
> examples of the syntax to implement this.
>
> 	Here is the solution, that i want to implement: I have two machines =
in =20
> my LAN, that i want to be visible on the Internet using only one valid =
=20
> IP.
>
> 	Sorry for the bad english.
>
> Cheers,
>
> -------------------------------------------------
>  ,=3D ,-_-. =3D.  Gustavo Lima Peres dos Santos
> (( /)0 0(\_)) Security Analyst - INEP
>  `-'(. .)`-'  <gustavo.santos@inep.gov.br>
>      \_/      Tel.: +55-61-2104-7684/9080
> -------------------------------------------------
>
> Esta mensagem eletr=C3=B4nica pode conter informa=C3=A7=C3=B5es =
privilegiadas e/ou =20
> confidenciais, portanto fica o seu receptor notificado de que qualquer =
=20
> dissemina=C3=A7=C3=A3o, distribui=C3=A7=C3=A3o ou c=C3=B3pia n=C3=A3o =
autorizada =C3=A9 estritamente =20
> proibida. Se voc=C3=AA recebeu esta mensagem indevidamente ou por =
engano, por =20
> favor, informe este fato ao remetente e a apague de seu computador =20
> imediatamente.
>
> This e-mail message may contain legally privileged and/or confidential =
=20
> information, therefore, the recipient is hereby notified that any =20
> unauthorized dissemination, distribution or copying is strictly =20
> prohibited. If you have received this e-mail message inappropriately =
or =20
> accidentally, please notify the sender and delete it from your =
computer =20
> immediately.
>




