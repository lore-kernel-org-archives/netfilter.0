From: Romain Moyne <aero_climb@yahoo.fr>
Subject: Re: port translation
Date: Sun, 11 Jan 2004 14:45:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40015381.1090803@yahoo.fr>
References: <4001239D.7010904@yahoo.fr>	 <1073825033.761.1.camel@elendil.intranet.cartel-securite.net>	 <40014750.5000300@yahoo.fr> <1073827964.769.16.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073827964.769.16.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Cedric Blancher a =E9crit :

>Le dim 11/01/2004 =E0 13:53, Romain Moyne a =E9crit :
> =20
>
>>Ok. I begin to understand... Now I have corrected my rules :
>>iptables -t nat -A POSTROUTING -j SNAT -o ppp0 --to-source My_ip_on_inter=
net
>>   =20
>>
>
>OK, fine. Now it should work ;)
>
> =20
>
>>But now I have a new problem : My router, my http server and my=20
>>workstation are connected with a hub.
>>   =20
>>
>[Snip ASCII art]
> =20
>
>>I can't access to my webserver with my workstation and it very painful....
>>Can you still help me ? :-D
>>   =20
>>
>
>To complete Antony's answer, trying to reach your webserver from your
>LAN with its public IP is a common issue that constitue a FAQ.
>
>We will describe what happens when your workstation (WS) tries to
>connect to your Webserver (WB) via your router (R) public IP (PPP0).
>
>	WS sends a SYN to R, port 80
>		SYN : WS -> PPP0
>
>	R receive the SYN and DNAT it to WB, port 80
>		SYN : WS -> WB
>
>	WB receive the SYN and answers.
>		SYN,ACK : WB -> WS
>
>But, as WB and WS are on the same network, WB answers directly to WS,
>without using R as gateway. So, WS receive a SYN,ACK from WB, but was
>waiting for a SYN,ACK from PPP0. That's why the connection fails.
>
>To address this issue, you have to SNAT this kind of connection on the
>router so WB answers through R :
>
>	iptables -t nat -A POSTROUTING -s $LAN -d $WB -j SNAT --to $ETH0
> =20
>
What must I write instead of $LAN and $ETH0 ?

>I completly agree Antony's advice on DMZ use. From security point of
>vue, redirecting a service within LAN is a major architectural flaw.
>
> =20
>



