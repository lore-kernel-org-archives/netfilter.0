From: =?koi8-r?B?6czY0SD7ydDJw8nO?= <ilia@chel.skbkontur.ru>
Subject: Re: [squid-users] How to allow traffic other than http
Date: Thu, 14 Nov 2002 14:07:22 +0500 (YEKT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021114140147.I57053-100000@sol.chel.skbkontur.ru>
References: <AAEOLIGMOIBLFHGNBBEMCEHMCBAA.glens@cybercorpinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AAEOLIGMOIBLFHGNBBEMCEHMCBAA.glens@cybercorpinc.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="koi8-r"
To: Glen Spidal <glens@cybercorpinc.com>
Cc: Net Filter <netfilter@lists.netfilter.org>, Squid Users <squid-users@squid-cache.org>

Salut, Glen Spidal !

you may want to use https proxy.

It worked for me in the following way:

1) CONNECT_ports (or somewhat like that), you have to allow "connect"
   to all ports.

2) desproxy. http://www.freshmeat.net -> search there for desproxy.
   desproxy is tool to encapsulate SOCKS protocol into CONNECT requests.
   even Basic authorization is supported.

3) www.socks.nec.com -> download sockscap library (exists for Windows,
   and major Unices). that library will wrap TCP requests into SOCKS.
   (it'l wrap actually everything, ICMP, UDP ... but CONNECT is only for
   TCP, what actually serves SMTP, IMAP, POP3, IRC and many more)

that's it. run desproxy, run sockscap, then run "socksified" app from
sockscap.

let me know whether it works for you.
(and maybe ?? you wanted to implement something completely different,
sorry for misunderstanding :-)

On Tue, 12 Nov 2002, Glen Spidal wrote:

> I have servers set up as diagramed below.  Proxied web traffic work fine.
> Email fails.
> I can send mail from the Linux box via Pine.  Email server is at external
> ISP.
>
> +------------------------+
> |                        |
> |  DirectWay Satellite   |
> |                        |
> +------------------------+
>             |
>             |        +------------------------+
>             |        | Windows 2000 Pro       |
>             |        |                        |
>             |        | 10.111.45.249          |
>             +--------------------------       |
>                      | 255.255.255.0  |       |
>                      |                |       |
>                      |            NAT/DHCP    |  Connection Shared using =
W2K
> wizard
>                      | 192.168.0.1    |       |
>             +--------------------------       |
>             |        | 255.255.255.0          |
>             |        +------------------------+
>      Cross-Over Cable
>             |        +------------------------+
>             |        |     Redhat 7.3         |
>             |        |  DHCP (192.168.0.x)    |
>             +--------------------------       |  Squid Proxy
>                      |  255.255.255.0         |  Dan's Guardian web filte=
r
>                      |                        |
>                      |  192.168.254.250       |
>             +--------------------------       |
>             |        |  255.255.0.0           |
>             |        |                        |
>             |        +------------------------+
>             |
>             |
> +-----------+-------------+
> |          Hub            |
> |                         |
> +--+---------+------------+
>    |         |
>    |    +----+------------+
>    |    | Wintel Clients  | Default Gateway =3D 192.168.254.250
>    |    +-----------------+
>    |
>    |    +-----------------+
>    |    | Win2K Server    |
>    |    | 192.168.254.254 |
>    +----+---------------  |  DHCP Server
>         | 255.255.0.0     |
>         |                 |
>         +-----------------+
>
>
>
> Glen Spidal
> Cybercorp Computers, Hillsboro Oregon
> PH: 503-681-9786  FX: 503-615-2936
> www.cybercorpinc.com
>

Regards, (=EE=C1=C9=CC=D5=DE=DB=C9=C5 =D0=CF=D6=C5=CC=C1=CE=C9=D1)
Ilia Chipitsine (=E9=CC=D8=D1 =FB=C9=D0=C9=C3=C9=CE)




