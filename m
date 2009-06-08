From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: blocking only https access
Date: Mon, 08 Jun 2009 14:01:42 -0300
Message-ID: <4A2D43F6.3000309@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi everyone,

I have blocked outgoing connections using port 443 in my network to=20
force everyone to use the webproxy. However, some non-http applications=
=20
(like ShowMyPC) uses the port 443, and don't support proxies yet. I've=20
contacted the support of the software to know with IPs do i have to=20
allow it to make the program work properly, but they said there change=20
their server IPs very often, so they recomend use the domain name to bl=
ock.

I have readed a lot here in the list and in other places that i SHOULD=20
NOT use domain names in iptables, cause it will result in a dns request=
=20
to every packet that reachs that rule.

the question is: is there a way that i can identify only SSL packets=20
that contain web content, so i can allow those who haven't, like the=20
ShowMyPc packets?


--=20

*Leonardo de Souza Carneiro*
*Veltrac - Tecnologia em Log=EDstica.*
lscarneiro@veltrac.com.br <mailto:lscarneiro@veltrac.com.br>
http://www.veltrac.com.br <http://www.veltrac.com.br/>
/Fone Com.: (43)2105-5601/
/Av. Higien=F3polis 1601 Ed. Eurocenter Sl. 803/
/Londrina- PR/
/Cep: 86015-010/

=09

