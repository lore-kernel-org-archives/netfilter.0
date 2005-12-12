From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: All interface specifications being replaced by ANYWHERE
Date: Mon, 12 Dec 2005 11:31:11 -0300
Message-ID: <439D89AF.20200@solutti.com.br>
References: <001c01c5fd16$af0deb40$0201a8c0@shodan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001c01c5fd16$af0deb40$0201a8c0@shodan>
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
To: Grant Adamson <gadamson@shaw.ca>
Cc: netfilter@lists.netfilter.org



Grant Adamson escreveu:

>Hi All,
>
>I recently redid my home gateway/NAT box with debian 3.1, and everything=

>looked to be working fine until I did a quick scan on it from outside to=

>test the firewall. All the services running appeared to be exposed. Chec=
king
>my rules with iptables -L, I found that for some reason, everywhere I ha=
d
>specified a physical interface, it had been replaced by ANYWHERE.
>
>For example, the following rule:
>
>iptables -A INPUT -m state --state NEW -i ! $EXTIF -j ACCEPT
>
>Ends up appearing in the iptables -L list as:
>
>target     prot opt source               destination
>ACCEPT     all  --  anywhere             anywhere            state NEW
>
> =20
>

    To see interfaces, you should use -v option on iptables. Interfaces=20
do not show when you use -L alone.

    I always use iptables -nL TABLENAME -v (TABLENAME is optional).

    Please check your rules with:  iptables -nL INPUT -v

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





