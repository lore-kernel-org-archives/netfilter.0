From: CompuGenic <pablo@compugenic.com>
Subject: Re: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 14:27:40 -0700
Message-ID: <BAY0-SMTP08C231D66242CEA0C5142DBCE80@phx.gbl>
References: <006c01c57694$39a8d350$5100a8c0@14bis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <42B8864C.1090605@compugenic.com>
In-Reply-To: <006c01c57694$39a8d350$5100a8c0@14bis>
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
To: =?ISO-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Cc: netfilter@lists.netfilter.org

If all you want is a remote and/or secure shell, just use SSH like the=20
others already said. If you MUST have full VPN, setup OpenVPN on the=20
remote linux box, as it can run on any single TCP/UDP port. See=20
http://openvpn.net/howto.html for details.

-Pablo


Bruno Negr=E3o wrote:

> Hi guys,
>
> I need to create a VPN to my linux server from a remote=20
> workstation(windows) inside a private network of another company. The=20
> LAN where the workstation is located is protected by a firewall. This=20
> firewall only lets pass through outgoing traffic to port 80(http).
>
> I need this workstation to telnet a telnet server inside my private=20
> network. Is it possible to set up a tunnel over port 80 to create a=20
> VPN between the workstation and my gateway, so that the workstation=20
> can telnet my internal server?
>
> The network administrator where this workstation is located is=20
> inaccessible, so I have to create this workaround.
>
> Thank you,
> -------------------------------------------------
> Bruno Negrao - Support Analyst
> Engepel Teleinform=E1tica. 55-31-34812311
> Belo Horizonte, MG, Brazil
>
>
>

