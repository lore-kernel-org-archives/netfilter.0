From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Sun, 18 Dec 2005 03:42:43 -0300
Message-ID: <43A504E3.9070706@solutti.com.br>
References: <20051110032733.GA19073@bostoncoop.net>	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>	<20051114145348.GA12841@bostoncoop.net>	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>	<4378A8B1.8010206@rosi-kessel.org>	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>	<4379E61F.5000807@rosi-kessel.org>	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>	<20051115235319.GA1727@bostoncoop.net>	<Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
	<20051118015254.GA21128@bostoncoop.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051118015254.GA21128@bostoncoop.net>
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
To: Adam Rosi-Kessel <adam@rosi-kessel.org>, netfilter@lists.netfilter.org


>
># iptables -t nat -L -n
>Chain PREROUTING (policy ACCEPT)
>target     prot opt source               destination        =20
>
>Chain POSTROUTING (policy ACCEPT)
>target     prot opt source               destination        =20
>SNAT       all  --  192.168.98.0/24      0.0.0.0/0           to:EXTERNAL=
_IP_OF_NAT_BOX=20
> =20
>

    Adam, have you tried adding a properly PREROUTING rule for this=20
specific traffic ? It would be like

iptables -t nat -A PREROUTING -p udp -d EXTERNAL_IP_OF_NAT_BOT --dport=20
500 -j DNAT --to LOCAL_CLIENT

    Other test I would suggest ....... have you tried some other UDP=20
traffic, just like DNS and see if it works ? Have you tried some TCP=20
traffic and see if it works fine ?

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





