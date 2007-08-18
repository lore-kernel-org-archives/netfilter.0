From: Richard <netfilter@ghz.fr>
Subject: Re: RES: RES: IPtables settings to access a backup FTP
Date: Sat, 18 Aug 2007 21:58:55 +0200
Message-ID: <46C74F7F.4080502@ghz.fr>
References: <01ac01c7e1d0$3d1a00f0$150aa8c0@station21>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01ac01c7e1d0$3d1a00f0$150aa8c0@station21>
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
To: Patrik <patrik@chorus.com.br>, netfilter@lists.netfilter.org

thanks but I don't understant about the eth1, my network only runs on=20
eth0 ... could you explain what the whole line does?

Thanks !

Patrik a =E9crit :
> --syn is a Synonym for --tcp-flags SYN, RST and ACK
>=20
>=20
>=20
>   Chorus Informatica=20
> Patrik Souza - Diretor=20
>   Fone: 11 5621-6177
> Mobile: 11 8154-0794
> =20
> A informa=E7=E3o contida nesta mensagem =E9 confidencial. =C9 destinada=
 somente para
> uso do(s) indiv=EDduo(s) e/ou entidade(s) para os quais foi endere=E7ad=
a. Se
> voc=EA n=E3o =E9 o destinat=E1rio pretendido, fica desde j=E1 notificad=
o de que
> qualquer revela=E7=E3o, c=F3pia, dissemina=E7=E3o ou uso desta mensagem=
 ou das
> informa=E7=F5es nela contidas =E9 estritamente proibido. Se voc=EA rece=
beu esta
> mensagem erroneamente, por favor, notifique-nos por correio eletr=F4nic=
o e
> apague-a do seu sistema. / The information contained in this message is
> confidential. It is intended solely for the use of the individual(s) an=
d/or
> entity (ies) addressed above. If you are not the intended recipient, yo=
u are
> hereby notified that any disclosure, copying, dissemination or using th=
is
> message or the information contained herein is strictly prohibited. If =
you
> have received this message in error, please notify us by electronic mai=
l and
> please delete the message from your system.
> =20
>=20
> -----Mensagem original-----
> De: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] Em nome de Richard
> Enviada em: s=E1bado, 18 de agosto de 2007 16:27
> Para: patrik@chorus.com.br; netfilter@lists.netfilter.org
> Assunto: Re: RES: IPtables settings to access a backup FTP
>=20
> Hi thanks, could you explain what this line does ?
>=20
> This is what I understand :
>=20
> Foward incomming form eth0 to Output eth1 with tcp port 21 but I dont=20
> understant the --syn or exactly what this whole line does ...
>=20
> Patrik a =E9crit :
>> Richard, try to use=20
>>
>> # iptables -A FORWARD  -i eth0 -o eth1 -p tcp --syn --dport 21 -j ACCE=
PT=20
>>
>> I think that=B4s solve
>>
>>
>>   Chorus Informatica=20
>> Patrik Souza - Diretor=20
>>   Fone: 11 5621-6177
>> Mobile: 11 8154-0794
>> =20
>> A informa=E7=E3o contida nesta mensagem =E9 confidencial. =C9 destinad=
a somente
> para
>> uso do(s) indiv=EDduo(s) e/ou entidade(s) para os quais foi endere=E7a=
da. Se
>> voc=EA n=E3o =E9 o destinat=E1rio pretendido, fica desde j=E1 notifica=
do de que
>> qualquer revela=E7=E3o, c=F3pia, dissemina=E7=E3o ou uso desta mensage=
m ou das
>> informa=E7=F5es nela contidas =E9 estritamente proibido. Se voc=EA rec=
ebeu esta
>> mensagem erroneamente, por favor, notifique-nos por correio eletr=F4ni=
co e
>> apague-a do seu sistema. / The information contained in this message i=
s
>> confidential. It is intended solely for the use of the individual(s)
> and/or
>> entity (ies) addressed above. If you are not the intended recipient, y=
ou
> are
>> hereby notified that any disclosure, copying, dissemination or using t=
his
>> message or the information contained herein is strictly prohibited. If=
 you
>> have received this message in error, please notify us by electronic ma=
il
> and
>> please delete the message from your system.
>> =20
>> -----Mensagem original-----
>> De: netfilter-bounces@lists.netfilter.org
>> [mailto:netfilter-bounces@lists.netfilter.org] Em nome de Richard
>> Enviada em: s=E1bado, 18 de agosto de 2007 16:09
>> Para: netfilter@lists.netfilter.org
>> Assunto: IPtables settings to access a backup FTP
>>
>> Hello, this is my first message so I hope I'm doing this right ! :)
>>
>> I've got iptables setup and running well on my server and up to now I'=
ve=20
>> not had any problems, however I have just installed a backup system=20
>> which needs to connect by FTP to a distant server.
>>
>> With my firewall disactivated all works fine, however with the firewal=
l=20
>> activated when I use the "ls" command of the debian ftp command line=20
>> package (CWD) I get:
>>
>> 200 ok then a long wait then :
>> 421 Service not available, remote server has closed connection.
>>
>> I've tried this on two different FTP's and it only works if the firewa=
ll=20
>> is disactivated.
>>
>> One server is a plesk server but the server I need to connect to I do=20
>> not know much about, with filezilla on my pc I've managed to connect t=
o=20
>> it with both FTP active and FTP passive so I guess it can do both.
>>
>> On my server I just do :
>>
>> ftp ftp.server.com
>> username
>> password
>>
>> So I'm not sure if it connects as passive or active.
>>
>> These are the ports that I have got open :
>>
>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>
>> -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
>> -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
>>
>> -A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
>> -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
>>
>> Which ports do you suggest I should open to connect to this FTP server=
 ?
>>
>> Thanks in advance,
>>
>> Richard
>>
>>
>>
>=20
>=20

