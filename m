From: =?ISO-8859-1?Q?Irm=E3os_Bocchi_=26_CIA_Ltda?= 
	<challado@ibocchi.com.br>
Subject: DNAT iptables bug or connection tracking issue?
Date: Fri, 23 May 2008 11:17:44 -0300
Message-ID: <4836D208.9040808@ibocchi.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Dear friends

I have a question, and I need your help to solve.

1) I have two routers in two different networks: one is a FreeBSD 7.0=20
router, here called "Router A" and another is a Debian 4.0 router, here=
=20
called "Router B"
2) The Router A uses pf to make the firewall rules, with standard=20
installation. The Router B have the kernel 2.6.25.4 and iptables 1.4.0
3) In the first router, I have a rule to access my vnc server in a=20
windows machine. To make these, I need to create this rule
rdr on sk0 proto tcp from any to <my external addr> port 5900 -> <my=20
internal addr> port 5900
nat on sk0 proto tcp from <my internal addr> port 5900 to any -> sk0

In resume: I need to create a rule to make the redirection and, after=20
these, I need to insert a rule to make the nat

4) In the second router, only adding this rule
iptables -t nat -I PREROUTING -i eth0 -p tcp --dport 5900 -j DNAT=20
--to-destination <my internal addr> port 5900

THE RULES WORK PERFECTLY!

It's a bug? Because, in my vision, I need to create the two rules, the=20
DNAT rule and the MASQUERADE rule to these work.
Another point of view: If I need to permit only the machines A, B and C=
=20
to access the VNC, in BSD, I only need to create these rules

my_servers=3D"{ server_a_addr, server_b_addr, server_c_addr }"
rdr on sk0 proto tcp from any to <my external addr> port 5900 -> <my=20
internal addr> port 5900
nat on sk0 proto tcp from <my internal addr> port 5900 to $my_servers -=
> sk0

or

rdr on sk0 proto tcp from $my_servers to <my external addr> port 5900 -=
>=20
<my internal addr> port 5900
nat on sk0 proto tcp from <my internal addr> port 5900 to any -> sk0

How I can make these in iptables?

Thanks for your answer

--=20
+------------------------------------------
| Att                                     =20
| Lucas Willian Bocchi
| Departamento de Tecnologia da Informa=E7=E3o
| Setor de Redes, Suporte e Desenvolvimento
| Irm=E3os Bocchi & CIA Ltda
+-------------------------------------------



------------------------------------------------
Os e-mails enviados por este dom=EDnio s=E3o verificados
por sistemas antiv=EDrus e antispam, visando a prote=E7=E3o
dos usu=E1rios e dos equipamentos de nossa empresa, bem como
para proteger o conte=FAdo e o trabalho de outros que
por ventura venham receber e-mails deste dom=EDnio.

O Grupo Bocchi se reserva no direito de, a qualquer
momento, bloquear ou inutilizar conte=FAdo de e-mails
que venham a ser prejudiciais para o ambiente de trabalho.

Caso este e-mail n=E3o possua conte=FAdo que seja relevante
=E0 sua atividade profissional, ou a do usu=E1rio que a enviou,
por favor, delete-o imediatamente.

O Grupo Bocchi n=E3o se responsabiliza por qualquer dano=20
ou preju=EDzo que a utiliza=E7=E3o indevida deste e-mail
possa causar a voc=EA ou sua empresa.

Em caso de d=FAvidas, favor entrar em contato.
---------------------------------------------


Grupo Irm=E3os Bocchi & Cia Ltda

http://www.ibocchi.com.br

