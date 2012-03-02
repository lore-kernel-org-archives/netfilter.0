From: Roberto Suarez Soto <robe@allenta.com>
Subject: Re: High ksoftirqd CPU load, high latency
Date: Fri, 02 Mar 2012 13:20:26 +0100
Message-ID: <4F50BB0A.3050102@allenta.com>
References: <4F50981E.8020107@allenta.com> <jiqc9s$245$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jiqc9s$245$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Kerin Millar <kerframil@gmail.com>
Cc: netfilter@vger.kernel.org

El 02/03/12 12:52, Kerin Millar escribi=F3:

> For this issue, I've found that irqbalance works wonders. I recommend=
 using
> version 1.0 or greater and running it as a daemon. To get the best ou=
t of it,
> I'd also recommend building a kernel with the following patch.

	Sorry, I forgot to say that we're already using it. Version 0.56, thou=
gh,=20
which is the one that comes in Debian Squeeze. I'll see if it's easy to=
 make a=20
backport.

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

