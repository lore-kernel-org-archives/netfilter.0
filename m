From: Damon Gray <dgray@internap.com>
Subject: Re: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 15:20:59 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0506211518560.2505@dgray-test.acs.internap.com>
References: <006c01c57694$39a8d350$5100a8c0@14bis>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-79754685-871095206-1119381659=:2505"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---79754685-871095206-1119381659=:2505
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


Bad security policies aside.... :)

You could always run the telnet server on port 80. Or run netcat (aka nc)=
=20
on the box on port 80 redirecting to port 23.

-Damon-

On Tue, 21 Jun 2005, [iso-8859-1] Bruno Negr=E3o wrote:

> Hi guys,
>
> I need to create a VPN to my linux server from a remote workstation(windo=
ws)=20
> inside a private network of another company. The LAN where the workstatio=
n is=20
> located is protected by a firewall. This firewall only lets pass through=
=20
> outgoing traffic to port 80(http).
>
> I need this workstation to telnet a telnet server inside my private netwo=
rk.=20
> Is it possible to set up a tunnel over port 80 to create a VPN between th=
e=20
> workstation and my gateway, so that the workstation can telnet my interna=
l=20
> server?
>
> The network administrator where this workstation is located is inaccessib=
le,=20
> so I have to create this workaround.
>
> Thank you,
> -------------------------------------------------
> Bruno Negrao - Support Analyst
> Engepel Teleinform=E1tica. 55-31-34812311
> Belo Horizonte, MG, Brazil=20
>
>
>
---79754685-871095206-1119381659=:2505--

