From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: Comments at end of iptables statements
Date: Mon, 18 Jun 2007 09:14:49 -0300
Message-ID: <46767739.4090306@solutti.com.br>
References: <4675658C.6010309@victorex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4675658C.6010309@victorex.com>
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
To: "John V. Kjellman" <johnk@victorex.com>
Cc: netfilter@lists.netfilter.org



John V. Kjellman escreveu:
> Any chance that a "#" or other character will one day be allowed as a=20
> comment character at the end of iptables statements?
>

    You can use the comment module !! It allows you to easily grep=20
'iptables -nL -v' output. I used it a LOT for creating IP Accounting=20
rules which will be graphed by cacti.


iptables -A accounting_local_saida -p tcp --dport 80 -m comment=20
--comment servidor_web
iptables -A accounting_local_saida -p tcp --sport 80 -m comment=20
--comment servidor_web

iptables -A accounting_local_entrada -p tcp --dport 25 -m comment=20
--comment entrada_emails
iptables -A accounting_local_saida -p tcp --sport 25 -m comment=20
--comment entrada_emails


Chain accounting_local_entrada (1 references)
 pkts bytes target     prot opt in     out     source              =20
destination       =20
73718   85M            tcp  --  *      *       0.0.0.0/0           =20
0.0.0.0/0           tcp dpt:25 /* entrada_emails */
  231 50718            tcp  --  *      *       0.0.0.0/0           =20
0.0.0.0/0           tcp dpt:80 /* servidor_web */


Chain accounting_local_saida (1 references)
 pkts bytes target     prot opt in     out     source              =20
destination       =20
54932 2640K            tcp  --  *      *       0.0.0.0/0           =20
0.0.0.0/0           tcp spt:25 /* entrada_emails */
  202  113K            tcp  --  *      *       0.0.0.0/0           =20
0.0.0.0/0           tcp spt:80 /* servidor_web */

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





