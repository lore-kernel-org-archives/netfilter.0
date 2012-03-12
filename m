From: Roberto Suarez Soto <robe@allenta.com>
Subject: Re: High ksoftirqd CPU load, high latency [somewhat SOLVED]
Date: Mon, 12 Mar 2012 10:30:56 +0100
Message-ID: <4F5DC250.6060108@allenta.com>
References: <4F50981E.8020107@allenta.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F50981E.8020107@allenta.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

	I think I have this nailed down, and it happens not to be related to i=
ptables=20
at all. My fault: one of the main jobs of the problematic boxes is bein=
g IPSec=20
gateways, which I shamefully forgot to say when reporting this problem.=
 And it=20
seems this is the problem.

	Using "perf top", I can see that when ksoftirq is at 100% CPU the sysc=
alls=20
being called are __xfrm4_find_bundle (occupying most of the CPU),=20
des3_ede_encrypt and des3_ede_decrypt. Last friday I thought the proble=
m were=20
just the latter two, and after some googling and finding that 3DES is a=
ctually=20
more inefficient than AES, I started to change 3DES for AES-128. But to=
day=20
it's clear that, though 3DES may be a part of the problem, the gist of =
it is=20
__xfrm4_find_bundle.

	I've been searching for some explanation about what this syscall does,=
 and=20
found a message in a forum=20
(http://www.linuxforums.org/forum/kernel/184652-high-softirq-cpu-usage-=
while-ipsec-active.html)=20
hinting to xfrm settings as the culprit. But anyway, I'm going to ask i=
n=20
openswan's list, which seems the proper place to do it.

	Thanks,

--=20
         Roberto Suarez Soto                             Allenta Consul=
ting
         robe@allenta.com                                   www.allenta=
=2Ecom
                                                            +34 881 922=
 600

Este correo electr=F3nico contiene informaci=F3n estrictamente confiden=
cial y
es de uso exclusivo del destinatario, quedando prohibida a cualquier ot=
ra
persona su revelaci=F3n, copia, distribuci=F3n, o el ejercicio de cualq=
uier
acci=F3n relativa a su contenido. Si ha recibido este mensaje por error=
, por
favor conteste a su remitente mediante correo electr=F3nico y proceda a
borrarlo de su sistema. Rogamos nos comunique inmediatamente sobre
cualquier inconveniente que pueda tener usted en relaci=F3n al env=EDo =
de este
tipo de correo electr=F3nico.

Sus datos personales ser=E1n tratados de forma confidencial y no ser=E1=
n
cedidos a terceros ajenos a ALLENTA CONSULTING, S.L. En cualquier caso,
podr=E1 ejercer los derecho de oposici=F3n, acceso, rectificaci=F3n y c=
ancelaci=F3n
de acuerdo con lo establecido en la Ley Org=E1nica 15/99, de 13 de dici=
embre,
de Protecci=F3n de Datos de Car=E1cter Personal dirigi=E9ndose a ALLENT=
A
CONSULTING, S.L. en C/Enrique Mari=F1as 36, 2=BA piso, oficina 8, 15009=
 =96 A
Coru=F1a  o en la direcci=F3n de electr=F3nico info@allenta.com

