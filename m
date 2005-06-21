From: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Subject: Tunneling other protocols over TCP port 80
Date: Tue, 21 Jun 2005 16:05:43 -0300
Message-ID: <006c01c57694$39a8d350$5100a8c0@14bis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi guys,

I need to create a VPN to my linux server from a remote workstation(windows=
)=20
inside a private network of another company. The LAN where the workstation =
is=20
located is protected by a firewall. This firewall only lets pass through=20
outgoing traffic to port 80(http).

I need this workstation to telnet a telnet server inside my private network=
. Is=20
it possible to set up a tunnel over port 80 to create a VPN between the=20
workstation and my gateway, so that the workstation can telnet my internal =

server?

The network administrator where this workstation is located is inaccessible=
, so=20
I have to create this workaround.

Thank you,
-------------------------------------------------
Bruno Negrao - Support Analyst
Engepel Teleinform=E1tica. 55-31-34812311
Belo Horizonte, MG, Brazil=20


