From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: port translation
Date: Sun, 11 Jan 2004 13:43:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073825033.761.1.camel@elendil.intranet.cartel-securite.net>
References: <4001239D.7010904@yahoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4001239D.7010904@yahoo.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Romain Moyne <aero_climb@yahoo.fr>
Cc: netfilter@lists.netfilter.org

Le dim 11/01/2004 =E0 11:21, Romain Moyne a =E9crit :
> I have a http server (debian 3.0) behind a router (debian 3.0). I have =
a=20
> problem when I want to log the visitor's IP of my website with PHP or=20
> Perl or all language. I have always the IP of my router ! Somebody tell=
=20
> me that I must do port translation but I have searched and I haven't=20
> fand anything.
> Can you help me ?
> This is the rules of my router :
> iptables -t nat -A PREROUTING -d MyIP -p tcp --dport 80 -j DNAT=20
> --to-destination 192.168.0.3:80

You have a problem here. This single rule does not prevent your
webserver from seeing client IP as source, as you only modify
destination IP.

You may have a SNAT rule in POSTROUTING chain that is not restricting
enough and also SNAT incoming traffic to your router's IP when it should
not.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

