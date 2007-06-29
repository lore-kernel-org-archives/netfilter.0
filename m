From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: NAT 1:N
Date: Fri, 29 Jun 2007 23:19:02 +0300
Message-ID: <op.tuo9d0w0rtqp7s@hagumi>
References: <A9413ED3DA1D5A47ADDF30EC379CEDA207670E@inepmail.inep.gov.br>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <A9413ED3DA1D5A47ADDF30EC379CEDA207670E@inepmail.inep.gov.br>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="utf-8"
To: "Gustavo L. P. dos Santos" <gustavo.santos@inep.gov.br>, netfilter@lists.netfilter.org

First I recomend you to read some basic documentation about iptables (thi=
s =20
is covered in about every iptables howto). Anyway, the command is (of =20
course, make sure you have the required modules loaded/compiled in kernel=
):
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

Gustavo L. P. dos Santos <gustavo.santos@inep.gov.br> kirjoitti Fri, 29 =20
Jun 2007 23:01:41 +0300:

> Hi,
>
> 	I=C2=B4m new on the list, so don=C2=B4t get mad if my question was pos=
ted before. =20
> I need some help to configure a NAT 1:N with iptables. I need some =20
> examples of the syntax to implement this.
>
> 	Here is the solution, that i want to implement: I have two machines in=
 =20
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
> Esta mensagem eletr=C3=B4nica pode conter informa=C3=A7=C3=B5es privile=
giadas e/ou =20
> confidenciais, portanto fica o seu receptor notificado de que qualquer =
=20
> dissemina=C3=A7=C3=A3o, distribui=C3=A7=C3=A3o ou c=C3=B3pia n=C3=A3o a=
utorizada =C3=A9 estritamente =20
> proibida. Se voc=C3=AA recebeu esta mensagem indevidamente ou por engan=
o, por =20
> favor, informe este fato ao remetente e a apague de seu computador =20
> imediatamente.
>
> This e-mail message may contain legally privileged and/or confidential =
=20
> information, therefore, the recipient is hereby notified that any =20
> unauthorized dissemination, distribution or copying is strictly =20
> prohibited. If you have received this e-mail message inappropriately or=
 =20
> accidentally, please notify the sender and delete it from your computer=
 =20
> immediately.
>



